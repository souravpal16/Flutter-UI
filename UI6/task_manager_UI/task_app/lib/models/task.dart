class Task {
  late String _id;
  late String _title;
  late bool _isCompleted;

  Task({String id = '', required String title, bool isCompleted = false}) {
    _id = id;
    _title = title;
    _isCompleted = isCompleted;
  }

  String get title {
    return _title;
  }

  bool get isCompleted {
    return _isCompleted;
  }

  String get id {
    return _id;
  }

  set setId(String id) {
    _id = id;
  }

  void changeTitle(String newTitle) {
    _title = newTitle;
  }

  void changeStatus() {
    _isCompleted = !_isCompleted;
  }
}
