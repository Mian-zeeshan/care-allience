
class Category {
  String? id;
  String? name;
  String? email;
  String? pmcontact;
  String? situation;
  String? report;
  dynamic userId;
  dynamic addDate;
  String? phone;
  dynamic thelp;
  dynamic category;
  dynamic schedule;
  String? ctype;
  String? address;
  String? city;
  String? state;
  String? zip;
  String? ordr;
  String? edate;
  String? eday;
  String? etime;
  dynamic vurl;
  dynamic wlink;
  dynamic slink;
  dynamic glink;
  dynamic logo;

  Category({
    this.id,
    this.name,
    this.email,
    this.pmcontact,
    this.situation,
    this.report,
    this.userId,
    this.addDate,
    this.phone,
    this.thelp,
    this.category,
    this.schedule,
    this.ctype,
    this.address,
    this.city,
    this.state,
    this.zip,
    this.ordr,
    this.vurl,
      this.glink,
      this.logo,
      this.slink,
      this.wlink,
      this.edate,
      this.eday,
      this.etime});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"] ?? json["ename"],
        email: json["email"],
        pmcontact: json["pmcontact"],
        situation: json["situation"],
        report: json["report"] ?? json["details"],
        userId: json["user_id"],
        addDate: json["add_date"],
        phone: json["phone"],
        thelp: json["thelp"],
        category: json["category"],
        schedule: json["schedule"],
        ctype: json["ctype"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        ordr: json["ordr"],
        vurl: json["vurl"],
        logo: json["logo"],
        glink: json["glink"],
        slink: json["slink"],
        wlink: json["wlink"],
        eday: json["eday"],
        etime: json["etime"],
        edate: json["edate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "pmcontact": pmcontact,
        "situation": situation,
        "report": report,
        "user_id": userId,
        "add_date": addDate,
        "phone": phone,
        "thelp": thelp,
        "category": category,
        "schedule": schedule,
        "ctype": ctype,
        "address": address,
        "city": city,
        "state": state,
        "zip": zip,
        "ordr": ordr,
        "vurl": vurl,
        "logo": logo,
      };
}
