import 'package:flutter/material.dart';

class ImgResult {
  final List<dynamic> result;
  const ImgResult({required this.result});

  factory ImgResult.fromJson(Map<String, dynamic> json) {
    return ImgResult(
      result: json["result"],
    );
  }
}
