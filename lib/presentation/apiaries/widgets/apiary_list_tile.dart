import 'package:flutter/material.dart';

import '../../../domain/models/apiary.dart';
import '../../../theme/theme.dart';
import '../../hives/hives_horizontal_list.dart';

class ApiaryListTile extends StatefulWidget {
  final Apiary apiary;
  final bool isOdd;

  const ApiaryListTile(
    this.apiary, {
    Key? key,
    required this.isOdd,
  }) : super(key: key);

  @override
  State<ApiaryListTile> createState() => _ApiaryListTileState();
}

class _ApiaryListTileState extends State<ApiaryListTile>
    with AutomaticKeepAliveClientMixin<ApiaryListTile> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: widget.isOdd ? Colors.grey.shade200 : Colors.grey.shade50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: Dimens.spacingL),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.spacingL),
            child: Text(widget.apiary.name,
                style: Theme.of(context).textTheme.headline6),
          ),
          const SizedBox(height: Dimens.spacingM),
          HivesHorizontalList(widget.apiary),
          const SizedBox(height: Dimens.spacingL),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
