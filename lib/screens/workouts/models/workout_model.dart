class WorkoutModel {
  String? title;
  String? image;
  String? description;
  String? kcal;
  List<Exercises>? exercises;

  WorkoutModel(
      {this.title, this.image, this.description, this.kcal, this.exercises});

  WorkoutModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
    kcal = json['kcal'];
    if (json['exercises'] != null) {
      exercises = <Exercises>[];
      json['exercises'].forEach((v) {
        exercises!.add(Exercises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['kcal'] = kcal;
    if (exercises != null) {
      data['exercises'] = exercises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercises {
  String? title;
  String? description;

  Exercises({this.title, this.description});

  Exercises.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
