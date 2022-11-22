import 'package:flutter/material.dart';
import 'package:nearby_health_service/models/hospital_model.dart';
import 'package:nearby_health_service/pages/detail_page.dart';
import 'package:nearby_health_service/theme/style.dart';

class HospitalCard extends StatelessWidget {
  final HospitalModel hospital;
  const HospitalCard({
    super.key,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contetx) => DetailPage(hospital: hospital),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: 120,
                height: 100,
                child: Stack(
                  children: [
                    Hero(
                      tag: hospital.nama,
                      child: Image.asset(
                        'assets/hospital.jpg',
                        width: 120,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: Container(
                    //     width: 70,
                    //     height: 30,
                    //     decoration: const BoxDecoration(
                    //       color: blueColor,
                    //       borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(36),
                    //       ),
                    //     ),
                    //     child: Center(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Image.asset(
                    //             'assets/ic_star.png',
                    //             height: 22,
                    //             width: 22,
                    //           ),
                    //           Text(
                    //             '${result.rating}',
                    //             style: blackTextStyle.copyWith(
                    //               fontSize: 13,
                    //               fontWeight: semiBold,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    hospital.nama,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    hospital.provinsi,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  // Text(
                  //     "Location: ${result.geometry!.location!.lat} , ${result.geometry!.location!.lng}"),
                  // Row(
                  //   children: [
                  //     Image.asset(
                  //       'assets/ic_star.png',
                  //       color: Colors.amber,
                  //       height: 22,
                  //       width: 22,
                  //     ),
                  //     Text(
                  //       '${result.rating} (${result.userRatingsTotal})',
                  //       style: blackTextStyle.copyWith(
                  //         fontSize: 13,
                  //         fontWeight: medium,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    hospital.alamat ?? '',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    hospital.telp ?? '',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
