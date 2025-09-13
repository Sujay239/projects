package Bank_Account;
import java.util.HashMap;
import java.util.Scanner;

public class mainClass {

    public static void main(String[] args) {
        HashMap<Integer, bankAccount> accounts = new HashMap<>();
        Scanner sc = new Scanner(System.in);
        int choice;
        System.out.println("""
                \nAccount menu :   1.Create account.
                                 2. Deposit.
                                 3. Withdraw.
                                 4. Display Account Details.
                                 5. Check balance
                                 6. Exit.""");
        
        while (true) {
            System.out.print("Enter your choice : ");
            choice = sc.nextInt();

            switch (choice) {
                case 1:
                    bankAccount acc = new bankAccount();
                    acc = acc.createAccount(accounts);
                    
                    if (acc == null) {
                        System.out.println("Bank account not created.");
                        break;
                    }
                    
                    int id = acc.getAccNo();
                     if(accounts.containsKey(id)) {
                       System.out.println("Account number already exists. Please try again.");
                    } else {
                        accounts.put(id, acc);
                        System.out.println("Account successfully created.");
                    }
                    break;

                
                
                case 2:
                    System.out.print("Enter account number : ");
                    int accNo = sc.nextInt();
                    if (!accounts.containsKey(accNo)) {
                        System.out.println(
                                "Account number not found. Account number : " + accNo + " verify & try again.");
                        break;
                    }
                    accounts.get(accNo).deposit();
                    break;

                case 3:
                    System.out.print("Enter account number : ");
                    accNo = sc.nextInt();
                    if (!accounts.containsKey(accNo)) {
                        System.out.println(
                                "Account number not found. Account number : " + accNo + " verify & try again.");
                        break;
                    }
                    accounts.get(accNo).withdraw();
                    break;
                
                case 4:
                    System.out.print("Enter the account number : ");
                    accNo = sc.nextInt();
                    if (!accounts.containsKey(accNo)) {
                        System.out.println(
                                "Account number not found. Account number : " + accNo + " verify & try again.");
                        break;
                    }
                    accounts.get(accNo).displayAccountDetails();
                    break;

                case 5:
                    System.out.print("Enter account number : ");
                    accNo = sc.nextInt();
                    if (!accounts.containsKey(accNo)) {
                        System.out.println(
                                "Account number not found. Account number : " + accNo + " verify & try again.");
                        break;
                    }
                    long balance = accounts.get(accNo).checkBalance();
                    System.out.println("Available Balance : "+balance);
                    break;
                
                case 6:
                    sc.close();
                    bankAccount.exit();
                    break;
            
                default:
                    System.out.println("Invalid choice! Please try again.");
                    break;
            }
        }
    }
    
}
