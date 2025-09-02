package org.spring.library.Controller;

import org.spring.library.Model.Book;
import org.spring.library.Model.Users;
import org.spring.library.Model.borrowerDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {
    Connection connection = ConnectDB.getConnection();

    @RequestMapping("/addBook")
    public String add(@RequestParam("title") String title,
                      @RequestParam("author") String author,
                      @RequestParam("copies") int total) throws SQLException {
        String query = "Insert into books (title,author,available_copies) values (?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1,title);
        preparedStatement.setString(2,author);
        preparedStatement.setInt(3,total);
        int i = preparedStatement.executeUpdate();
        if(i > 0){
            return "success";
        }
        return "error";
    }


    @RequestMapping("/removeBook")
    public String remove(@RequestParam("bookId") int id) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("DELETE from books where book_id = ?");
        preparedStatement.setInt(1,id);
        int i = preparedStatement.executeUpdate();
        if(i > 0) return "success";
        return "error";
    }

    @RequestMapping("/viewAllBooks")
    public String viewAllBooks(Model model) throws SQLException {
        List<Book> books = new ArrayList<>();
        PreparedStatement ps = connection.prepareStatement("SELECT * from books");
        ResultSet resultSet = ps.executeQuery();
        while (resultSet.next()){
            int id = resultSet.getInt(1);
            String title = resultSet.getString(2);
            String author = resultSet.getString(3);
            int copies = resultSet.getInt(4);
            Book book = new Book(id,title,author,copies);
            books.add(book);
        }
        model.addAttribute("books" , books);
        return "viewBooks";
    }


    @RequestMapping("/viewAllUsers")
    public String viewAllUsers(Model model) throws SQLException {
        List<Users> users = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from users");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            String name = resultSet.getString(1);
            String pass = resultSet.getString(2);
            String email = resultSet.getString(3);
            String role = resultSet.getString(4);
            users.add(new Users(name,pass,email,role));
        }
        model.addAttribute("users",users);
        return "viewUsers";
    }

    @RequestMapping("/viewBorrows")
    public String viewBorrows(Model model) throws SQLException {
        List<borrowerDetails> list = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from borrowed_books");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            int b = resultSet.getInt(1);
            int bi  = resultSet.getInt(2);
            String name = resultSet.getString(3);
            String Action = resultSet.getDate(4).toString();
            String expiry = resultSet.getDate(5).toString();
            list.add(new borrowerDetails(b,bi,name,Action,expiry));
        }
        model.addAttribute("activities",list);
        return "viewBorrows";
    }
}
