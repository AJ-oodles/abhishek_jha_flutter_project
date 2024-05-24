class Recipe{
  late final String name;
  late final String image;
  late final double rating;
  late final String totalTime;

  Recipe({required this.name,required this.image,required this.rating,required this.totalTime});
  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['name'] as String,
        image: json['images'][0]['hostedLargeUrl'] as String,//because image is in arrayformat;
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String);
  }
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $image, rating: $rating, totalTime: $totalTime}';
  }
}
