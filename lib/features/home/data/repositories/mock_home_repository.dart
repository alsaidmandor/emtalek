import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/city_stat_model.dart';
import '../models/home_data_model.dart';
import '../models/news_item_model.dart';
import '../models/project_model.dart';
import '../models/property_model.dart';
import 'home_repository.dart';

class MockHomeRepository implements HomeRepository {
  @override
  Future<Either<Faileurs, HomeDataModel>> getHomeData() async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return const Right(
      HomeDataModel(
        unreadNotifications: 2,
        unreadMessages: 6,
        properties: [
          PropertyModel(
            id: 'p1',
            title: 'شقة سكنية للبيع تشطيب سوبر لوكس',
            price: 4000000,
            location: 'الشيخ زايد، الجيزة',
            bedrooms: 10,
            bathrooms: 5,
            area: 8725,
            agent: 'GS',
            postedAgo: 'منذ 4 أيام',
            type: ListingType.sale,
            category: PropertyCategory.apartment,
            isFeatured: true,
            imageUrl:
                'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800&auto=format&fit=crop&q=80',
          ),
          PropertyModel(
            id: 'p2',
            title: 'شقة للإيجار بإطلالة مفتوحة قريبة من الخدمات',
            price: 18000,
            location: 'التجمع الخامس، القاهرة',
            bedrooms: 3,
            bathrooms: 2,
            area: 160,
            agent: 'GS',
            postedAgo: 'منذ 3 أيام',
            type: ListingType.rent,
            category: PropertyCategory.apartment,
            isFeatured: true,
            imageUrl:
                'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800&auto=format&fit=crop&q=80',
          ),
          PropertyModel(
            id: 'p3',
            title: 'فيلا سكنية للبيع تشطيب سوبر لوكس',
            price: 9500000,
            location: 'الشيخ زايد، الجيزة',
            bedrooms: 6,
            bathrooms: 4,
            area: 420,
            agent: 'GS',
            postedAgo: 'منذ 4 أيام',
            type: ListingType.sale,
            category: PropertyCategory.villa,
            imageUrl:
                'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800&auto=format&fit=crop&q=80',
          ),
          PropertyModel(
            id: 'p4',
            title: 'دوبلكس للبيع تشطيب سوبر لوكس',
            price: 6200000,
            location: 'الشيخ زايد، الجيزة',
            bedrooms: 4,
            bathrooms: 3,
            area: 300,
            agent: 'GS',
            postedAgo: 'منذ 5 أيام',
            type: ListingType.sale,
            category: PropertyCategory.duplex,
            imageUrl:
                'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=800&auto=format&fit=crop&q=80',
          ),
          PropertyModel(
            id: 'p5',
            title: 'شقة سكنية للبيع بالتقسيط',
            price: 3100000,
            location: 'مدينة نصر، القاهرة',
            bedrooms: 3,
            bathrooms: 2,
            area: 140,
            agent: 'GS',
            postedAgo: 'منذ 6 أيام',
            type: ListingType.sale,
            category: PropertyCategory.apartment,
            imageUrl:
                'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?w=800&auto=format&fit=crop&q=80',
          ),
        ],
        projects: [
          ProjectModel(
            id: 'j1',
            name: 'كمبوند الشيخ زايد',
            location: 'الشيخ زايد، الجيزة',
            startingPrice: 2500000,
            delivery: 2028,
            unitTypes: 'شقق وفيلات',
            developer: 'GS',
            postedAgo: 'منذ 4 أيام',
            imageUrl:
                'https://images.unsplash.com/photo-1577495508048-b635879837f1?w=800&auto=format&fit=crop&q=80',
          ),
          ProjectModel(
            id: 'j2',
            name: 'كمبوند العاصمة',
            location: 'العاصمة الإدارية',
            startingPrice: 3200000,
            delivery: 2029,
            unitTypes: 'شقق ودوبلكس',
            developer: 'GS',
            postedAgo: 'منذ 5 أيام',
            imageUrl:
                'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800&auto=format&fit=crop&q=80',
          ),
        ],
        cities: [
          CityStatModel(
            name: 'القاهرة',
            forSale: 505,
            forRent: 1002,
            imageUrl:
                'https://images.unsplash.com/photo-1572252009286-268acec5ca0a?w=800&auto=format&fit=crop&q=80',
          ),
          CityStatModel(
            name: 'الجيزة',
            forSale: 505,
            forRent: 1002,
            imageUrl:
                'https://images.unsplash.com/photo-1503177119275-0aa32b3a9368?w=800&auto=format&fit=crop&q=80',
          ),
        ],
        news: [
          NewsItemModel(
            title: 'أحدث سوق إيجي',
            summary: 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة',
            postedAgo: 'منذ 4 أيام',
            imageUrl:
                'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=800&auto=format&fit=crop&q=80',
          ),
        ],
      ),
    );
  }
}
