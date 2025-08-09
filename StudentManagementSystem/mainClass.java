package StudentManagementSystem;

// import StudentManagementSystem.ManagementSystem;

public class mainClass {
    public static void main(String[] args) {
        ManagementSystem sms = new ManagementSystem();
        // studentManagementSystem sms = new studentManagementSystem();
        while (true) {
            System.out.println("1. Add Student");
            System.out.println("2. View Student");
            System.out.println("3. Update Student");
            System.out.println("4. Delete Student");
            System.out.println("5. View All Students");
            System.out.println("6. Exit");
            System.out.print("Enter your choice: ");
            int choice = sms.sc.nextInt();
            sms.sc.nextLine(); // Consume newline character

            switch (choice) {
                case 1:
                    sms.addStudent();
                    break;
                case 2:
                    sms.viewStudents();
                    break;
                case 3:
                    sms.updateStudent();
                    break;
                case 4:
                    sms.deleteStudents();
                    break;
                case 5:
                    sms.viewAllStudents();
                    break;
                case 6:
                    sms.exit();
                    return; // Exit the program
                default:
                    System.out.println("Invalid choice, please try again.");
            }
        }
    }
}
