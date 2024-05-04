// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String accessToken;
  final String tokenType;
  final DateTime expiresAt;
  final String datetimeFormat;
  final User user;
  final Company? company;
  final String? branchId;

  UserModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresAt,
    required this.datetimeFormat,
    required this.user,
    required this.company,
    required this.branchId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresAt: DateTime.parse(json["expires_at"]),
        datetimeFormat: json["datetime_format"],
        user: User.fromJson(json["user"]),
        company:
            json["company"] != null ? Company.fromJson(json["company"]) : null,
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_at": expiresAt.toIso8601String(),
        "datetime_format": datetimeFormat,
        "user": user.toJson(),
        "company": company!.toJson(),
        "branch_id": branchId,
      };
}

class Company {
  final int id;
  final String name;
  final String name2;
  final String registrationNo;
  final String description;
  final dynamic status;
  final String urlPrefix;
  final String styles;
  final String logo;
  final String backgroundImage;
  final int userId;
  final dynamic regionId;
  final dynamic companyEmail;
  final String addressLine1;
  final dynamic addressLine2;
  final String city;
  final dynamic state;
  final String zip;
  final String country;
  final String businessAddress;
  final String contactNo;
  final int isBusinessAddressSame;
  final String typeOfBusiness;
  final String category;
  final String website;
  final String settings;
  final String vatSettings;
  final String cardSettings;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic tempPaymentSettings;
  final String companyUrl;
  final int showCardTerminalSelection;
  final dynamic dojoAccountName;
  final dynamic dojoApiKey;
  final dynamic dojoSoftwareHouseId;

  Company({
    required this.id,
    required this.name,
    required this.name2,
    required this.registrationNo,
    required this.description,
    required this.status,
    required this.urlPrefix,
    required this.styles,
    required this.logo,
    required this.backgroundImage,
    required this.userId,
    required this.regionId,
    required this.companyEmail,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.zip,
    required this.country,
    required this.businessAddress,
    required this.contactNo,
    required this.isBusinessAddressSame,
    required this.typeOfBusiness,
    required this.category,
    required this.website,
    required this.settings,
    required this.vatSettings,
    required this.cardSettings,
    required this.createdAt,
    required this.updatedAt,
    required this.tempPaymentSettings,
    required this.companyUrl,
    required this.showCardTerminalSelection,
    required this.dojoAccountName,
    required this.dojoApiKey,
    required this.dojoSoftwareHouseId,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        name2: json["name2"],
        registrationNo: json["registration_no"],
        description: json["description"],
        status: json["status"],
        urlPrefix: json["url_prefix"],
        styles: json["styles"],
        logo: json["logo"],
        backgroundImage: json["background_image"],
        userId: json["user_id"],
        regionId: json["region_id"],
        companyEmail: json["company_email"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        country: json["country"],
        businessAddress: json["business_address"],
        contactNo: json["contact_no"],
        isBusinessAddressSame: json["is_business_address_same"],
        typeOfBusiness: json["type_of_business"],
        category: json["category"],
        website: json["website"],
        settings: json["settings"],
        vatSettings: json["vat_settings"],
        cardSettings: json["card_settings"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tempPaymentSettings: json["temp_payment_settings"],
        companyUrl: json["company_url"],
        showCardTerminalSelection: json["show_card_terminal_selection"],
        dojoAccountName: json["dojo_account_name"],
        dojoApiKey: json["dojo_api_key"],
        dojoSoftwareHouseId: json["dojo_software_house_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name2": name2,
        "registration_no": registrationNo,
        "description": description,
        "status": status,
        "url_prefix": urlPrefix,
        "styles": styles,
        "logo": logo,
        "background_image": backgroundImage,
        "user_id": userId,
        "region_id": regionId,
        "company_email": companyEmail,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "city": city,
        "state": state,
        "zip": zip,
        "country": country,
        "business_address": businessAddress,
        "contact_no": contactNo,
        "is_business_address_same": isBusinessAddressSame,
        "type_of_business": typeOfBusiness,
        "category": category,
        "website": website,
        "settings": settings,
        "vat_settings": vatSettings,
        "card_settings": cardSettings,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "temp_payment_settings": tempPaymentSettings,
        "company_url": companyUrl,
        "show_card_terminal_selection": showCardTerminalSelection,
        "dojo_account_name": dojoAccountName,
        "dojo_api_key": dojoApiKey,
        "dojo_software_house_id": dojoSoftwareHouseId,
      };
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final List<String> roles;
  final Billing billing;
  final Delivery delivery;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.roles,
    required this.billing,
    required this.delivery,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        billing: Billing.fromJson(json["billing"]),
        delivery: Delivery.fromJson(json["delivery"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_number": phoneNumber,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "billing": billing.toJson(),
        "delivery": delivery.toJson(),
      };
}

class Billing {
  final String? billingAddress;
  final String? billingCity;
  final String? billingPostalCode;
  final String? billingCountry;

  Billing({
    required this.billingAddress,
    required this.billingCity,
    required this.billingPostalCode,
    required this.billingCountry,
  });

  factory Billing.fromJson(Map<String, dynamic> json) => Billing(
        billingAddress: json["billing_address"],
        billingCity: json["billing_city"],
        billingPostalCode: json["billing_postal_code"],
        billingCountry: json["billing_country"],
      );

  Map<String, dynamic> toJson() => {
        "billing_address": billingAddress,
        "billing_city": billingCity,
        "billing_postal_code": billingPostalCode,
        "billing_country": billingCountry,
      };
}

class Delivery {
  final String? deliveryAddress;
  final String? deliveryCity;
  final String? deliveryCountry;
  final String? deliveryPostalCode;

  Delivery({
    required this.deliveryAddress,
    required this.deliveryCity,
    required this.deliveryCountry,
    required this.deliveryPostalCode,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
        deliveryAddress: json["delivery_address"],
        deliveryCity: json["delivery_city"],
        deliveryCountry: json["delivery_country"],
        deliveryPostalCode: json["delivery_postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "delivery_address": deliveryAddress,
        "delivery_city": deliveryCity,
        "delivery_country": deliveryCountry,
        "delivery_postal_code": deliveryPostalCode,
      };
}
