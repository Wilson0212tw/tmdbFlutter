import 'package:equatable/equatable.dart'; 



 class ProductionCompanies extends Equatable {

final int? id;
final String? logoPath;
final String? name;
final String? originCountry;


 const ProductionCompanies({
this.id,
this.logoPath,
this.name,
this.originCountry,
});



  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
 ProductionCompanies(
id: json['id'] as int?, 
logoPath: json['logo_path'] as String?, 
name: json['name'] as String?, 
originCountry: json['origin_country'] as String?, 
);



 Map<String, dynamic> toJson() => {
'id': id, 
'logo_path': logoPath, 
'name': name, 
'origin_country': originCountry, 
};



 ProductionCompanies copyWith({
int?  id, 
String?  logoPath, 
String?  name, 
String?  originCountry, 
}) => 
 ProductionCompanies(id : id ?? this.id, 
logoPath : logoPath ?? this.logoPath, 
name : name ?? this.name, 
originCountry : originCountry ?? this.originCountry, 
);

@override 
 bool get stringify => true;

@override 
  List<Object?> get props => [id,logoPath,name,originCountry];

}