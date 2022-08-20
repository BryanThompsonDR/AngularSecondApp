class Hero {
  int id = 0;
  String name = '';

  Hero(this.id,this.name);

  
  factory Hero.fromJson(Map<String, dynamic> hero) =>
      Hero(_toInt(hero['id']), hero['name']);
  
  Map toJson() => {'id': id, 'name': name};

  static Hero blankHero(){
    return Hero(0,'');
  }
}

int _toInt(id) => id is int ? id : int.parse(id);