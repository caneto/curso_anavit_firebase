enum ChatStatus {
  pinned(1),
  all(2);

  const ChatStatus(this.code);
  final int code;

  bool get isPinned => this == pinned;
  bool get isAll => this == all;

  static ChatStatus fromCode(int code) {
    final status = values.firstWhere((e) => e.code == code);
    return status;
  }  
}