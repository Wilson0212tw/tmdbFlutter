import 'package:equatable/equatable.dart'; 



 class Genres extends Equatable {

final int? id;
final String? name;


 const Genres({
this.id,
this.name,
});



  factory Genres.fromJson(Map<String, dynamic> json) =>
 Genres(
id: json['id'] as int?, 
name: json['name'] as String?, 
);



 Map<String, dynamic> toJson() => {
'id': id, 
'name': name, 
};



 Genres copyWith({
int?  id, 
String?  name, 
}) => 
 Genres(id : id ?? this.id, 
name : name ?? this.name, 
);

@override 
 bool get stringify => true;

@override 
  List<Object?> get props => [id,name];

}