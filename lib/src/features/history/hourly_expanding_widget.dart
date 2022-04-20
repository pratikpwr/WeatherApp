import 'package:flutter/material.dart';

import '../../core/constants/image_const.dart';
import '../../core/themes/app_colors.dart';
import '../../core/themes/text_styles.dart';
import '../../core/utils/utils.dart';
import '../home/hourly_weather_widget.dart';
import 'bloc/history_bloc.dart';

class HourlyWeatherOfDayWidget extends StatefulWidget {
  const HourlyWeatherOfDayWidget(
      {Key? key, required this.state, required this.index})
      : super(key: key);
  final HistorySuccess state;
  final int index;

  @override
  _HourlyWeatherOfDayWidgetState createState() =>
      _HourlyWeatherOfDayWidgetState();
}

class _HourlyWeatherOfDayWidgetState extends State<HourlyWeatherOfDayWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: _expanded ? _size.height * 0.23 : _size.height * 0.08,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: _size.width * 0.27,
                    child: Text(
                      getDayFromEpoch(
                          widget.state.hisWeather[widget.index].current.dt),
                      style: subTitleTextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: _size.width * 0.09,
                    child: Image.asset(
                      ImageAssets.getSmallAsset(
                          widget.state.icon[widget.index]),
                      width: _size.width * 0.09,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '${widget.state.max[widget.index]}°',
                    style: titleTextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '${widget.state.min[widget.index]}°',
                    style: subTitleTextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  IconButton(
                      icon: _expanded
                          ? Icon(
                              Icons.expand_less,
                              color: AppColors.iconColor,
                            )
                          : Icon(
                              Icons.expand_more,
                              color: AppColors.iconColor,
                            ),
                      onPressed: () {
                        setState(() {
                          _expanded = !_expanded;
                        });
                      }),
                ]),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: _expanded ? _size.height * 0.14 : 0,
            width: MediaQuery.of(context).size.width,
            child: Visibility(
              visible: _expanded,
              child: HourlyWeatherWidget(
                  hourWeather: widget.state.hisWeather[widget.index].hourly),
            ),
          )
        ],
      ),
    );
  }
}
