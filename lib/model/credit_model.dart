class CreditModel {
  final String name;
  final int age;
  final int income;
  final int empLength;
  final int loanAmount;
  final double interestRate;
  final double percentIncome;
  final String homeOwnership;
  final String loanIntent;
  final String loanGrade;

  CreditModel({
    required this.name,
    required this.age,
    required this.income,
    required this.empLength,
    required this.loanAmount,
    required this.interestRate,
    required this.percentIncome,
    required this.homeOwnership,
    required this.loanIntent,
    required this.loanGrade,
  });

  Map<String, dynamic> toJson() => {
        'person_age': age,
        'person_income': income,
        'person_emp_length': empLength,
        'loan_amnt': loanAmount,
        'loan_int_rate': interestRate,
        'loan_percent_income': percentIncome,
        'person_home_ownership': homeOwnership,
        'loan_intent': loanIntent,
        'loan_grade': loanGrade,
      };
}
