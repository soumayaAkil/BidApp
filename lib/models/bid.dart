class Bid {
  final int id_bid;
  final String date;
  final String heure;
  final int frais_inscrit;
  final int id_offre;

  Bid(
      {required this.id_bid,
      required this.date,
      required this.heure,
      required this.frais_inscrit,
      required this.id_offre});

  factory Bid.fromJson(dynamic json) {
    return Bid(
      id_bid: json['id_bid'] as int,
      date: json['date'] as String,
      heure: json['heure'] as String,
      frais_inscrit: json['frais_inscrit'] as int,
      id_offre: json['id_offre'] as int,
    );
  }

  static List<Bid> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Bid.fromJson(data);
    }).toList();
  }

  static List<Bid> recipesFromSnapshot2(List snapshot) {
    return snapshot.map((data) {
      return Bid.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $frais_inscrit, image: $date, rating: $heure}';
  }
}
