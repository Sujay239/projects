package org.spring.library.Controller;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectDB {
    private static final String url = "jdbc:mysql://localhost:3306/library";
    private static final String userName = "root";
    private static final String password = "admin@123";

    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url,userName,password);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return null;
    }
}
