import 'package:chill_music/entity/category/category_response.dart';
import 'package:injectable/injectable.dart';
import 'home_service.dart';

@singleton
class HomeRepository {
  HomeService _service = HomeService();

  Future<List<CategoryResponse>> fetchContent() async {
    return await _service.fetchHomeContent();
  }
}
