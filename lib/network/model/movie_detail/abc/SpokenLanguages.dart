import 'package:equatable/equatable.dart'; 



 class SpokenLanguages extends Equatable {

final String? englishName;
final String? iso6391;
final String? name;


 const SpokenLanguages({
this.englishName,
this.iso6391,
this.name,
});



  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
 SpokenLanguages(
englishName: json['english_name'] as String?, 
iso6391: json['iso_639_1'] as String?, 
name: json['name'] as String?, 
);



 Map<String, dynamic> toJson() => {
'english_name': englishName, 
'iso_639_1': iso6391, 
'name': name, 
};



 SpokenLanguages copyWith({
String?  englishName, 
String?  iso6391, 
String?  name, 
}) => 
 SpokenLanguages(englishName : englishName ?? this.englishName, 
iso6391 : iso6391 ?? this.iso6391, 
name : name ?? this.name, 
);

@override 
 bool get stringify => true;

@override 
  List<Object?> get props => [englishName,iso6391,name];

}