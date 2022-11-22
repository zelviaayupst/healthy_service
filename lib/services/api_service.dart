import 'package:dio/dio.dart';
import 'package:nearby_health_service/models/hospital_model.dart';

class ApiService {
  final String hospitalUrl =
      'https://kipi.covid19.go.id/api/get-faskes-vaksinasi?skip=0&province=DKI+JAKARTA&city=JAKARTA+SELATAN';

  Future<List<HospitalModel>> hospitalList() async {
    final dio = Dio();
    var response = await dio.get(hospitalUrl);
    if (response.statusCode == 200) {
      final List data = response.data['data'];

      return data.map((item) => HospitalModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load character');
    }
  }
}
