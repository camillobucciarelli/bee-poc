import 'widgets/apiary_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection.dart';
import '../../theme/theme.dart';
import 'state/apiaries_cubit.dart';

class ApiariesPage extends StatelessWidget {
  static const String routeName = '/apiaries';

  const ApiariesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apiaries'),
      ),
      body: BlocProvider<ApiariesCubit>(
        create: (context) => injector()..loadApiaries(),
        child: BlocBuilder<ApiariesCubit, ApiariesState>(
          builder: (context, state) {
            if (state is ApiariesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ApiariesSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: Dimens.spacingL),
                itemCount: state.apiaries.length,
                itemBuilder: (context, index) {
                  return ApiaryListTile(
                    state.apiaries[index],
                    isOdd: index.isOdd,
                  );
                },
              );
            }
            return const Center(child: Text('Error'));
          },
        ),
      ),
    );
  }
}
