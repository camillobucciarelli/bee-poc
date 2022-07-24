import 'widgets/hive_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../../domain/models/apiary.dart';
import '../../theme/theme.dart';
import 'state/hives_cubit.dart';

class HivesHorizontalList extends StatelessWidget {
  final Apiary apiary;

  const HivesHorizontalList(
    this.apiary, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardSize = MediaQuery.of(context).size.width / 2.5;
    return BlocProvider<HivesCubit>(
      create: (context) => injector()..loadHivesIn(apiary),
      child: BlocBuilder<HivesCubit, HivesState>(
        builder: (context, state) {
          if (state is HivesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HivesSuccess) {
            return SizedBox(
              height: cardSize,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: Dimens.spacingM),
                itemCount: state.hives.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: Dimens.spacingM),
                itemBuilder: (context, index) =>
                    HiveCard(state.hives[index], cardSize: cardSize),
              ),
            );
          }
          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
