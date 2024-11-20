// To parse this JSON data, do
//
//     final bakesEntry = bakesEntryFromJson(jsonString);

import 'dart:convert';

List<BakesEntry> bakesEntryFromJson(String str) => List<BakesEntry>.from(json.decode(str).map((x) => BakesEntry.fromJson(x)));

String bakesEntryToJson(List<BakesEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BakesEntry {
    String model;
    String pk;
    Fields fields;

    BakesEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory BakesEntry.fromJson(Map<String, dynamic> json) => BakesEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    String name;
    String description;
    int price;
    DateTime productionDate;

    Fields({
        required this.name,
        required this.description,
        required this.price,
        required this.productionDate,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        name: json["name"],
        description: json["description"],
        price: json["price"],
        productionDate: DateTime.parse(json["production_date"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "production_date": "${productionDate.year.toString().padLeft(4, '0')}-${productionDate.month.toString().padLeft(2, '0')}-${productionDate.day.toString().padLeft(2, '0')}",
    };
}
