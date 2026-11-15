import 'package:equatable/equatable.dart';

class ProjectModel extends Equatable {
  const ProjectModel({
    required this.id,
    required this.name,
    required this.location,
    required this.startingPrice,
    required this.delivery,
    required this.unitTypes,
    required this.developer,
    required this.postedAgo,
    this.imageUrl = '',
  });

  final String id;
  final String name;
  final String location;
  final int startingPrice;
  final int delivery;
  final String unitTypes;
  final String developer;
  final String postedAgo;
  final String imageUrl;

  factory ProjectModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const ProjectModel(
        id: '',
        name: '',
        location: '',
        startingPrice: 0,
        delivery: 0,
        unitTypes: '',
        developer: '',
        postedAgo: '',
        imageUrl: '',
      );
    }
    return ProjectModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      startingPrice: (json['startingPrice'] as num?)?.toInt() ??
          (json['starting_price'] as num?)?.toInt() ??
          int.tryParse(json['startingPrice']?.toString() ?? '') ??
          0,
      delivery: (json['delivery'] as num?)?.toInt() ??
          int.tryParse(json['delivery']?.toString() ?? '') ??
          0,
      unitTypes: json['unitTypes']?.toString() ??
          json['unit_types']?.toString() ??
          '',
      developer: json['developer']?.toString() ?? '',
      postedAgo: json['postedAgo']?.toString() ??
          json['posted_ago']?.toString() ??
          '',
      imageUrl: json['imageUrl']?.toString() ??
          json['image_url']?.toString() ??
          json['image']?.toString() ??
          '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'startingPrice': startingPrice,
        'delivery': delivery,
        'unitTypes': unitTypes,
        'developer': developer,
        'postedAgo': postedAgo,
        'imageUrl': imageUrl,
      };

  @override
  List<Object?> get props => [id];
}

typedef Project = ProjectModel;
