import 'package:flutter/material.dart';
import 'package:masterclass_app/src/common/widget/custom_card.dart';
import 'package:masterclass_app/src/feature/profile/value_object/technologie.dart';

class TechnologiesWidget extends StatelessWidget {
  const TechnologiesWidget({Key? key, required this.technologies}) : super(key: key);

  final List<Technologie> technologies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tecnologias Favoritas',
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: technologies.map((technologie) {
                return CustomCard(
                  margin: const EdgeInsets.only(right: 16),
                  width: 100,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        technologie.iconUrl,
                        color: IconTheme.of(context).color,
                        width: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.image, size: 50);
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        technologie.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
