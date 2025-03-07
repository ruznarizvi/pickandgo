import 'package:pickandgo/screens/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as u;
import 'package:flutter/material.dart';

import 'models/model.dart';

class DatabaseHelper{
//readRecipes method
  Stream<List<UserModel>> readCustomers() => FirebaseFirestore.instance
      .collection('users')
      .where(
      'role', isEqualTo: "User"
  )
  //to get all the documents from the firebase connection
  //returns true snapshot of map string dynamic so we get sm json data bak
      .snapshots()
  //convert json data to user objects
      .map((snapshot) =>
  //going over all snapshot documents
  snapshot.docs.map((doc) =>
  //and convert each document back to user objects
  UserModel.fromMap(doc.data())).toList());

  //readRecipes method
  // Stream<List<UserModel>> readUser() => FirebaseFirestore.instance
  //     .collection('users')
  // //to get all the documents from the firebase connection
  // //returns true snapshot of map string dynamic so we get sm json data bak
  //     .snapshots()
  // //convert json data to user objects
  //     .map((snapshot) =>
  // //going over all snapshot documents
  // snapshot.docs.map((doc) =>
  // //and convert each document back to user objects
  // UserModel.fromJson(doc.data())).toList());

  //
  // //insert a recipe
  // Future createRecipe(Recipe recipe) async{
  //   final docUser = FirebaseFirestore.instance.collection('recipe').doc();
  //   recipe.id = docUser.id;
  //   final json = recipe.toJson();
  //   //create document and write data to firebase
  //   await docUser.set(json);
  // }
  //
  //
  // //update a recipe
  // Future updateRecipe(Recipe recipe, {String? idy}) async{
  //
  //   final docUser = FirebaseFirestore.instance.collection('recipe').doc(idy);
  //   //convert to json
  //   final json = recipe.toJson();
  //   //update data
  //   await docUser.update(json);
  // }
  //
  // //delete Recipe Method
  // deletemethod(String id){
  //   final docUser = FirebaseFirestore.instance.collection('recipe').doc(id);
  //   //delete the recipe matching the id
  //   docUser.delete();
  //
  // }
  //
  //
  //logout function
  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await u.FirebaseAuth.instance.signOut();
    print("Signed out Successfully");

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
  // }
  //
  // //readRecipes method
  // Stream<List<Recipe>>readRecipes()=>FirebaseFirestore.instance.collection('recipe')
  //     //to get all the documents from the firebase connection
  // //returns true snapshot of map string dynamic so we get sm json data bak
  //     .snapshots()
  //     //convert json data to user objects
  //     .map((snapshot) =>
  //     //going over all snapshot documents
  //     snapshot.docs.map((doc) =>
  //     //and convert each document back to user objects
  //        Recipe.fromJson(doc.data())).toList());
  //
  //
  // Stream<List<Recipe>>readCategoryDetails(String queryString)=>FirebaseFirestore.instance.collection('recipe')
  //     //a where condition to select the recipes
  //     //matching the queryString category
  //     .where(
  //     'category', isEqualTo: queryString
  // )
  // //to get all the documents from the firebase connection
  // //returns true snapshot of map string dynamic so we get sm json data bak
  //     .snapshots()
  // //convert json data to user objects
  //     .map((snapshot) =>
  // //going over all snapshot documents
  // snapshot.docs.map((doc) =>
  // //and convert each document back to user objects
  // Recipe.fromJson(doc.data())).toList());
  //
  //
  //
  // Stream<List<Recipe>>readFavouriteDetails(String queryString)=>FirebaseFirestore.instance.collection('recipe')
  // //a where condition to select the recipes
  // //matching the queryString
  //     .where(
  //     'favourites', arrayContains: queryString
  // )
  // //to get all the documents from the firebase connection
  // //returns true snapshot of map string dynamic so we get sm json data bak
  //     .snapshots()
  // //convert json data to user objects
  //     .map((snapshot) =>
  // //going over all snapshot documents
  // snapshot.docs.map((doc) =>
  // //and convert each document back to user objects
  // Recipe.fromJson(doc.data())).toList());
  //
  //
  //
  // Stream<List<Recipe>>readNameDetails(String queryString)=>FirebaseFirestore.instance.collection('recipe')
  // //a where condition to select the recipes
  // //matching the queryString
  //     .where(
  //     'name'.toLowerCase(), isEqualTo: queryString
  // )
  // //to get all the documents from the firebase connection
  // //returns true snapshot of map string dynamic so we get sm json data bak
  //     .snapshots()
  // //convert json data to user objects
  //     .map((snapshot) =>
  // //going over all snapshot documents
  // snapshot.docs.map((doc) =>
  // //and convert each document back to user objects
  // Recipe.fromJson(doc.data())).toList());



}