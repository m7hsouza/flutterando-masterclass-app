import 'package:masterclass_app/src/feature/github/model/repository_model.dart';
import 'package:masterclass_app/src/feature/github/service/repository_adapter.dart';
import 'package:uno/uno.dart';

class GetAllRepository {
  final _uno = Uno(baseURL: 'https://api.github.com');

  Future<List<RepositoryModel>> call() async {
    final response = await _uno.get('/users/m7hsouza/repos');
    return RepositoryAdapter.fromJsonList(response.data);
  }
}
