class TokenResponse {
  final String token;
  final int uid;
  final  validtime;

  TokenResponse(this.token, this.uid, this.validtime);

  TokenResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        uid = json['uid'],
        validtime = json['validtime'];

  Map<String, dynamic> toJson() => {
    'token': token,
    'uid': uid,
    'validtime': validtime,
  };
}