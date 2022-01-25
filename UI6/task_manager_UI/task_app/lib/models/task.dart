class Task {
  late String _title;
  late bool _isCompleted;

  Task({required String title, bool isCompleted = false}) {
    _title = title;
    _isCompleted = isCompleted;
  }

  String get title {
    return _title;
  }

  bool get isCompleted {
    return _isCompleted;
  }

  void changeTitle(String newTitle) {
    _title = newTitle;
  }

  void changeStatus() {
    _isCompleted = !_isCompleted;
  }
}
