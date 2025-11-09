import java.util.Scanner;

public class DAA_fibonaci {
    //recursive
    public static int fib(int n){
        if(n<=1){
            return n;
        }
        return fib(n-1)+fib(n-2);
    }
    //Non recurise
    public static int DP_fib(int n){
        int a=0;
        int b=1;
        int curr=0;
        for(int i=2;i<=n;i++){
            curr=a+b;
            a=b;
            b=curr;
        }
        return curr;
    }
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        int n=sc.nextInt();
        System.out.println(fib(n));
        System.out.println(DP_fib(n));
        sc.close();
    }
}
