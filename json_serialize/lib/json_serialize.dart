import 'dart:io';
import 'dart:convert' show jsonDecode;
import 'package:json_annotation/json_annotation.dart';

part 'json_serialize.g.dart';

Future<Person> loadAndDecode() async {
  var file = File('assets/sample.json');
  var s = await file.readAsString();
  var json = jsonDecode(s);
  return Person.fromJson(json);
}

@JsonSerializable()
class Person {
  final String firstName, lastName;
  Person({this.firstName, this.lastName});
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  @override
  String toString() {
    return 'Person: {name: ${firstName} ${lastName}}';
  }
}
