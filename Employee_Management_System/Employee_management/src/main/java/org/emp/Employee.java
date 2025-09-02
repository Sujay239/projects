package org.emp;

public class Employee {
    private String name;
    private int age;
    private String skills;
    private double salary;

    @Override
    public String toString() {
        return "Employee{" +
                "name='" + name + '\'' +
                ", gae=" + age +
                ", skills='" + skills + '\'' +
                ", salary=" + salary +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Employee(){
        super();
    }

    public Employee(String name, int age, String skills, double salary) {
        this.name = name;
        this.age = age;
        this.skills = skills;
        this.salary = salary;
    }
}
