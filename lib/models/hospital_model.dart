class HospitalModel {
  int id;
  String kode;
  String nama;
  String kota;
  String provinsi;
  String? alamat;
  String? latitude;
  String? longitude;
  String? telp;
  // String jenisFaskes;
  // String kelasRs;
  // String status;
  // String sourceData;

  HospitalModel({
    required this.id,
    required this.kode,
    required this.nama,
    required this.kota,
    required this.provinsi,
    required this.alamat,
    required this.latitude,
    required this.longitude,
    required this.telp,
    // required this.jenisFaskes,
    // required this.kelasRs,
    // required this.status,
    // required this.sourceData,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        kota: json["kota"],
        provinsi: json["provinsi"],
        alamat: json["alamat"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        telp: json["telp"],
        // jenisFaskes: json["jenis_faskes"],
        // kelasRs: json["kelas_rs"],
        // status: json["status"],
        // sourceData: json["source_data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nama": nama,
        "kota": kota,
        "provinsi": provinsi,
        "alamat": alamat,
        "latitude": latitude,
        "longitude": longitude,
        "telp": telp,
        // "jenis_faskes": jenisFaskes,
        // "kelas_rs": kelasRs,
        // "status": status,
        // "source_data": sourceData,
      };
}
