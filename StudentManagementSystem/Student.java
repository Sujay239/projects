package StudentManagementSystem;

public class Student {
    private long studnetRoll;
    private  String studentName;
    private int age;
    private String course;
    private double marks;

    public Student(long studnetRoll, String studentName, int age, String course, double marks) {
        this.studnetRoll = studnetRoll;
        this.studentName = studentName;
        this.age = age;
        this.course = course;
        this.marks = marks;
    }

    public long getStudnetRoll() {
        return studnetRoll;
    }

    public void setStudnetRoll(long studnetRoll) {
        this.studnetRoll = studnetRoll;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public double getMarks() {
        return marks;
    }

    public void setMarks(double marks) {
        this.marks = marks;
    }

    @Override
    public String toString() {
        return "Roll : " +studnetRoll+" -> [" +
                " studentName='" + studentName + '\'' +
                " | age=" + age +
                " | course='" + course + '\'' +
                " | marks=" + marks +
                ']';
    }
}
