class SocialLoginResponse {
  final String id;
  final SocialLoginType type;
  String? email;
  String? name;
  final String accessToken;
  final String? phoneNumber;

  SocialLoginResponse( {
    this.phoneNumber,
    required this.id,
    required this.type,
    required this.email,
    required this.name,
    required this.accessToken,
  });

  // factory SocialLoginResponse.fromGoogle(Map<String, dynamic> json) {
  //   return SocialLoginResponse(
  //     id: json['id'],
  //     email: json['email'],
  //     name: json['display_name'],
  //     type: SocialLoginType.google,
  //   );
  // }
  //
  factory SocialLoginResponse.fromFacebook(Map<String, dynamic> json) {
    return SocialLoginResponse(
      id: json['userId'],
      email: json['userEmail'],
      name: json['userName'],
      accessToken: json['accessToken'],
      type: SocialLoginType.facebook,
    );
  }
  //
  // factory SocialLoginResponse.fromApple(Map<String, dynamic> json) {
  //   return SocialLoginResponse(
  //     id: json['userId'],
  //     email: json['userEmail'],
  //     name: json['givenName'] != null || json['familyName'] != null ? '${json['givenName'] + ' ' + json['familyName']}' : null,
  //     type: SocialLoginType.apple,
  //   );
  // }
}

enum SocialLoginType {
  facebook,
  google,
  apple,
}
