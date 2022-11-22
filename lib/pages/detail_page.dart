import 'package:flutter/material.dart';
import 'package:nearby_health_service/models/hospital_model.dart';
import 'package:nearby_health_service/theme/style.dart';

class DetailPage extends StatefulWidget {
  final HospitalModel hospital;
  const DetailPage({
    super.key,
    required this.hospital,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            Hero(
              tag: widget.hospital.nama,
              child: Image.asset(
                'assets/hospital.jpg',
                width: deviceWidth(context),
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328.0,
                ),
                Container(
                  width: deviceWidth(context),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  widget.hospital.nama,
                                  style: blackTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 30.0,
                      ),
                      // todo : location
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Alamat',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          widget.hospital.alamat ?? '',
                          style: greyTextStyle.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: edge,
                        ),
                        child: Text(
                          'Lokasi',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        child: Text(
                          "${widget.hospital.latitude} , ${widget.hospital.longitude}",
                          style: greyTextStyle.copyWith(),
                          textAlign: TextAlign.justify,
                        ),
                      ),

                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
                        height: 50,
                        width: deviceWidth(context) - (2 * edge),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: blueColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                          onPressed: () {
                            // getUrl(
                            //   Uri.parse("tel:+62${space.phone}"),
                            // );
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // todo : button back dan favorite
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: edge,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: blueColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: isClicked ? blueColor : greyColor,
                      ),
                      onPressed: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
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
