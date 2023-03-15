import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapptic_challenge/bloc/number_details_cubit.dart';
import 'package:tapptic_challenge/bloc/number_details_state.dart';
import 'package:tapptic_challenge/model/number_model.dart';
import 'package:tapptic_challenge/widgets/error_widget.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({super.key, required this.number});

  final NumberModel number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider<NumberDetailsCubit>(
          create: (context) => NumberDetailsCubit(number)..init(),
          child: const _NumberDetailsWidget(),
        ),
      ),
    );
  }
}

class _NumberDetailsWidget extends StatelessWidget {
  const _NumberDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<NumberDetailsCubit, NumberDetailsState>(
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
          if (state.number != null) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(state.number!.image),
                const SizedBox(
                  height: 16,
                ),
                Text(state.number!.name),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
