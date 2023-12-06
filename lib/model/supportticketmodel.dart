// To parse this JSON data, do
//
//     final supportTicketModel = supportTicketModelFromJson(jsonString);

import 'dart:convert';

SupportTicketModel supportTicketModelFromJson(String str) =>
    SupportTicketModel.fromJson(json.decode(str));

String supportTicketModelToJson(SupportTicketModel data) =>
    json.encode(data.toJson());

class SupportTicketModel {
  SupportTicketModel({
    required this.tickets,
    required this.statuses,
    required this.msg,
  });

  Tickets tickets;
  List<Status> statuses;
  String msg;

  factory SupportTicketModel.fromJson(Map<String, dynamic> json) =>
      SupportTicketModel(
        tickets: Tickets.fromJson(json["tickets"]),
        statuses:
            List<Status>.from(json["statuses"].map((x) => Status.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "tickets": tickets.toJson(),
        "statuses": List<dynamic>.from(statuses.map((x) => x.toJson())),
        "msg": msg,
      };
}

class Status {
  Status({
    required this.id,
    required this.name,
    required this.isActive,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int isActive;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Tickets {
  Tickets({
    required this.data,
    required this.total,
  });

  List<TicketData> data;
  int total;

  factory Tickets.fromJson(Map<String, dynamic> json) => Tickets(
        data: List<TicketData>.from(
            json["data"].map((x) => TicketData.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
      };
}

class TicketData {
  TicketData({
    required this.id,
    required this.referenceNo,
    required this.subject,
    required this.description,
    required this.categoryId,
    required this.priorityId,
    required this.userId,
    required this.referId,
    required this.statusId,
    required this.createdAt,
    required this.updatedAt,
    required this.messages,
  });

  int id;
  String referenceNo;
  String subject;
  String description;
  int categoryId;
  int priorityId;
  int userId;
  dynamic referId;
  int statusId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Message> messages;

  factory TicketData.fromJson(Map<String, dynamic> json) => TicketData(
        id: json["id"],
        referenceNo: json["reference_no"],
        subject: json["subject"],
        description: json["description"],
        categoryId: json["category_id"],
        priorityId: json["priority_id"],
        userId: json["user_id"],
        referId: json["refer_id"],
        statusId: json["status_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        messages: json["messages"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reference_no": referenceNo,
        "subject": subject,
        "description": description,
        "category_id": categoryId,
        "priority_id": priorityId,
        "user_id": userId,
        "refer_id": referId,
        "status_id": statusId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    required this.id,
    required this.ticketId,
    required this.text,
    required this.userId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.attachMsgFile,
    required this.user,
  });

  int id;
  int ticketId;
  String text;
  int userId;
  int type;
  DateTime createdAt;
  DateTime updatedAt;
  List<AttachMsgFile> attachMsgFile;
  User user;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        ticketId: json["ticket_id"],
        text: json["text"],
        userId: json["user_id"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        attachMsgFile: List<AttachMsgFile>.from(
            json["attach_msg_file"].map((x) => AttachMsgFile.fromJson(x))),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ticket_id": ticketId,
        "text": text,
        "user_id": userId,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "attach_msg_file":
            List<dynamic>.from(attachMsgFile.map((x) => x.toJson())),
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    this.photo,
    required this.roleId,
    this.mobileVerifiedAt,
    required this.email,
    required this.isVerified,
    this.verifyCode,
    this.emailVerifiedAt,
    required this.notificationPreference,
    required this.isActive,
    this.avatar,
    this.slug,
    this.phone,
    this.dateOfBirth,
    this.description,
    required this.secretLogin,
    this.secretLoggedInByUser,
    required this.langCode,
    required this.currencyId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String username;
  dynamic photo;
  int roleId;
  dynamic mobileVerifiedAt;
  String email;
  int isVerified;
  dynamic verifyCode;
  dynamic emailVerifiedAt;
  String notificationPreference;
  int isActive;
  dynamic avatar;
  dynamic slug;
  dynamic phone;
  dynamic dateOfBirth;
  dynamic description;
  int secretLogin;
  dynamic secretLoggedInByUser;
  String langCode;
  int currencyId;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        username: json["username"] == null ? null : json["username"],
        photo: json["photo"],
        roleId: json["role_id"],
        mobileVerifiedAt: json["mobile_verified_at"],
        email: json["email"],
        isVerified: json["is_verified"],
        verifyCode: json["verify_code"],
        emailVerifiedAt: json["email_verified_at"],
        notificationPreference: json["notification_preference"],
        isActive: json["is_active"],
        avatar: json["avatar"],
        slug: json["slug"],
        phone: json["phone"],
        dateOfBirth: json["date_of_birth"],
        description: json["description"],
        secretLogin: json["secret_login"],
        secretLoggedInByUser: json["secret_logged_in_by_user"],
        langCode: json["lang_code"],
        currencyId: json["currency_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "username": username == null ? null : username,
        "photo": photo,
        "role_id": roleId,
        "mobile_verified_at": mobileVerifiedAt,
        "email": email,
        "is_verified": isVerified,
        "verify_code": verifyCode,
        "email_verified_at": emailVerifiedAt,
        "notification_preference": notificationPreference,
        "is_active": isActive,
        "avatar": avatar,
        "slug": slug,
        "phone": phone,
        "date_of_birth": dateOfBirth,
        "description": description,
        "secret_login": secretLogin,
        "secret_logged_in_by_user": secretLoggedInByUser,
        "lang_code": langCode,
        "currency_id": currencyId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class AttachMsgFile {
  AttachMsgFile({
    required this.id,
    required this.messageId,
    required this.url,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int messageId;
  String url;
  String name;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  factory AttachMsgFile.fromJson(Map<String, dynamic> json) => AttachMsgFile(
        id: json["id"],
        messageId: json["message_id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message_id": messageId,
        "url": url,
        "name": name,
        "type": type,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}

TicketCategories ticketCategoriesFromJson(String str) =>
    TicketCategories.fromJson(json.decode(str));

String ticketCategoriesToJson(TicketCategories data) =>
    json.encode(data.toJson());

class TicketCategories {
  TicketCategories({
    required this.categories,
    required this.msg,
  });

  List<TicketCategory> categories;
  String msg;

  factory TicketCategories.fromJson(Map<String, dynamic> json) =>
      TicketCategories(
        categories: List<TicketCategory>.from(
            json["categories"].map((x) => TicketCategory.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "msg": msg,
      };
}

class TicketCategory {
  TicketCategory({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory TicketCategory.fromJson(Map<String, dynamic> json) => TicketCategory(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

TicketPriorities ticketPrioritiesFromJson(String str) =>
    TicketPriorities.fromJson(json.decode(str));

String ticketPrioritiesToJson(TicketPriorities data) =>
    json.encode(data.toJson());

class TicketPriorities {
  TicketPriorities({
    required this.priorities,
    required this.msg,
  });

  List<TicketPriority> priorities;
  String msg;

  factory TicketPriorities.fromJson(Map<String, dynamic> json) =>
      TicketPriorities(
        priorities: List<TicketPriority>.from(
            json["priorities"].map((x) => TicketPriority.fromJson(x))),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "priorities": List<dynamic>.from(priorities.map((x) => x.toJson())),
        "msg": msg,
      };
}

class TicketPriority {
  TicketPriority({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int status;
  DateTime createdAt;
  DateTime updatedAt;

  factory TicketPriority.fromJson(Map<String, dynamic> json) => TicketPriority(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
