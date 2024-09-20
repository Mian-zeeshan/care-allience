import 'dart:convert';

class Care {
  String? id;
  String? cat;
  String? name;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? phone;
  int? ordr;

  Care({
    this.id,
    this.cat,
    this.name,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.phone,
    this.ordr,
  });

  factory Care.fromRawJson(String str) => Care.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Care.fromJson(Map<String, dynamic> json) => Care(
        id: json["id"],
        cat: json["cat"].toString().isEmpty ? "No Cat" : json["cat"],
        name: json["name"].toString().isEmpty ? "No Name" : json["name"],
        address:
            json["address"].toString().isEmpty ? "No Address" : json["address"],
        city: json["city"].toString().isEmpty ? "No City" : json["city"],
        state: json["state"].toString().isEmpty ? "No State" : json["state"],
        zip: json["zip"].toString().isEmpty ? "No Zip Code" : json["zip"],
        phone: json["phone"].toString().isEmpty
            ? "No Phone number"
            : json["phone"],
        ordr: int.parse(json["ordr"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat": cat,
        "name": name,
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
        "phone": phone,
        "ordr": ordr,
      };
}
