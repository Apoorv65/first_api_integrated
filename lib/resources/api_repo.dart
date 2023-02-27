import '../model/model.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<PostResponseModel> fetchList() async {
    return _provider.fetchList();
  }
}

class NetworkError extends Error {}
