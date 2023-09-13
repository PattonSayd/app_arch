class UserData {
  const UserData({
    required this.name,
  });

  final String name;

  @override
  String toString() => 'UserData(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserData && other.name == name;
  }

  @override
  int get hashCode => Object.hashAll([name]);
}
