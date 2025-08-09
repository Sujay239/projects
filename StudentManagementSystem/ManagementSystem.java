package StudentManagementSystem;

import java.util.HashMap;
import java.util.Scanner;

public class ManagementSystem implements operations
{
    private final HashMap<Long,Student> students = new HashMap<>();
    Scanner sc = new Scanner(System.in);

    @Override
    public void addStudent() {
        try {
            System.out.print("Enter roll number : ");
            long roll = sc.nextLong();
            sc.nextLine();
            if (isExists(students, roll)) {
                System.out.println("Student with this roll number already exists. Please try with different roll number.");
                return;
            }
            System.out.print("Enter name : ");
            String name = sc.nextLine();
            System.out.print("Enter age : ");
            int age = sc.nextInt();
            sc.nextLine(); // Consume newline character
            if (age < 0) {
                throw new Exception("Age cannot be negative.");
            }
            if (name.isEmpty()) {
                throw new Exception("Name cannot be empty.");
            }
            System.out.print("Enter enrolled course : ");
            String course = sc.nextLine();
            System.out.print("Enter marks obtained : ");
            double marks = sc.nextDouble();
            if (marks < 0) {
                throw new Exception("Marks cannot be negative.");
            }
            if (course.isEmpty()) {
                throw new Exception("Course cannot be empty.");
            }
            if (roll <= 0) {
                throw new Exception("Roll number must be positive.");
            }
            students.put(roll, new Student(roll, name, age, course, marks));
            System.out.println("Student added successfully.");
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void viewStudents() {
        System.out.print("Enter roll number : ");
        long roll = sc.nextLong();
        sc.nextLine();
        if(!isExists(students,roll)){
            System.out.println("Student does not exits. Please try again.");
            return;
        }
        System.out.println(students.get(roll));
    }

    @Override
    public void updateStudent() {
        System.out.print("Enter roll number : ");
        long roll = sc.nextLong();
        if(!isExists(students,roll)){
            System.out.println("Student does not exits. Please try again.");
            return;
        }
        sc.nextLine();
        //Update options any type of update all combination
        System.out.println("What do you want to update?");
        System.out.println("1. Name");
        System.out.println("2. Age");
        System.out.println("3. Course");
        System.out.println("4. Marks");
        System.out.println("5. Name & age");
        System.out.println("6. Name & course");
        System.out.println("7. Name & marks");
        System.out.println("8. Age & course");
        System.out.println("9. Age & marks");
        System.out.println("10. Course & marks");
        System.out.println("11. All");
        System.out.print("Enter your choice : ");
        int choice = sc.nextInt();
        sc.nextLine();
        switch (choice){
            case 1 -> {
                System.out.print("Enter new name : ");
                String name = sc.nextLine();
                students.get(roll).setStudentName(name);
                System.out.println("Name updated successfully.");
            }
            case 2 -> {
                System.out.print("Enter new age : ");
                int age = sc.nextInt();
                students.get(roll).setAge(age);
                System.out.println("Age updated successfully.");
            }
            case 3 -> {
                System.out.print("Enter new course : ");
                String course = sc.nextLine();
                students.get(roll).setCourse(course);
                System.out.println("Course updated successfully.");
            }
            case 4 -> {
                System.out.print("Enter new marks : ");
                double marks = sc.nextDouble();
                students.get(roll).setMarks(marks);
                System.out.println("Marks updated successfully.");
            }
            case 5 -> {
                System.out.print("Enter new name : ");
                String name = sc.nextLine();
                students.get(roll).setStudentName(name);
                System.out.print("Enter new age : ");
                int age = sc.nextInt();
                students.get(roll).setAge(age);
                System.out.println("Name & Age updated successfully.");
            }
            case 6 -> {
                System.out.print("Enter new name : ");
                String name = sc.nextLine();
                students.get(roll).setStudentName(name);
                System.out.print("Enter new course : ");
                String course = sc.nextLine();
                students.get(roll).setCourse(course);
                System.out.println("Name & Course updated successfully.");
            }
            case 7 -> {
                System.out.print("Enter new name : ");
                String name = sc.nextLine();
                students.get(roll).setStudentName(name);
                System.out.print("Enter new marks : ");
                double marks = sc.nextDouble();
                students.get(roll).setMarks(marks);
                System.out.println("Name & Marks updated successfully.");
            }
            case 8 -> {
                System.out.print("Enter new age : ");
                int age = sc.nextInt();
                students.get(roll).setAge(age);
                System.out.print("Enter new course : ");
                String course = sc.nextLine();
                students.get(roll).setCourse(course);
                System.out.println("Age & Course updated successfully.");
            }
            case 9 -> {
                System.out.print("Enter new age : ");
                int age = sc.nextInt();
                students.get(roll).setAge(age);
                System.out.print("Enter new marks : ");
                double marks = sc.nextDouble();
                students.get(roll).setMarks(marks);
                System.out.println("Age & Marks updated successfully.");
            }
            case 10 -> {
                System.out.print("Enter new course : ");
                String course = sc.nextLine();
                students.get(roll).setCourse(course);
                System.out.print("Enter new marks : ");
                double marks = sc.nextDouble();
                students.get(roll).setMarks(marks);
                System.out.println("Course & Marks updated successfully.");
            }
            case 11 -> {
                System.out.print("Enter new name : ");
                String name = sc.nextLine();
                students.get(roll).setStudentName(name);
                System.out.print("Enter new age : ");
                int age = sc.nextInt();
                students.get(roll).setAge(age);
                System.out.print("Enter new course : ");
                String course = sc.nextLine();
                students.get(roll).setCourse(course);
                System.out.print("Enter new marks : ");
                double marks = sc.nextDouble();
                students.get(roll).setMarks(marks);
                System.out.println("All details updated successfully.");
            }

            default ->
                System.out.println("Invalid choice. Please try again.");
        }

    }

    @Override
    public void deleteStudents() {
        System.out.print("Enter roll number : ");
        long roll = sc.nextLong();
        sc.nextLine();
        if(!isExists(students,roll)){
            System.out.println("Student does not exits. Please try again.");
            return;
        }
        students.remove(roll);
        System.out.println("Student deleted successfully.");
    }

    @Override
    public void viewAllStudents() {
        for(Student student : students.values()) {
            System.out.println(student);
        }
        if(students.isEmpty()) {
            System.out.println("No students found.");
        }
    }

    @Override
    public void exit() {
        sc.close();
        System.exit(0);
    }

    private  boolean isExists(HashMap<Long,Student> map, long roll){
        return map.containsKey(roll);
    }
}
