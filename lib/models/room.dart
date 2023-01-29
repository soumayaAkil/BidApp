class Room {
  final int id_room;
  final int current_value;
  final String nom;
  final String prenom;
  final int id_bid;
  final DateTime time_add;
  final String topic;



  Room({required this.id_room,required this.current_value,required this.nom,required this.prenom,required this.id_bid,required this.time_add,required this.topic});

  factory Room.fromJson(dynamic json) {
    return Room(
      id_room: json['id_room'] as int,
      current_value: json['current_value'] as int,
      nom: json['nom'] as String,
      prenom: json['prenom'] as String,
      id_bid: json['id_bid'] as int,
      time_add: json['time_add'] as DateTime,
      topic: json['topic'] as String,

    );
  }

  static List<Room> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Room.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $id_bid, image: $id_room, totalTime: $topic}';
  }
}
