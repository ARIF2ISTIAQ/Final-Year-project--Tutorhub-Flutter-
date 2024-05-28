class ChatModel {
  final String senderid;
  final String receiverid;
  final String message;
  ChatModel(this.senderid, this.receiverid, this.message);

  factory ChatModel.fromJson(Map data) {
    return ChatModel(data["senderid"].toString() ?? "",
        data["receiverid"].toString() ?? "", data["message"].toString() ?? "");
  }
}
