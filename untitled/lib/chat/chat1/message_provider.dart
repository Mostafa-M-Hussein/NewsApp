import 'message.dart';
import 'user.dart';
import 'conversion.dart';

class MessageProvide {

  static Conversion getConverasion() {
    User user1 = User(name: "Mostafa Mahmoud",
        avatar: "assets/shared/avatar.jpg",
        phone: "010283755");
    User user2 = User(name: "Medo Salem ",
        avatar: "assets/shared/avatar.jpg",
        phone: "010283755");
    return Conversion(users: [
      user1,
      user2
    ],
        messasge: [
          Message(
              sender: user1,
              reciver: user2,
              dateTime: "10/20/30",
              body: "This my Message "),
          Message(
              sender: user2,
              reciver: user1,
              dateTime: "10/20/30",
              body: "This my Message "),
          Message(
              sender: user1,
              reciver: user2,
              dateTime: "10/20/30",
              body: "This my Message "),
          Message(
              sender: user2,
              reciver: user1,
              dateTime: "10/20/30",
              body: "This my Message "),
          Message(
              sender: user1,
              reciver: user2,
              dateTime: "10/20/30",
              body: "This my Message "),

        ]);
  }

  static List<Conversion> geConversion() {
    User user1 = User(name: "Mostafa Mahmoud ",
        avatar: "assets/shared/avatar.jpg",
        phone: "010283755");
    User user2 = User(name: "Medo Salem ",
        avatar: "assets/shared/avatar.jpg",
        phone: "010283755");

    return [

      Conversion(users: [
        user1,
        user2
      ],
          messasge: [
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),

          ]),
      Conversion(users: [
        user1,
        user2
      ],
          messasge: [
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),

          ]),
      Conversion(users: [
        user1,
        user2
      ],
          messasge: [
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),

          ]),
      Conversion(users: [
        user1,
        user2
      ],
          messasge: [
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),

          ]),
      Conversion(users: [
        user1,
        user2
      ],
          messasge: [
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),
            Message(
                sender: user1,
                reciver: user2,
                dateTime: "10/20/30",
                body: "This my Message "),

          ]),
    ];
  }
}
