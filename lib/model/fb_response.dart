class FireBaseAuthResponse {
  String? id;
  final String message;
  final bool status;

  FireBaseAuthResponse({required this.message, required this.status, this.id});
}
