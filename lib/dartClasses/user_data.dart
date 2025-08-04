class UserInfo {
  final String? phoneNumber;
  final String? email;
  final String? bankAcc;
  final String? bankAccPass;
  final String? userName;
  final String? password;
  final String? firstName;
  final String? lastname;
  final String? amount;
  final String? memberSince;
  final String? result;

  UserInfo({
    this.phoneNumber,
    this.email,
    this.bankAcc,
    this.bankAccPass,
    this.userName,
    this.password,
    this.firstName,
    this.lastname,
    this.amount,
    this.memberSince,
    this.result,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      phoneNumber: json['phone'],
      email: json['email'],
      bankAcc: json['bankaccount'],
      bankAccPass: json['bankpassword'],
      userName: json['username'],
      password: json['password'],
      firstName: json['firstname'],
      lastname: json['lastname'],
      amount: json['ammount'],
      memberSince: json['member_since'],
      result: json['result'],
    );
  }

  Map<String, dynamic> toJson() => {
        'phone': phoneNumber,
        'email': email,
        'bankkaccount': bankAcc,
        'bankpassword': bankAccPass,
        'username': userName,
        'password': password,
        'firstname': firstName,
        'lastname': lastname,
        'amount': amount,
        'member_since': memberSince,
        'result': result,
      };
}
