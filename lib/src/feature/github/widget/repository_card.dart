import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:masterclass_app/src/common/widget/custom_card.dart';
import 'package:masterclass_app/src/feature/github/model/repository_model.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final RepositoryModel repository;
  String get _formattedDate => timeago.format(repository.updatedAt, locale: 'pt_BR', allowFromNow: true);

  Future<void> _launchUrl() async {
    final url = Uri.parse(repository.url);

    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                repository.name,
                style: Theme.of(context).textTheme.headline1?.copyWith(color: Theme.of(context).primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
              if (repository.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    repository.description!,
                    style: Theme.of(context).textTheme.overline,
                  ),
                ),
              if (repository.language != null || repository.stars > 0 || repository.forks > 0)
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 8),
                  child: DefaultTextStyle(
                    style: Theme.of(context).textTheme.headline4!,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (repository.language != null)
                          Row(
                            children: [
                              const Icon(Icons.code_sharp),
                              const SizedBox(width: 4),
                              Text(repository.language!),
                              const SizedBox(width: 16),
                            ],
                          ),
                        if (repository.stars > 0)
                          Row(
                            children: [
                              const Icon(Icons.star_border_purple500_rounded),
                              const SizedBox(width: 4),
                              Text(repository.stars.toString()),
                              const SizedBox(width: 16),
                            ],
                          ),
                        if (repository.forks > 0)
                          Row(
                            children: [
                              const Icon(Icons.fork_left_rounded),
                              const SizedBox(width: 4),
                              Text(repository.forks.toString()),
                              const SizedBox(width: 16),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Atualizado $_formattedDate',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
