import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/providers/homescreen_provider.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/slider_widget.dart';

import 'constants.dart';
import 'custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset(
                    'assets/images/image 7.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xff221d1c),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(children: [
                  const Spacer(),
                  Text(
                    'Bedroom',
                    style: GoogleFonts.manrope(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kGrey),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 24,
                  )
                ]),
                SizedBox(height: MediaQuery.of(context).size.height / 2 - 130),
                Consumer<HomeScreenProvider>(builder: (
                  context,
                  value,
                  child,
                ) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCard(
                        switchValue: value.humidifierVal,
                        percentage: 34,
                        subTitle: 'Mode 2',
                        title: 'Humidifier Air',
                        svgUrl: 'assets/svgs/humidity.svg',
                        onChanged: (val) {
                          context
                              .read<HomeScreenProvider>()
                              .tweakSwitchValues('humidity', val);
                        },
                      ),
                      CustomCard(
                        switchValue: value.airPurifierVal,
                        percentage: 67,
                        subTitle: 'On',
                        title: 'Purifier Air',
                        svgUrl: 'assets/svgs/clean.svg',
                        onChanged: (val) {
                          context
                              .read<HomeScreenProvider>()
                              .tweakSwitchValues('air', val);
                        },
                      )
                    ],
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 20,
                    top: 10,
                  ),
                  height: MediaQuery.of(context).size.height / 2 - 260,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color(0xff282424),
                      borderRadius: BorderRadius.circular(20)),
                  child: Consumer<HomeScreenProvider>(
                      builder: (context, value, child) {
                    return Column(
                      children: [
                        SliderWidget(
                          value: context.watch<HomeScreenProvider>().lightValue,
                          title: 'Main light',
                          svgUrl: 'assets/svgs/Lamp.svg',
                          onChanged: (val) {
                            context
                                .read<HomeScreenProvider>()
                                .tweakSliderValues('light', val);
                          },
                        ),
                        SliderWidget(
                          value: context.watch<HomeScreenProvider>().lampValue,
                          title: 'Floor lamp',
                          svgUrl: 'assets/svgs/Tablelamp.svg',
                          onChanged: (val) {
                            context
                                .read<HomeScreenProvider>()
                                .tweakSliderValues('lamp', val);
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
