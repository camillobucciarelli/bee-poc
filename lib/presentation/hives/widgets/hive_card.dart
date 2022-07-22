import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/hive.dart';

class HiveCard extends StatelessWidget {
  final Hive hive;
  const HiveCard(this.hive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(hive.mainImage != null) _image(),
          if(hive.name != null) Text(hive.name!, style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }

  Widget _image(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CachedNetworkImage(
        imageUrl: hive.mainImage!,
        fit: BoxFit.cover,
      ),
    );
  }
}
