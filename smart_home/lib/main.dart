import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffFFB267)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    color: Color(
                        0xff221d1c), // Equivalent to rgba(33, 29, 29, 0.00)
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 2 - 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomCard(
                      percentage: 34,
                      subTitle: 'Mode 2',
                      title: 'Humidifier Air',
                      svgUrl: 'assets/svgs/humidity.svg',
                    ),
                    CustomCard(
                      percentage: 67,
                      subTitle: 'On',
                      title: 'Purifier Air',
                      svgUrl: 'assets/svgs/clean.svg',
                    )
                  ],
                ),
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
                  child: const Column(
                    children: [
                      SliderWidget(
                        title: 'Main light',
                        svgUrl: 'assets/svgs/Lamp.svg',
                      ),
                      SliderWidget(
                        title: 'Floor lamp',
                        svgUrl: 'assets/svgs/Tablelamp.svg',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final int percentage;
  final String title;
  final String subTitle;
  final String svgUrl;

  const CustomCard({
    required this.percentage,
    required this.subTitle,
    required this.title,
    required this.svgUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle smallTextStyle = GoogleFonts.manrope(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.12,
      color: kGrey.withOpacity(
        0.6,
      ),
    );
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 198,
      width: MediaQuery.of(context).size.width / 2 - 20,
      decoration: BoxDecoration(
        color: const Color(0xff282424),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '$percentage %',
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w500,
                  color: kGrey,
                  fontSize: 32,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(
                svgUrl,
                width: 24,
                height: 24,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Text(
              title,
              style: smallTextStyle,
            ),
          ),
          const Divider(
            color: Color(
              0xff393535,
            ),
            thickness: 1,
          ),
          Row(
            children: [
              Text(
                subTitle,
                style: smallTextStyle,
              ),
              const Spacer(),
              Switch(
                thumbColor: const MaterialStatePropertyAll(Color(0xff000000)),
                activeColor: const Color(0xffFFB267),
                value: true,
                onChanged: (val) {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  final String title;
  final String svgUrl;
  const SliderWidget({
    required this.svgUrl,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: const Color(0xffF8F8F8),
              letterSpacing: 1.2,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Slider(
                thumbColor: Colors.white,
                activeColor: const Color(0xffFFB267),
                overlayColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xff4b4238),
                ),
                value: .3,
                onChanged: (val) {},
              ),
            ),
            SvgPicture.asset(svgUrl)
          ],
        ),
      ],
    );
  }
}
