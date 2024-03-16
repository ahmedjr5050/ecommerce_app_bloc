class Homedatamodels {
    bool status;
    dynamic message;
    Data data;

    Homedatamodels({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Homedatamodels.fromJson(Map<String, dynamic> json) => Homedatamodels(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<BannerModelsData> bannersdata;
    List<ProductHomedata> productsdata;
    String ad;

    Data({
        required this.bannersdata,
        required this.productsdata,
        required this.ad,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        bannersdata: List<BannerModelsData>.from(json["banners"].map((x) => BannerModelsData.fromJson(x))),
        productsdata: List<ProductHomedata>.from(json["products"].map((x) => ProductHomedata.fromJson(x))),
        ad: json["ad"],
    );

    Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(bannersdata.map((x) => x.toJson())),
        "products": List<dynamic>.from(productsdata.map((x) => x.toJson())),
        "ad": ad,
    };
}

class BannerModelsData {
    int id;
    String image;
    dynamic category;
    dynamic product;

    BannerModelsData({
        required this.id,
        required this.image,
        required this.category,
        required this.product,
    });

    factory BannerModelsData.fromJson(Map<String, dynamic> json) => BannerModelsData(
        id: json["id"],
        image: json["image"],
        category: json["category"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category": category,
        "product": product,
    };
}

class ProductHomedata {
    int id;
    double price;
    double oldPrice;
    int discount;
    String image;
    String name;
    String description;
    List<String> images;
    bool inFavorites;
    bool inCart;

    ProductHomedata({
        required this.id,
        required this.price,
        required this.oldPrice,
        required this.discount,
        required this.image,
        required this.name,
        required this.description,
        required this.images,
        required this.inFavorites,
        required this.inCart,
    });

    factory ProductHomedata.fromJson(Map<String, dynamic> json) => ProductHomedata(
        id: json["id"],
        price: json["price"]?.toDouble(),
        oldPrice: json["old_price"]?.toDouble(),
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "in_favorites": inFavorites,
        "in_cart": inCart,
    };
}
