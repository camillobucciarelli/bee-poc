import 'package:flutter/material.dart';

import '../../../domain/models/hive.dart';
import '../../../theme/theme.dart';

class HiveWeight extends StatelessWidget {
  final Color color;
  final Hive hive;

  const HiveWeight({
    Key? key,
    required this.color,
    required this.hive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.spacingXS, vertical: Dimens.spacingXXS),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(Dimens.radiusXXL)),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hive.weight ?? '-',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            'kg',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
