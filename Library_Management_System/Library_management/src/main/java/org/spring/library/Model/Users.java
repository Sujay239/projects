package org.spring.library.Model;

import java.util.List;

public class Users {
    private String userName;
    private String password;
    private String email;
    private String role;


    public Users() {
        super();
    }

    public Users(String userName, String password, String email, String role) {
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.role = role;
//        this.borrowedBooks = borrowedBooks;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }


//    public List<Book> getBorrowedBooks() {
//        return borrowedBooks;
//    }
//
//    public void setBorrowedBooks(List<Book> borrowedBooks) {
//        this.borrowedBooks = borrowedBooks;
//    }
}
