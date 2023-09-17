import 'package:flutter/material.dart';

@immutable
class AppSettingsData {
  const AppSettingsData({
    required this.someProperty,
  });

  final bool someProperty;

  AppSettingsData copyWith({
    bool? someProperty,
  }) {
    return AppSettingsData(
      someProperty: someProperty ?? this.someProperty,
    );
  }

  @override
  String toString() => 'AppSettingsData(someProperty: $someProperty)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppSettingsData && other.someProperty == someProperty;
  }

  @override
  int get hashCode => Object.hashAll([someProperty]);
}
