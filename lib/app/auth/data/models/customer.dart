// import 'package:tut_app/data/models/base_response_model.dart';

// class Customer extends BaseResponse {
//   String? id;
//   String? name;
//   int? numOfNotifications;
//   Contacts? contacts;

//   Customer({
//     this.id,
//     this.name,
//     this.numOfNotifications,
//     this.contacts,
//   });

//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//         id: 'id',
//         name: 'name',
//         numOfNotifications: 0,
//         contacts: Contacts.fromJson(
//           json["contacts"],
//         ),
//       )
//         ..status = json["status"] as int?
//         ..message = json["message"] as String?;

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "id": id,
//         "name": name,
//         "numOfNotifications": numOfNotifications,
//         "contacts": contacts?.toJson()
//       };
// }

// class Contacts {
//   String? email;
//   String? phone;
//   String? link;

//   Contacts({
//     this.email,
//     this.phone,
//     this.link,
//   });

//   factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
//         email: json["email"],
//         phone: json["phone"],
//         link: json["link"],
//       );

//   Map<String, dynamic> toJson() => {
//         "email": email,
//         "phone": phone,
//         "link": link,
//       };
// }
