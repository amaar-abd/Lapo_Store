import 'package:lapo_app/core/utils/app_images.dart';

class CategoryModel {
  final String title;
  final String pathIcon;
  final String? query;

  CategoryModel({required this.title, required this.pathIcon, this.query});
}

final List<CategoryModel> categpries = [
  CategoryModel(title: 'All', pathIcon: Assets.assetsImagesWorkIcon, query: null),
  CategoryModel(
    title: 'Gaming',
    pathIcon: Assets.assetsImagesGamingIcon,
    query: 'Gaming',
  ),
  CategoryModel(
    title: 'Student',
    pathIcon: Assets.assetsImagesStudentIcon,
    query: 'Student',
  ),
  CategoryModel(
    title: 'Crieative',
    pathIcon: Assets.assetsImagesCreativeIcon,
    query: 'Crieative',
  ),
 
];
