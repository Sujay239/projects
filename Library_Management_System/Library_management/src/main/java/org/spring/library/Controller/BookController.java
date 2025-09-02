package org.spring.library.Controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Controller
public class BookController {

    @RequestMapping("/BorrowBookServlet")
    public String borrowBook(@RequestParam("bookId") int bookId, HttpSession session, Model model) throws SQLException {
        String name = session.getAttribute("username").toString();
            Connection connection = ConnectDB.getConnection();
            PreparedStatement ps = connection.prepareStatement("insert into borrowed_books (book_id,username) values (?,?)");
            ps.setInt(1,bookId);
            ps.setString(2,name);
            int i = ps.executeUpdate();
            if(i > 0){
                model.addAttribute("message" , "✅ Book borrowed successfully!");
            }else {
                model.addAttribute("message" , " Failed to borrow Book!");
            }
        return  "borrowBook";
    }
}
