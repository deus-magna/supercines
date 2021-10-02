class Cast {
  Cast();

  Cast.fromJsonList(List<dynamic> jsonList) {
    for (final item in jsonList) {
      final actor = Actor.fromJson(item as Map<String, dynamic>);
      actors.add(actor);
    }
  }
  List<Actor> actors = [];
}

class Actor {
  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJson(Map<String, dynamic> json) {
    castId = json['cast_id'] as int?;
    character = json['character'] as String?;
    creditId = json['credit_id'] as String?;
    gender = json['gender'] as int?;
    id = json['id'] as int?;
    name = json['name'] as String?;
    order = json['order'] as int?;
    profilePath = json['profile_path'] as String?;
  }

  int? castId;
  String? character;
  String? creditId;
  int? gender;
  int? id;
  String? name;
  int? order;
  String? profilePath;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['gender'] = gender;
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['profile_path'] = profilePath;
    return data;
  }

  String getPhoto() {
    if (profilePath == null) {
      return 'https://bizraise.pro/wp-content/uploads/2014/09/no-avatar-300x300.png';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
