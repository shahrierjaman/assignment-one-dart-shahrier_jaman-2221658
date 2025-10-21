import 'package:test/test.dart';
import 'dart:io';
import '../question3.dart';

void main() {
  group('Question 3 Tests', () {
    test('BankAccount class can be instantiated', () {
      var account = BankAccount("12345", "Alice", "Savings");
      expect(account.accountNumber, equals("12345"));
      expect(account.accountHolder, equals("Alice"));
      expect(account.accountType, equals("Savings"));
      expect(account.balance, equals(0.0));
    });
    
    test('deposit method works correctly', () {
      var account = BankAccount("12345", "Alice", "Savings");
      account.deposit(100.0);
      expect(account.getBalance(), equals(100.0));
    });
    
    test('withdraw method works correctly', () {
      var account = BankAccount("12345", "Alice", "Savings");
      account.deposit(100.0);
      account.withdraw(50.0);
      expect(account.getBalance(), equals(50.0));
    });
    
    test('withdraw handles insufficient funds', () {
      var account = BankAccount("12345", "Alice", "Savings");
      account.deposit(50.0);
      
      // Capture stdout
      var output = StringBuffer();
      var originalStdout = stdout;
      
      try {
        stdout = IOSink(output);
        account.withdraw(100.0);
        
        // Check that insufficient funds message is printed
        expect(output.toString().contains("Insufficient funds"), isTrue);
        expect(account.getBalance(), equals(50.0)); // Balance should remain unchanged
      } finally {
        stdout = originalStdout;
      }
    });
    
    test('main function runs without errors', () {
      var originalStdout = stdout;
      
      try {
        stdout = IOSink(StringBuffer());
        main();
        expect(true, isTrue);
      } finally {
        stdout = originalStdout;
      }
    });
  });
}
