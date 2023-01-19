import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geo_cam/settings/map_card_settings.dart';
import 'package:geo_cam/theme/app_consts.dart';
import 'package:geo_cam/theme/app_styles.dart';
import 'package:geo_cam/utils/app_layout.dart';
import 'package:geo_cam/widget/map_card_datas/date_stream.dart';
import 'package:geo_cam/widget/map_card_datas/location_stream.dart';

import '../settings/app_settings.dart';
import '../theme/app_colors.dart';
import 'map_card_datas/time_stream.dart';

class MapCard extends StatefulWidget {
  const MapCard({super.key});

  @override
  State<MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppConsts.locCardPad),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //? ----------------------------------------- WaterMark -----------------------------------------
          if (!AppSettings.isProVersion())
            Container(
              width: AppConsts.locCardWidth / 2.6,
              padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(5),
                vertical: AppLayout.getWidth(2),
              ),
              decoration: BoxDecoration(
                color: AppColors.mapCardBG(),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppConsts.locCardBorderRoundVal / 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //? ------------------ AppLogo ------------------
                  Container(
                    width: AppLayout.getWidth(17),
                    height: AppLayout.getHeight(17),
                    decoration: BoxDecoration(
                      color: Colors.purple[900],
                    ),
                  ),
                  Text(
                    AppConsts.appName,
                    style: AppStyles.menuText,
                  )
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //? ----------------------------------------------- Map Preview -----------------------------------------------
              Container(
                height: AppConsts.locCardHeight,
                width: AppConsts.locCardHeight,
                decoration: BoxDecoration(
                    color: AppColors.mapCardBG(),
                    borderRadius: BorderRadius.circular(
                      AppConsts.locCardBorderRoundVal,
                    )),
              ),

              //? ------------------------------------------------ Map Data ------------------------------------------------
              Container(
                height: AppConsts.locCardHeight,
                width: AppConsts.locCardWidth,
                decoration: BoxDecoration(
                  color: AppColors.mapCardBG(),
                  borderRadius: AppSettings.isProVersion()
                      ? BorderRadius.circular(AppConsts.locCardBorderRoundVal)
                      : const BorderRadius.only(
                          topLeft: AppConsts.locCardBorderRound,
                          bottomLeft: AppConsts.locCardBorderRound,
                          bottomRight: AppConsts.locCardBorderRound,
                        ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppConsts.menuPadH),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: showMapData(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> showMapData() {
    List<Widget> list = [];

    //? Address
    if (MapCardSettings.isAddressLong) {
      list.add(
        LocationStream(
          mode: GeoLocationDetailMode.more,
          style: AppStyles.mapCardText,
        ),
      );
    }

    // if (MapCardSettings.isAddressShort) {
    //   list.add(
    //     LocationStream(
    //       mode: GeoLocationDetailMode.less,
    //       style: AppStyles.mapCardText,
    //     ),
    //   );
    // }

    // if (MapCardSettings.isLongLat) {
    //   list.add(
    //     LocationStream(
    //       mode: GeoLocationDetailMode.latlong,
    //       style: AppStyles.mapCardText,
    //     ),
    //   );
    // }

    //? Date & Time
    if (MapCardSettings.isDate || MapCardSettings.isTime) {
      list.add(
        Row(
          children: [
            if (MapCardSettings.isDate) const DateStream(),
            if (MapCardSettings.isDate) Gap(AppLayout.getWidth(3)),
            if (MapCardSettings.isTime) const TimeStream(),
          ],
        ),
      );
    }

    return list;
  }
}
