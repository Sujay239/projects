package org.spring.library.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {


    @RequestMapping("/search_book")
    public String searchForBook(){
        return "search_book";
    }

    @RequestMapping("/borrowBook")
    public String borrowABook(){
        return "borrowBook";
    }

    @RequestMapping("/returnABook")
    public String returnABook(){
        return "return";
    }

    @RequestMapping("/myBooks")
    public String myBorrowed(){
        return "myBorrowed";
    }

    @RequestMapping("/logout")
    public String logout(){
        return "redirect:/index.jsp";
    }
}
