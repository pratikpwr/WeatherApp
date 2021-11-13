import 'package:app/src/config/color_const.dart';
import 'package:app/src/config/config.dart';
import 'package:app/src/utils/utils.dart';
import 'package:app/src/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/modules/history/bloc/history_bloc.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  bool isVisible = false;
  @override
  void initState() {
    BlocProvider.of<HistoryBloc>(context).add(GetHistoryData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History of 5 Days",
          style: Styles.titleTextStyle(fontSize: 26),
        ),
        elevation: 0,
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
      ),
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
            if (state is HistorySucess) {
              final historyWeather = state.hisWeather;
              return SafeArea(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: historyWeather.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: _size.width * 0.27,
                                      child: Text(
                                        getDayFromEpoch(
                                            state.hisWeather[index].current.dt),
                                        style: Styles.subTitleTextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      width: _size.width * 0.09,
                                      child: Image.asset(
                                        ImageAssets.getSmallAsset(
                                            state.icon[index]),
                                        width: _size.width * 0.09,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '${state.max[index]}°',
                                      style: Styles.titleTextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '${state.min[index]}°',
                                      style: Styles.subTitleTextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isVisible = !isVisible;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.arrow_drop_down_rounded,
                                          size: 32,
                                          color: ColorConstants.iconColor,
                                        ))
                                  ]),
                            ),
                            Visibility(
                                visible: isVisible, child: spacer(height: 10)),
                            Visibility(
                              visible: isVisible,
                              child: HourlyWeatherWidget(
                                  hourWeather: historyWeather[index].hourly!),
                            )
                          ],
                        ),
                      );
                    }),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class HoulyWeatherOfDayWidget extends StatefulWidget {
  const HoulyWeatherOfDayWidget(
      {Key? key, required this.state, required this.index})
      : super(key: key);
  final HistorySucess state;
  final int index;
  @override
  _HoulyWeatherOfDayWidgetState createState() =>
      _HoulyWeatherOfDayWidgetState();
}

class _HoulyWeatherOfDayWidgetState extends State<HoulyWeatherOfDayWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _expanded ? 350 : 100,
      child: Card(
        elevation: 10,
        color: Theme.of(context).canvasColor,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: _expanded ? 300 : 0,
              width: MediaQuery.of(context).size.width,
              child: HourlyWeatherWidget(
                  hourWeather: widget.state.hisWeather[widget.index].hourly!),
            )
          ],
        ),
      ),
    );
  }
}
