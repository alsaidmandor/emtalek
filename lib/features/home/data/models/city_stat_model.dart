class CityStatModel {
  const CityStatModel({
    required this.name,
    required this.forSale,
    required this.forRent,
    this.imageUrl = '',
  });

  final String name;
  final int forSale;
  final int forRent;
  final String imageUrl;

  factory CityStatModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const CityStatModel(
        name: '',
        forSale: 0,
        forRent: 0,
        imageUrl: '',
      );
    }
    return CityStatModel(
      name: json['name']?.toString() ?? '',
      forSale: (json['forSale'] as num?)?.toInt() ??
          (json['for_sale'] as num?)?.toInt() ??
          int.tryParse(json['forSale']?.toString() ?? '') ??
          0,
      forRent: (json['forRent'] as num?)?.toInt() ??
          (json['for_rent'] as num?)?.toInt() ??
          int.tryParse(json['forRent']?.toString() ?? '') ??
          0,
      imageUrl: json['imageUrl']?.toString() ??
          json['image_url']?.toString() ??
          json['image']?.toString() ??
          '',
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'forSale': forSale,
        'forRent': forRent,
        'imageUrl': imageUrl,
      };
}

typedef CityStat = CityStatModel;
