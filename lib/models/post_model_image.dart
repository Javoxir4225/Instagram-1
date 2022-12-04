import 'package:equatable/equatable.dart';

class PostModelImage extends Equatable {
  final String? photo;
  final String? caption;

  const PostModelImage({this.photo, this.caption});

  @override
  List<Object?> get props => [photo,caption];
}
