package org.spring.library.Controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
// import java.util.Map;
// import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class MainController {

    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    static Connection connection = ConnectDB.getConnection();


    private  boolean isAuthenticated(String password, String pass)  {
        return encoder.matches(pass,password);
    }

    private static boolean isValidEmail(String email) {
        String regex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    @RequestMapping("/library")
    public String RedirectToHome(){
        return "redirect:/index.jsp";
    }

    @RequestMapping( path = "/LoginServlet",method = RequestMethod.POST)
    public String dashboard(@RequestParam("username") String name, @RequestParam("password") String pass, HttpSession session) throws Exception {
        PreparedStatement ps = connection.prepareStatement("Select * from Users where username = ?");
        ps.setString(1, name);
        ResultSet resultSet = ps.executeQuery();
        String password = "",roles = "";
        if (resultSet.next()) {
            password += resultSet.getString("password");
            roles += resultSet.getString("role");
        } else {
            throw new Exception("User not exists. Please create an account.");
        }

        if (isAuthenticated(password, pass)) {
           if(roles.equals("STUDENT")){
               session.setAttribute("username",resultSet.getString(1));
               return "studentDashboard";
           }else {
               return "adminDashboard";
           }
        }
        return "error";
    }


    @RequestMapping(path = "/RegisterServlet", method = RequestMethod.POST)
    public String  register(@RequestParam("username") String name,
                            @RequestParam("password") String password,
                            @RequestParam("email") String email,
                            @RequestParam("confirmPassword") String pass
                            ) throws Exception {

        if(!pass.equals(password)) throw new Exception("Password not matched.");
        PreparedStatement st = connection.prepareStatement("Select * from users where username = ?");
        st.setString(1,name);
        ResultSet resultSet = st.executeQuery();
        if(resultSet.next()){
            throw new Exception("Username already exists please try with different name.");
        }
        if(!isValidEmail(email)) throw new Exception("Email is not a valid email address Please enter a valid email.");
       String newPassword = encoder.encode(pass);
        PreparedStatement ps = connection.prepareStatement("INSERT INTO users (username,password,email) values (?,?,?)");
        ps.setString(1,name);
        ps.setString(2,newPassword);
        ps.setString(3,email);
        ps.executeUpdate();
        return "redirect:/index.jsp";
    }

    @RequestMapping("/processReturn")
    public String processReturn(@RequestParam("bookId") int id, HttpSession session) throws SQLException {
        String name = session.getAttribute("username").toString();
        Connection connection = ConnectDB.getConnection();
        String query = "update books set available_copies = available_copies + 1 where book_id = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setInt(1,id);
        ps.executeUpdate();
        String q = "delete from borrowed_books where username = ? and book_id = ?";
        PreparedStatement preparedStatement1 = connection.prepareStatement(q);
        preparedStatement1.setString(1,name);
        preparedStatement1.setInt(2,id);
        preparedStatement1.executeUpdate();
        preparedStatement1.close();
        ps.close();
        return "return";
    }

    @RequestMapping("/AdminController")
    public String handleAction(@RequestParam("action") String action){
        String finalAction = "";
        switch (action){
            case "addBook" -> finalAction =  "addBook";
            case "removeBook" -> finalAction = "removeBook";
        }
        return finalAction;
    }

    @RequestMapping("/admin")
    public String adminPanel(){
        return "adminDashboard";
    }
}
