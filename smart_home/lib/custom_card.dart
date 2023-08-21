import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final int percentage;
  final String title;
  final String subTitle;
  final String svgUrl;
  final bool switchValue;
  final void Function(bool)? onChanged;

  const CustomCard({
    required this.percentage,
    required this.subTitle,
    required this.title,
    required this.svgUrl,
    required this.onChanged,
    required this.switchValue,
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
                value: switchValue,
                onChanged: onChanged,
              )
            ],
          )
        ],
      ),
    );
  }
}
