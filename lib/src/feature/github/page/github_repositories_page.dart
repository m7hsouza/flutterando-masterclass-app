import 'package:flutter/material.dart';
import 'package:masterclass_app/src/feature/github/widget/repository_card.dart';

import 'package:masterclass_app/src/common/page/custom_page.dart';

import 'package:masterclass_app/src/feature/github/service/get_all_repository.dart';

import 'package:masterclass_app/src/feature/github/store/github_repositories_state.dart';
import 'package:masterclass_app/src/feature/github/store/github_repositories_store.dart';

class GithubRepositoriesPage extends StatefulWidget implements CustomPage {
  const GithubRepositoriesPage({Key? key}) : super(key: key);

  @override
  String get title => 'Repositórios';

  @override
  State<GithubRepositoriesPage> createState() => _GithubRepositoriesPageState();
}

class _GithubRepositoriesPageState extends State<GithubRepositoriesPage> {
  late final GithubRepositoriesStore _store;

  @override
  void initState() {
    super.initState();

    _store = GithubRepositoriesStore(GetAllRepository());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _store.fetchAllRepositories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<GithubRepositoriesState>(
      valueListenable: _store,
      builder: (_, state, __) {
        if (state is GithubRepositoriesSuccess) {
          return ListView.separated(
            itemCount: state.repositories.length,
            itemBuilder: (context, index) {
              final repository = state.repositories[index];

              return RepositoryCard(repository: repository);
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16),
          );
        }

        if (state is GithubRepositoriesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final message = (state as GithubRepositoriesError).message;
        return Center(
          child: Text(message),
        );
      },
    );
  }
}
