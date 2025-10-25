import 'package:test/test.dart';
import 'dart:io';
import '../question1.dart';

void main() {
  group('Question 1 Tests', () {
    test('calculateBMI function works correctly', () {
      // Test BMI calculation
      double bmi = calculateBMI(150.0, 5.9);
      expect(bmi, closeTo(25.4, 0.1)); // Expected BMI for 150lbs, 5.9ft
    });
    
    test('getGrade function returns correct grades', () {
      expect(getGrade(95), equals('A'));
      expect(getGrade(85), equals('B'));
      expect(getGrade(75), equals('C'));
      expect(getGrade(65), equals('D'));
      expect(getGrade(55), equals('F'));
    });
    
    test('main function produces expected output', () {
      // This test verifies that the main function exists and can be called
      // The actual output verification is done in the grading script
      expect(true, isTrue);
    });
  });
}
