package Bank_Account;
import java.util.HashMap;
import java.util.Scanner;

public class bankAccount implements account {

    private int accountNumber;
    private String accountHolderName;
    private long balance;

    static Scanner sc = new Scanner(System.in);

    // Methods for creating account
    @Override
    public  bankAccount createAccount(HashMap<Integer,bankAccount> acc) {
        try {
            System.out.print("Enter account number : ");
            this.accountNumber = sc.nextInt();
            sc.nextLine();
            if (isExists(acc, accountNumber)) {
                return acc.get(accountNumber);
            }
            System.out.print("Enter account Holder Name : ");
            this.accountHolderName = sc.nextLine();
            this.balance = 0;
            return this;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    // Method for deposit balance in account
    @Override
    public void deposit() {
        System.out.print("Enter amount want to deposit : ");
        try {
            int amount = sc.nextInt();
            this.balance += amount;
            System.out.println("Successfullly deposit : Rs. "+amount);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    // Method for withdraw money from account
    @Override
    public void withdraw() {
        try {
            System.out.print("Enter amount want to withdraw : ");
            int amount = sc.nextInt();
            if (this.balance < amount) {
                System.out.println("Insufficient balance to withdraw. Please try again.");
                return;
            }
            this.balance -= amount;
            System.out.println("Available balance : " + this.balance);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }



    //Methods to check available balance in bank account
    @Override
    public long checkBalance() {
        return this.balance;
    }


    //Method to Display the account details
    @Override
    public void displayAccountDetails() {
        System.out.println(this.toString());
    }

    public static void exit() {
        sc.close();
        System.exit(0);
    }

    @Override
    public String toString() {
        return "\nAccount Number: " + accountNumber +
                "| Account Holder: " + accountHolderName +
                "| Balance: " + balance+"\n";
    }

    public int getAccNo() {
        return this.accountNumber;
    }


    private boolean isExists(HashMap<Integer, bankAccount> accounts, int id) {
        if (accounts.containsKey(id)) {
                // System.out.println("Account number is already exist.");
                return true;
            }
        return false;
    }

}
