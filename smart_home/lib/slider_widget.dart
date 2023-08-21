import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderWidget extends StatelessWidget {
  final String title;
  final String svgUrl;
  final double value;
  final void Function(double)? onChanged;
  const SliderWidget({
    required this.svgUrl,
    required this.title,
    required this.onChanged,
    required this.value,
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
                value: value,
                onChanged: onChanged,
              ),
            ),
            SvgPicture.asset(svgUrl)
          ],
        ),
      ],
    );
  }
}
