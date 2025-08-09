package Bank_Account;
import java.util.HashMap;

public interface account {
   bankAccount createAccount(HashMap<Integer,bankAccount> acc);

    void deposit();

    void withdraw();

    long checkBalance();

    void displayAccountDetails();
}