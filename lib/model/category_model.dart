class CategoryModel {
    String? category;
    String? data;

    CategoryModel({
        this.category,
        this.data,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        category: json["category"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "data": data,
    };
}
