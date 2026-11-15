import 'package:equatable/equatable.dart';

enum ListingType { sale, rent }

enum ListingFilter { all, sale, rent }

enum PropertyCategory { apartment, villa, duplex }

class PropertyModel extends Equatable {
  const PropertyModel({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.agent,
    required this.postedAgo,
    required this.type,
    required this.category,
    this.isFeatured = false,
    this.imageUrl = '',
  });

  final String id;
  final String title;
  final int price;
  final String location;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final String agent;
  final String postedAgo;
  final ListingType type;
  final PropertyCategory category;
  final bool isFeatured;
  final String imageUrl;

  bool matches(ListingFilter f) =>
      f == ListingFilter.all ||
      (f == ListingFilter.sale && type == ListingType.sale) ||
      (f == ListingFilter.rent && type == ListingType.rent);

  factory PropertyModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const PropertyModel(
        id: '',
        title: '',
        price: 0,
        location: '',
        bedrooms: 0,
        bathrooms: 0,
        area: 0,
        agent: '',
        postedAgo: '',
        type: ListingType.sale,
        category: PropertyCategory.apartment,
        isFeatured: false,
        imageUrl: '',
      );
    }

    ListingType parseType(dynamic val) {
      final s = val?.toString().toLowerCase();
      if (s == 'rent') return ListingType.rent;
      return ListingType.sale;
    }

    PropertyCategory parseCategory(dynamic val) {
      final s = val?.toString().toLowerCase();
      if (s == 'villa') return PropertyCategory.villa;
      if (s == 'duplex') return PropertyCategory.duplex;
      return PropertyCategory.apartment;
    }

    return PropertyModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      price: (json['price'] as num?)?.toInt() ??
          int.tryParse(json['price']?.toString() ?? '') ??
          0,
      location: json['location']?.toString() ?? '',
      bedrooms: (json['bedrooms'] as num?)?.toInt() ??
          int.tryParse(json['bedrooms']?.toString() ?? '') ??
          0,
      bathrooms: (json['bathrooms'] as num?)?.toInt() ??
          int.tryParse(json['bathrooms']?.toString() ?? '') ??
          0,
      area: (json['area'] as num?)?.toInt() ??
          int.tryParse(json['area']?.toString() ?? '') ??
          0,
      agent: json['agent']?.toString() ?? '',
      postedAgo: json['postedAgo']?.toString() ??
          json['posted_ago']?.toString() ??
          '',
      type: parseType(json['type']),
      category: parseCategory(json['category']),
      isFeatured: json['isFeatured'] == true || json['is_featured'] == true,
      imageUrl: json['imageUrl']?.toString() ??
          json['image_url']?.toString() ??
          json['image']?.toString() ??
          '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'location': location,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'area': area,
        'agent': agent,
        'postedAgo': postedAgo,
        'type': type.name,
        'category': category.name,
        'isFeatured': isFeatured,
        'imageUrl': imageUrl,
      };

  @override
  List<Object?> get props => [id];
}

typedef Property = PropertyModel;
