import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required id,
    required title,
    required image,
    required overview,
    required externalLink,
  })  : _id = id,
        _title = title,
        _image = image,
        _overview = overview,
        _externalLink = externalLink;

  final String _id;
  final String _title;
  final String _image;
  final String _overview;
  final String _externalLink;

  String get id => _id;
  String get title => _title;
  String get image => _image;
  String get overview => _overview;
  String get externalLink => _externalLink;

  @override
  List<Object> get props => [_id, _title, _image, _overview, _externalLink];
}
