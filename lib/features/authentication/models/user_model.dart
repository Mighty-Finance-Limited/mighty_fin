// user_model.dart
class UserModel {
  final int id;
  final String email;
  final String? fname;
  final String? lname;
  final String profilePhotoUrl;
  final int borrowedTotal;

  UserModel({
    required this.id,
    required this.email,
    required this.fname,
    required this.lname,
    required this.profilePhotoUrl,
    required this.borrowedTotal,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      fname: json['fname'],
      lname: json['lname'],
      profilePhotoUrl: json['profile_photo_url'],
      borrowedTotal: json['borrowed_total'],
    );
  }
}
