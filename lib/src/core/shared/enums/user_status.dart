
enum UserStatus {
  online(1),
  occupied(2);

  const UserStatus(this.code);
  final int code;

  bool get isOnline => this == online;
  bool get isOccupied => this == occupied;

  static UserStatus fromCode(int code) {
    final status = values.firstWhere((e) => e.code == code);
    return status;
  }  
}