import 'package:equatable/equatable.dart'; 



 class ProductionCountries extends Equatable {

final String? iso31661;
final String? name;


 const ProductionCountries({
this.iso31661,
this.name,
});



  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
 ProductionCountries(
iso31661: json['iso_3166_1'] as String?, 
name: json['name'] as String?, 
);



 Map<String, dynamic> toJson() => {
'iso_3166_1': iso31661, 
'name': name, 
};



 ProductionCountries copyWith({
String?  iso31661, 
String?  name, 
}) => 
 ProductionCountries(iso31661 : iso31661 ?? this.iso31661, 
name : name ?? this.name, 
);

@override 
 bool get stringify => true;

@override 
  List<Object?> get props => [iso31661,name];

}