import 'package:masterclass_app/src/feature/github/model/repository_model.dart';

abstract class GithubRepositoriesState {}

class GithubRepositoriesLoading implements GithubRepositoriesState {}

class GithubRepositoriesSuccess implements GithubRepositoriesState {
  GithubRepositoriesSuccess(this.repositories);

  final List<RepositoryModel> repositories;
}

class GithubRepositoriesError implements GithubRepositoriesState {
  GithubRepositoriesError(this.message);

  final String message;
}

class GithubRepositoriesIdle extends GithubRepositoriesSuccess {
  GithubRepositoriesIdle() : super([]);
}
