class PlayList {
  String? status;
  List<Data>? data;
  String? message;

  PlayList({this.status, this.data, this.message});

  PlayList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? type;
  String? name;
  String? duration;
  String? price_in_inr;
  String? asset_url;
  // String? price_in_dollar;

  Data(
      {this.id,
      this.type,
      this.name,
      this.duration,
      this.price_in_inr,
      this.asset_url,
      // this.price_in_dollar
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    duration = json['duration'];
    price_in_inr = json['price_in_inr'];
    asset_url = json['assets_url'];
    // price_in_dollar = json['price_in_dollar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['duration'] = duration;
    data['price_in_inr'] = price_in_inr;
    data['asset_url'] = asset_url;
    // data['price_in_dollar'] = price_in_dollar;
    return data;
  }
}


// class playlist {
//   int? id;
//   String? type;
//   String? sub_type;
//   String? name;
//   String? asset_url;
//   String? duration;
// double? price_in_inr;
//   double? price_in_dollar;

//   playlist({
//     required this.id,
//     required this.type,
//     required this.sub_type,
//     required this.name,
//     required this.asset_url,
//     required this.duration,
//     required this.price_in_inr,
//     required this.price_in_dollar,

//   });
//   factory playlist.fromJson(Map json) {
//     return playlist(
//       id: json['id'],
//       type: json['type'],
//       sub_type: json['subtype'],
//       name: json['name'],
//       asset_url: json['assetUrl'],
//       duration: json['duration'],
//       price_in_inr: json['price'].toDouble(),
//       price_in_dollar: json['price'].toDouble(),
//     );
//   }
// }
