// ignore_for_file: unnecessary_this

class EntranceCatalogItem {
  int? level;
  String? name;
  int? cid;
  bool? isIndividual;

  EntranceCatalogItem({this.level, this.name, this.cid, this.isIndividual});

  EntranceCatalogItem.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    name = json['name'];
    cid = json['cid'];
    isIndividual = json['isIndividual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level'] = this.level;
    data['name'] = this.name;
    data['cid'] = this.cid;
    data['isIndividual'] = this.isIndividual;
    return data;
  }
}
