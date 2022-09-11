import 'package:flutter/foundation.dart';
import 'package:masterclass_app/src/feature/github/service/get_all_repository.dart';
import 'package:masterclass_app/src/feature/github/store/github_repositories_state.dart';

class GithubRepositoriesStore extends ValueNotifier<GithubRepositoriesState> {
  GithubRepositoriesStore(this._getAllRepository) : super(GithubRepositoriesIdle());

  final GetAllRepository _getAllRepository;

  Future<void> fetchAllRepositories() async {
    value = GithubRepositoriesLoading();
    final repositories = await _getAllRepository();
    value = GithubRepositoriesSuccess(repositories);
  }
}
