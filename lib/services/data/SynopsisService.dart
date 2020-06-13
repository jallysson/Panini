import 'package:dio/dio.dart';
import 'dart:io';
import 'package:panini/models/SynopsisResult.dart';

class SynopsisService
{
  final Dio dio = Dio();

  Future<SynopsisResult> search(String term) async {
    try {
      Response response =
          await dio.get('localhost:5000/synopsis');

      return SynopsisResult.fromJson(response.data);
    } catch (e) {
      throw SocketException(e);
    }
  }
}