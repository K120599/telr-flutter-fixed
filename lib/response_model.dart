class AuthResponse {
  String status;
  String code;
  String message;
  String tranref;

  AuthResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.tranref,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json['status'],
      code: json['code'],
      message: json['message'],
      tranref: json['tranref'],
    );
  }
}

// class Card {
//   String? cardNumber;
//   String? cardType;

//   Card({
//     this.cardNumber,
//     this.cardType,
//   });

//   factory Card.fromJson(Map<String, dynamic> json) {
//     return Card(
//       cardNumber: json['cardNumber'],
//       cardType: json['cardType'],
//     );
//   }
// }