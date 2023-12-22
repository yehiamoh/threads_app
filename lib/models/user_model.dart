class UserModel{
  final String id;
  final String name;
  final String photo;

  UserModel({required this.id, required this.name, required this.photo});
  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
        id: json['userId'],
        name: json['name'],
        photo:json['photo']);
  }
  Map<String,dynamic> tojson(){
    return{
      'userId': id,
      'name': name,
      'photo': photo,
  };

}
}