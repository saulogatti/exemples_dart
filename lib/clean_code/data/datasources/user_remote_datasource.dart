// data/datasources/user_remote_datasource.dart
import 'package:dio/dio.dart' as http;
import 'package:exemplos_flutter/clean_code/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this.client);
  final http.Dio client;

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await client.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data = List.from(response.data as List);
      return data.map((e) => UserModel.fromJson(Map<String, dynamic>.from(e))).toList();
    } else {
      throw Exception('Erro ao buscar usuários');
    }
  }
}
