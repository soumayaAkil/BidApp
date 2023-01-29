class BidDetail {
  final int id_bid;
  final String date;
  final String heure;
  final int frais_inscrit;
  final int nb_inscrit;
  final int id_offre;
  final int prix_depart;
  final String status;
  final String desc_refuser;
  final int id_produit;
  final String titre;
  final String description;
  late List image=[];
  final int prix_directe;
  final int id_client;
  final int vendu;



  BidDetail(
      {required this.id_bid,
        required this.date,
        required this.heure,
        required this.frais_inscrit,
        required this.nb_inscrit,
        required this.id_offre,
        required this.prix_depart,
        required this.status,
        required this.desc_refuser,
        required this.id_produit,
        required this.titre,
        required this.description,
        required this.image,
        required this.prix_directe,
        required this.id_client,
        required this.vendu,

      });

  factory BidDetail.fromJson(dynamic json) {
    return BidDetail(
      id_bid: json['id_bid'] as int,
      date: json['date'] as String,
      heure: json['heure'] as String,
      frais_inscrit: json['frais_inscrit'] as int,
      nb_inscrit: json['nb_inscrit'] as int,
      id_offre: json['id_offre'] as int,
      prix_depart: json['prix_depart'] as int,
      status: json['status'] as String,
      desc_refuser: json['desc_refuser'] as String,
      id_produit: json['id_produit'] as int,
      titre: json['titre'] as String,
      description: json['description'] as String,
      image: json['image'] as List,
      prix_directe: json['prix_direct'] as int,
      id_client: json['id_client'] as int,
      vendu: json['vendu'] as int,

    );
  }

  static List<BidDetail> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return BidDetail.fromJson(data);
    }).toList();
  }

  static List<BidDetail> recipesFromSnapshot2(List snapshot) {
    return snapshot.map((data) {
      return BidDetail.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $frais_inscrit, image: $date, rating: $heure}';
  }
}
