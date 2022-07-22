import 'package:bee/presentation/hives/state/hives_cubit.dart';
import 'package:bee/presentation/hives/widgets/hive_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependecy_injection.dart';

class HivesPage extends StatelessWidget {
  const HivesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hives'),
      ),
      body: BlocProvider<HivesCubit>(
        create: (_) => injector()..getHives(),
        child: BlocBuilder<HivesCubit, HivesState>(
          builder: (context, state) {
            if (state is HivesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HivesFailure) {
              return Center(child: Text(state.message));
            }
            state as HivesSuccess;
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: state.hives.length,
              itemBuilder: (context, index) => HiveCard(state.hives[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 25),
            );
          },
        ),
      ),
    );
  }
}
