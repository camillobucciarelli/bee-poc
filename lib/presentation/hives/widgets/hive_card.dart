import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/hive.dart';
import '../../../theme/theme.dart';
import 'hive_weight.dart';

class HiveCard extends StatelessWidget {
  static const _color = Colors.lightGreen;
  final Hive hive;
  final double cardSize;

  const HiveCard(this.hive, {Key? key, required this.cardSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radiusXS),
        border: Border.all(
          color: _color,
          width: 2.0,
        ),
        color: Colors.black,
        image: DecorationImage(
          image: CachedNetworkImageProvider(hive.imageUrl),
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _spacing(),
          _name(context),
          _spacing(),
          HiveWeight(color: _color, hive: hive),
          const Spacer(),
          _dateAndExternalId(context),
          _spacing(),
        ],
      ),
    );
  }

  SizedBox _spacing() => const SizedBox(height: Dimens.spacingXS);

  Padding _name(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS),
      child: Text(
        hive.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
      ),
    );
  }

  Padding _dateAndExternalId(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingXS),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hive.measurementDate != null ? DateFormat('dd MMM').format(hive.measurementDate!) : '-',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
          Text(
            hive.externalIdToShow,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
