import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapptic_challenge/bloc/list_cubit.dart';
import 'package:tapptic_challenge/routing/app_router.dart';
import 'package:tapptic_challenge/widgets/error_widget.dart';

import '../bloc/list_state.dart';
import '../model/number_model.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider<ListCubit>(
          create: (context) => ListCubit()..init(),
          child: const _NumberListWidget(),
        ),
      ),
    );
  }
}

class _NumberListWidget extends StatelessWidget {
  const _NumberListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        if (state.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.error?.isNotEmpty == true) {
          return AppErrorWidget(
            error: state.error!,
          );
        }
        if (state.numbers.isNotEmpty) {
          return ListView.builder(
              itemCount: state.numbers.length,
              itemBuilder: (BuildContext context, int index) {
                return _NumberListItem(number: state.numbers[index]);
              });
        }
        return Container();
      },
    );
  }
}

class _NumberListItem extends StatelessWidget {
  final NumberModel number;

  const _NumberListItem({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(number.image),
      title: Text(number.name),
      onTap: () {
        context.pushRoute(
          NumberRoute(number: number),
        );
      },
      tileColor: Colors.white,
    );
  }
}
