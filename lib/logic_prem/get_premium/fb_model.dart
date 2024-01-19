class FBResponseModel {
  final String prr1;
  final String kk2;
  final String prr3;
  final String kk4;
  final bool isko;
  FBResponseModel({
    required this.prr1,
    required this.kk2,
    required this.prr3,
    required this.kk4,
    required this.isko,
  });

  factory FBResponseModel.fromJson(Map<String, dynamic> map) {
    return FBResponseModel(
      prr1: map['prr1'],
      kk2: map['kk2'],
      prr3: map['prr3'],
      kk4: map['kk4'],
      isko: map['isko'],
    );
  }

  @override
  String toString() {
    return 'FBResponseModel(prr1: $prr1, kk2: $kk2, prr3: $prr3, kk4: $kk4, isko: $isko)';
  }
}
