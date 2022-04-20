import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/text_styles.dart';
import '../../core/utils/utils.dart';
import 'bloc/history_bloc.dart';
import 'hourly_expanding_widget.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    BlocProvider.of<HistoryBloc>(context).add(GetHistoryData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state is HistoryFailed) {
            showSnackBar(context, state.error);
          }
        },
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is HistoryLoading) {
              return const Loading();
            }
            if (state is HistorySuccess) {
              final historyWeather = state.hisWeather;
              return SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "History of\n5 Previous Days",
                          style: titleTextStyle(fontSize: 26),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: historyWeather.length,
                          itemBuilder: (context, index) {
                            return HourlyWeatherOfDayWidget(
                                index: index, state: state);
                          }),
                    ],
                  ),
                ),
              );
            }
            if (state is HistoryFailed) {
              return SomethingWentWrong(message: state.error);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
