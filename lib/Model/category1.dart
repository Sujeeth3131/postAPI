class category {
  bool? _success;

  category({bool? success}) {
    if (success != null) {
      this._success = success;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;

  category.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    return data;
  }
}