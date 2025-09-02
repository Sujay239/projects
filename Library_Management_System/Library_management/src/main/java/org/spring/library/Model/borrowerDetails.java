package org.spring.library.Model;


public class borrowerDetails {
    private int borrow_id;
    private int book_id;
    private String username;
    private String actionDate;
    private String expiryDate;

    public borrowerDetails(int borrow_id, int book_id, String username, String actionDate, String expiryDate) {
        this.borrow_id = borrow_id;
        this.book_id = book_id;
        this.username = username;
        this.actionDate = actionDate;
        this.expiryDate = expiryDate;
    }

    public borrowerDetails() {
        super();
    }

    public int getBorrow_id() {
        return borrow_id;
    }

    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getActionDate() {
        return actionDate;
    }

    public void setActionDate(String actionDate) {
        this.actionDate = actionDate;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
}
