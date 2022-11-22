import 'package:flutter/material.dart';
import 'package:nearby_health_service/providers/hospital_provider.dart';
import 'package:nearby_health_service/theme/style.dart';
import 'package:nearby_health_service/widgets/hospital_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HospitalProvider>(context, listen: false).getNearbyHospitals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          SizedBox(
            height: edge,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Healthy Services',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Mencari pelayanan kesehatan terdekat',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            margin: EdgeInsets.only(
              right: edge,
              left: edge,
            ),
            child: Consumer<HospitalProvider>(
              builder: (context, provider, child) {
                final data = provider.hospital;
                if (provider.state == ResultState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(color: blueColor),
                  );
                } else if (provider.state == ResultState.error) {
                  return const Center(
                    child: Text('Error Data'),
                  );
                } else {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return HospitalCard(hospital: data[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
