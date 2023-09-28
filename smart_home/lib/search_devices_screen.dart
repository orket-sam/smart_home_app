import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home/constants.dart';
import 'package:smart_home/providers/navigation_provider.dart';

class SearchDevicesScreen extends StatelessWidget {
  const SearchDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: const Color(0xff211D1D),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Search',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    color: kGrey,
                  ),
                ),
                Text(
                  '3 new devices',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(height:10),
                Expanded(
                  child: GridView.builder(
                      itemCount: devices.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        childAspectRatio: 169 / 186,
                      ),
                      itemBuilder: (context, index) {
                        return Consumer<NavigationProvider>(
                            builder: (context, value, child) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<NavigationProvider>()
                                  .setDeviceIndex(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff282424),
                                borderRadius: BorderRadius.circular(24),
                                border: index == devices.length - 1
                                    ? Border.all(
                                        color: const Color(0xff393535),
                                      )
                                    : Border.all(
                                        color:
                                            value.selectedDeviceIndex != null &&
                                                    value.selectedDeviceIndex ==
                                                        index
                                                ? const Color.fromARGB(
                                                    60, 255, 178, 103)
                                                : Colors.transparent),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    devices[index]['imageUrl'],
                                    width: 77,
                                    height: 77,
                                  ),
                                  Text(
                                    devices[index]['title'],
                                    style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: kGrey,
                                    ),
                                  ),
                                  Text(
                                    devices[index]['subtitle'],
                                    style: GoogleFonts.manrope(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: index == devices.length - 1
                                          ? const Color(0xffFFB267)
                                          : Colors.white.withOpacity(0.6),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                      }),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 15,
              left: 15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  splashFactory: NoSplash.splashFactory,
                  foregroundColor: const Color(0xff211D1D),
                  backgroundColor: const Color(0xffFFB267),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Add device'),
                ),
              ))
        ],
      ),
    );
  }
}
