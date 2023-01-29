import 'package:flutter/material.dart';

class CardM{
  final int id_offre;
  final int prix_depart;
  final String status;
  final String desc_refuser;
  final int id_produit;
  final String titre;
  final String description;
  late List image = [];
  final int prix_directe;
  final int id_client;
  final int vendu;


  CardM({required  this.id_offre,required  this.prix_depart,  required  this.status, required  this.desc_refuser,
    required  this.id_produit, required this.titre,required this.description,required this.image,
  required this.prix_directe,required this.id_client, required  this.vendu});

  factory CardM.fromJson(dynamic json) {
    return CardM(
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

  static List<CardM> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return CardM.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $titre, image: $description, rating: $prix_directe, totalTime: $prix_depart}';
  }
}
