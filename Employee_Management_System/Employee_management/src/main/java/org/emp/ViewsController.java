package org.emp;//package com.spring_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.sql.*;
import java.util.*;

@Controller
public class ViewsController {
    @RequestMapping("/add")
    public String add() {
        return "addEmp";
    }

    @RequestMapping("/del")
    public String delete() {
        return "delete";
    }

    @RequestMapping("/viewSingle")
    public String view() {
        return "singleEmp";
    }

    @RequestMapping("/askPassword")
    public String ask() {
        return "askPass";
    }

    @RequestMapping(path = "/viewsingle", method = RequestMethod.POST)
    public String viewSingle(@RequestParam("id") int id, Model model) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring", "root", "admin@123");
        PreparedStatement preparedStatement = connection
                .prepareStatement("SELECT * from employee_details where id = ?");
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            model.addAttribute("id", resultSet.getInt(1));
            model.addAttribute("name", resultSet.getString(2));
            model.addAttribute("age", resultSet.getInt(3));
            model.addAttribute("skills", resultSet.getString(4));
            model.addAttribute("salary", resultSet.getDouble(5));
            return "single";
        }
        return "error";
    }

    @RequestMapping(path = "/added", method = RequestMethod.POST)
    public String added(@RequestParam("name") String name,
            @RequestParam("age") int age,
            @RequestParam("skill") String skills,
            @RequestParam("salary") double salary) throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring", "root", "admin@123");
        String query = "Insert into employee_details(name,age,skills,salary) values (?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, name);
        preparedStatement.setInt(2, age);
        preparedStatement.setString(3, skills);
        preparedStatement.setDouble(4, salary);
        int i = preparedStatement.executeUpdate();
        connection.close();
        preparedStatement.close();
        if (i > 0) {
            return "success";
        } else {
            return "error";
        }
    }


    @RequestMapping(path = "/added", method = RequestMethod.POST)
    public String added(@ModelAttribute Employee emp) throws Exception {
        System.out.println(emp);
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring", "root", "admin@123");
        String query = "Insert into employee_details(name,age,skills,salary) values (?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, emp.getName());
        preparedStatement.setInt(2,emp.getAge());
        preparedStatement.setString(3,emp.getSkills());
        preparedStatement.setDouble(4,emp.getSalary());
        int i = preparedStatement.executeUpdate();
        connection.close();
        preparedStatement.close();
        if (i > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    @RequestMapping("/deleted")
    public String deleted(@RequestParam("id") int id) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/spring", "root", "admin@123");
        String query = "delete from employee_details where id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, id);
        int i = preparedStatement.executeUpdate();
        connection.close();
        preparedStatement.close();
        if (i > 0) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("/dataEmp")
    public String database(Model model, @RequestParam("dbPassword") String pass) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/spring", "root", pass);
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM employee_details");

        List<Map<String, Object>> employees = new ArrayList<>();

        while (rs.next()) {
            Map<String, Object> emp = new HashMap<>();
            emp.put("id", rs.getInt("id"));
            emp.put("name", rs.getString("name"));
            emp.put("age", rs.getInt("age"));
            emp.put("skills", rs.getString("skills"));
            emp.put("salary", rs.getDouble("salary"));
            employees.add(emp);
        }

        model.addAttribute("dataset", employees);

        rs.close();
        stmt.close();
        connection.close();

        return "employeeTable"; // JSP name
    }

}
