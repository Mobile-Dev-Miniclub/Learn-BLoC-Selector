import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final int age;
  User({required this.name, required this.age});

  @override
  // TODO: implement props
  List<Object?> get props => [name, age];
}
