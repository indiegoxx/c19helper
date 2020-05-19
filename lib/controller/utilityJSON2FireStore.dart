// void cmd()
// {
  
//     print("Fetching Data");
//     final response = await http.get("https://raw.githubusercontent.com/covid19india/api/master/resources/resources.json");
//     print("Data Recived");
//     print("Decoding");
//     sup_data=json.decode(response.body);
//     print("Decoded");

//     for(var i=0;i<sup_data["resources"].length;i++)
//     {
//       print(sup_data["resources"][i]["state"]);
//       await databaseReference.collection(sup_data["resources"][i]["state"])
//       .document()
//       .setData({
//         "category": sup_data["resources"][i]["category"],
//         "city": sup_data["resources"][i]["city"],
//         "contact": sup_data["resources"][i]["contact"],
//         "descriptionandorserviceprovided": sup_data["resources"][i]["descriptionandorserviceprovided"],
//         "nameoftheorganisation": sup_data["resources"][i]["nameoftheorganisation"],
//         "phonenumber": sup_data["resources"][i]["phonenumber"],
//         "state": sup_data["resources"][i]["state"]
//       });

//     }


//   //     await databaseReference.collection("books")
//   //     .document("1")
//   //     .setData({
//   //       'title': 'Mastering Flutter',
//   //       'description': 'Programming Guide for Dart'
//   //     });

//   // DocumentReference ref = await databaseReference.collection("books")
//   //     .add({
//   //       'title': 'Flutter in Action',
//   //       'description': 'Complete Programming Guide to learn Flutter'
//   //     });
//   // print(ref.documentID);
// }