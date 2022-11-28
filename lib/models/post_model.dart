import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  final String? photo;
  final String? caption;

  const PostModel({this.photo, this.caption});

  @override
  List<Object?> get props => [photo,caption];
}
