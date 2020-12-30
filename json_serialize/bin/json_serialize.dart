import 'package:json_serialize/json_serialize.dart';

void main(List<String> arguments) async {
  var x = await loadAndDecode();
  print(x);
}
