class Produit {
  final int id_produit;
  final String titre;
  final String description;
  final String image;
  final String vendu;
  final int prix_directe;
  final int id_client;


  Produit({required this.id_produit, required this.titre,required this.description,required this.image,
    required this.vendu,required this.prix_directe,required this.id_client,});

  factory Produit.fromJson(dynamic json) {
    return Produit(
      id_produit: json['id_offre'] as int,
      titre: json['titre'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      vendu: json['vendu'] as String,
      prix_directe: json['prix_direct'] as int,
      id_client: json['id_client'] as int,
    );
  }

  static List<Produit> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Produit.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $titre, image: $description, rating: $prix_directe,}';
  }
}
