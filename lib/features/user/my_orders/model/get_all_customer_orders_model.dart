// class GetAllCustomerOrders {
//     final bool? success;
//     final int? statusCode;
//     final String? message;
//     final MyOrdersData? data;

//     GetAllCustomerOrders({
//         this.success,
//         this.statusCode,
//         this.message,
//         this.data,
//     });

//     factory GetAllCustomerOrders.fromJson(Map<String, dynamic> json) => GetAllCustomerOrders(
//         success: json["success"],
//         statusCode: json["statusCode"],
//         message: json["message"],
//         data: json["data"] == null ? null : MyOrdersData.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "statusCode": statusCode,
//         "message": message,
//         "data": data?.toJson(),
//     };
// }

// class MyOrdersData {
//     final Meta? meta;
//     final List<MyOrdersModel>? result;

//     MyOrdersData({
//         this.meta,
//         this.result,
//     });

//     factory MyOrdersData.fromJson(Map<String, dynamic> json) => MyOrdersData(
//         meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
//         result: json["result"] == null ? [] : List<MyOrdersModel>.from(json["result"]!.map((x) => MyOrdersData.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "meta": meta?.toJson(),
//         "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
//     };
// }

// class Meta {
//     final int? page;
//     final int? limit;
//     final int? total;
//     final int? totalPage;

//     Meta({
//         this.page,
//         this.limit,
//         this.total,
//         this.totalPage,
//     });

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         page: json["page"],
//         limit: json["limit"],
//         total: json["total"],
//         totalPage: json["totalPage"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "limit": limit,
//         "total": total,
//         "totalPage": totalPage,
//     };
// }

// class MyOrdersModel {
//     final Address? pickUpAddress;
//     final Address? deliveryAddress;
//     final String? id;
//     final String? invoiceId;
//     final String? transactionId;
//     final int? subTotal;
//     final int? totalAmount;
//     final Status? status;
//     final int? deliveryFee;
//     final DateTime? createdAt;
//     final DateTime? updatedAt;
//     final CustomerId? customerId;
//     final SellerId? sellerId;
//     final dynamic riderId;
//     final Seller? seller;
//     final Customer? customer;

//     MyOrdersModel({
//         this.pickUpAddress,
//         this.deliveryAddress,
//         this.id,
//         this.invoiceId,
//         this.transactionId,
//         this.subTotal,
//         this.totalAmount,
//         this.status,
//         this.deliveryFee,
//         this.createdAt,
//         this.updatedAt,
//         this.customerId,
//         this.sellerId,
//         this.riderId,
//         this.seller,
//         this.customer,
//     });

//     factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
//         pickUpAddress: json["pickUpAddress"] == null ? null : Address.fromJson(json["pickUpAddress"]),
//         deliveryAddress: json["deliveryAddress"] == null ? null : Address.fromJson(json["deliveryAddress"]),
//         id: json["id"],
//         invoiceId: json["invoiceId"],
//         transactionId: json["transactionId"],
//         subTotal: json["subTotal"],
//         totalAmount: json["totalAmount"],
//         status: statusValues.map[json["status"]]!,
//         deliveryFee: json["deliveryFee"],
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         customerId: customerIdValues.map[json["customerId"]]!,
//         sellerId: sellerIdValues.map[json["sellerId"]]!,
//         riderId: json["riderId"],
//         seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
//         customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "pickUpAddress": pickUpAddress?.toJson(),
//         "deliveryAddress": deliveryAddress?.toJson(),
//         "id": id,
//         "invoiceId": invoiceId,
//         "transactionId": transactionId,
//         "subTotal": subTotal,
//         "totalAmount": totalAmount,
//         "status": statusValues.reverse[status],
//         "deliveryFee": deliveryFee,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "customerId": customerIdValues.reverse[customerId],
//         "sellerId": sellerIdValues.reverse[sellerId],
//         "riderId": riderId,
//         "seller": seller?.toJson(),
//         "customer": customer?.toJson(),
//     };
// }

// class Customer {
//     final CustomerId? id;
//     final User? user;

//     Customer({
//         this.id,
//         this.user,
//     });

//     factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//         id: customerIdValues.map[json["id"]]!,
//         user: json["user"] == null ? null : User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": customerIdValues.reverse[id],
//         "user": user?.toJson(),
//     };
// }

// enum CustomerId {
//     THE_68_D3_B735_E48_B5_FA48_DA19_DE8
// }

// final customerIdValues = EnumValues({
//     "68d3b735e48b5fa48da19de8": CustomerId.THE_68_D3_B735_E48_B5_FA48_DA19_DE8
// });

// class User {
//     final Name? name;

//     User({
//         this.name,
//     });

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         name: nameValues.map[json["name"]]!,
//     );

//     Map<String, dynamic> toJson() => {
//         "name": nameValues.reverse[name],
//     };
// }

// enum Name {
//     CUSTOMER_1
// }

// final nameValues = EnumValues({
//     "Customer 1": Name.CUSTOMER_1
// });

// class Address {
//     final dynamic locationType;
//     final AddressEnum? address;
//     final double? longitude;
//     final double? latitude;

//     Address({
//         this.locationType,
//         this.address,
//         this.longitude,
//         this.latitude,
//     });

//     factory Address.fromJson(Map<String, dynamic> json) => Address(
//         locationType: json["locationType"],
//         address: addressEnumValues.map[json["address"]]!,
//         longitude: json["longitude"]?.toDouble(),
//         latitude: json["latitude"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "locationType": locationType,
//         "address": addressEnumValues.reverse[address],
//         "longitude": longitude,
//         "latitude": latitude,
//     };
// }

// enum AddressEnum {
//     DDDD,
//     THE_123_BANANI_STREET_DHAKA
// }

// final addressEnumValues = EnumValues({
//     "dddd": AddressEnum.DDDD,
//     "123 Banani Street, Dhaka": AddressEnum.THE_123_BANANI_STREET_DHAKA
// });

// class Seller {
//     final SellerId? id;
//     final ShopName? shopName;

//     Seller({
//         this.id,
//         this.shopName,
//     });

//     factory Seller.fromJson(Map<String, dynamic> json) => Seller(
//         id: sellerIdValues.map[json["id"]]!,
//         shopName: shopNameValues.map[json["shopName"]]!,
//     );

//     Map<String, dynamic> toJson() => {
//         "id": sellerIdValues.reverse[id],
//         "shopName": shopNameValues.reverse[shopName],
//     };
// }

// enum SellerId {
//     THE_68_DA13345_AF30_A405_EF2_C520
// }

// final sellerIdValues = EnumValues({
//     "68da13345af30a405ef2c520": SellerId.THE_68_DA13345_AF30_A405_EF2_C520
// });

// enum ShopName {
//     CONSTRACTION_STORE
// }

// final shopNameValues = EnumValues({
//     "Constraction Store": ShopName.CONSTRACTION_STORE
// });

// enum Status {
//     PLACED
// }

// final statusValues = EnumValues({
//     "PLACED": Status.PLACED
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }






class GetAllCustomerOrders {
    bool? success;
    int? statusCode;
    String? message;
    Data? data;

    GetAllCustomerOrders({
        this.success,
        this.statusCode,
        this.message,
        this.data,
    });

    factory GetAllCustomerOrders.fromJson(Map<String, dynamic> json) => GetAllCustomerOrders(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    Meta? meta;
    List<MyOrdersModel>? result;

    Data({
        this.meta,
        this.result,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        result: json["result"] == null ? [] : List<MyOrdersModel>.from(json["result"]!.map((x) => MyOrdersModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta?.toJson(),
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Meta {
    int? page;
    int? limit;
    int? total;
    int? totalPage;

    Meta({
        this.page,
        this.limit,
        this.total,
        this.totalPage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        page: json["page"],
        limit: json["limit"],
        total: json["total"],
        totalPage: json["totalPage"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "total": total,
        "totalPage": totalPage,
    };
}

class MyOrdersModel {
    Address? pickUpAddress;
    Address? deliveryAddress;
    String? id;
    String? invoiceId;
    String? transactionId;
    int? subTotal;
    int? totalAmount;
    String? status;
    int? deliveryFee;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? customerId;
    String? sellerId;
    dynamic riderId;
    Seller? seller;
    Customer? customer;

    MyOrdersModel({
        this.pickUpAddress,
        this.deliveryAddress,
        this.id,
        this.invoiceId,
        this.transactionId,
        this.subTotal,
        this.totalAmount,
        this.status,
        this.deliveryFee,
        this.createdAt,
        this.updatedAt,
        this.customerId,
        this.sellerId,
        this.riderId,
        this.seller,
        this.customer,
    });

    factory MyOrdersModel.fromJson(Map<String, dynamic> json) => MyOrdersModel(
        pickUpAddress: json["pickUpAddress"] == null ? null : Address.fromJson(json["pickUpAddress"]),
        deliveryAddress: json["deliveryAddress"] == null ? null : Address.fromJson(json["deliveryAddress"]),
        id: json["id"],
        invoiceId: json["invoiceId"],
        transactionId: json["transactionId"],
        subTotal: json["subTotal"],
        totalAmount: json["totalAmount"],
        status: json["status"],
        deliveryFee: json["deliveryFee"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        customerId: json["customerId"],
        sellerId: json["sellerId"],
        riderId: json["riderId"],
        seller: json["seller"] == null ? null : Seller.fromJson(json["seller"]),
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    );

    Map<String, dynamic> toJson() => {
        "pickUpAddress": pickUpAddress?.toJson(),
        "deliveryAddress": deliveryAddress?.toJson(),
        "id": id,
        "invoiceId": invoiceId,
        "transactionId": transactionId,
        "subTotal": subTotal,
        "totalAmount": totalAmount,
        "status": status,
        "deliveryFee": deliveryFee,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "customerId": customerId,
        "sellerId": sellerId,
        "riderId": riderId,
        "seller": seller?.toJson(),
        "customer": customer?.toJson(),
    };
}

class Customer {
    String? id;
    User? user;

    Customer({
        this.id,
        this.user,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
    };
}

class User {
    String? name;

    User({
        this.name,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Address {
    dynamic locationType;
    String? address;
    double? longitude;
    double? latitude;

    Address({
        this.locationType,
        this.address,
        this.longitude,
        this.latitude,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        locationType: json["locationType"],
        address: json["address"],
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "locationType": locationType,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
    };
}

class Seller {
    String? id;
    String? shopName;

    Seller({
        this.id,
        this.shopName,
    });

    factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        shopName: json["shopName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shopName": shopName,
    };
}