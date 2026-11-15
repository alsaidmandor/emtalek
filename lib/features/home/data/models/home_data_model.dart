import 'city_stat_model.dart';
import 'news_item_model.dart';
import 'project_model.dart';
import 'property_model.dart';

class HomeDataModel {
  const HomeDataModel({
    required this.properties,
    required this.projects,
    required this.cities,
    required this.news,
    this.unreadNotifications = 0,
    this.unreadMessages = 0,
  });

  static const empty = HomeDataModel(
    properties: [],
    projects: [],
    cities: [],
    news: [],
  );

  final List<PropertyModel> properties;
  final List<ProjectModel> projects;
  final List<CityStatModel> cities;
  final List<NewsItemModel> news;
  final int unreadNotifications;
  final int unreadMessages;

  factory HomeDataModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return HomeDataModel.empty;

    final rawProperties = json['properties'];
    final properties = rawProperties is List
        ? rawProperties
            .whereType<Map<String, dynamic>>()
            .map(PropertyModel.fromJson)
            .toList()
        : <PropertyModel>[];

    final rawProjects = json['projects'];
    final projects = rawProjects is List
        ? rawProjects
            .whereType<Map<String, dynamic>>()
            .map(ProjectModel.fromJson)
            .toList()
        : <ProjectModel>[];

    final rawCities = json['cities'];
    final cities = rawCities is List
        ? rawCities
            .whereType<Map<String, dynamic>>()
            .map(CityStatModel.fromJson)
            .toList()
        : <CityStatModel>[];

    final rawNews = json['news'];
    final news = rawNews is List
        ? rawNews
            .whereType<Map<String, dynamic>>()
            .map(NewsItemModel.fromJson)
            .toList()
        : <NewsItemModel>[];

    return HomeDataModel(
      properties: properties,
      projects: projects,
      cities: cities,
      news: news,
      unreadNotifications: (json['unreadNotifications'] as num?)?.toInt() ??
          (json['unread_notifications'] as num?)?.toInt() ??
          0,
      unreadMessages: (json['unreadMessages'] as num?)?.toInt() ??
          (json['unread_messages'] as num?)?.toInt() ??
          0,
    );
  }

  Map<String, dynamic> toJson() => {
        'properties': properties.map((e) => e.toJson()).toList(),
        'projects': projects.map((e) => e.toJson()).toList(),
        'cities': cities.map((e) => e.toJson()).toList(),
        'news': news.map((e) => e.toJson()).toList(),
        'unreadNotifications': unreadNotifications,
        'unreadMessages': unreadMessages,
      };
}

typedef HomeData = HomeDataModel;
