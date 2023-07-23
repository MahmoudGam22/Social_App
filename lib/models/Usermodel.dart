class UserModel {
  late String name;
  String? email;
  late String phone;
  String? Uid;
  String? image;
  String? cover;
  late String bio;
  bool? isemailverified;
  UserModel(
      {this.Uid,
      this.email,
      required this.name,
      required this.phone,
      this.image,
      this.cover,
      required this.bio,
      this.isemailverified});
  UserModel.fromjson(Map<String, dynamic>? json) {
    email = json!['email'];
    name = json['name'];
    phone = json['phone'];
    Uid = json['Uid'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isemailverified = json['isemailverified'];
  }
  Map<String, dynamic> ToMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'Uid': Uid,
      'image':image,
      'cover':cover,
      'bio':bio,
      'isemailverified': isemailverified,
    };
  }
}
