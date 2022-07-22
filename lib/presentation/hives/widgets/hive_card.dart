import 'package:bee/presentation/hives/widgets/profile_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/hive.dart';

class HiveCard extends StatefulWidget {
  final Hive hive;

  const HiveCard(this.hive, {Key? key}) : super(key: key);

  @override
  State<HiveCard> createState() => _HiveCardState();
}

class _HiveCardState extends State<HiveCard> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.amber.shade600.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          _image(),
          _name(),
        ],
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [.4, 1.0],
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.9),
          ],
        ).createShader(rect),
        blendMode: BlendMode.darken,
        child: CachedNetworkImage(
          imageUrl: widget.hive.mainImage,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget _name() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          widget.hive.name.toUpperCase(),
          textAlign: TextAlign.right,
          style: Theme
              .of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
