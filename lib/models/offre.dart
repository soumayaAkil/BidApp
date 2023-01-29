class Offre {
  final int id_offre;
  final String titre;
  final String description;
  late List image=[];
  final String status;
  final int prix_depart;
  final int prix_directe;
  final int id_client;
  final String desc_refuser;


  Offre({required this.id_offre, required this.titre,required this.description,required this.image,
    required this.status,required this.prix_depart,required this.prix_directe,required this.id_client,
    required String this.desc_refuser});

  factory Offre.fromJson(dynamic json) {
    return Offre(
        id_offre: json['id_offre'] as int,
        titre: json['titre'] as String,
        description: json['description'] as String,
        image: json['image'] as List,
      status: json['status'] as String,
        prix_depart: json['prix_depart'] as int,
        prix_directe: json['prix_direct'] as int,
      id_client: json['id_client'] as int,
      desc_refuser: json['desc_refuser'] as String,
    );
  }

  static List<Offre> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Offre.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $titre, image: $description, rating: $prix_directe, totalTime: $prix_depart}';
  }
}
