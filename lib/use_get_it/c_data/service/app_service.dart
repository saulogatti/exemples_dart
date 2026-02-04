abstract class AppService {
  Future<Map<String, dynamic>> get(String key);
  List<Map<String, dynamic>> getDatabase();

  Future<void> save(String key, Map<String, dynamic> data);
}

class LocalAppService implements AppService {
  final Map<String, Map<String, dynamic>> _storage = {
    '1': {'id': 1, 'name': 'Alice', 'email': 'alice@example.com'},
    '2': {'id': 2, 'name': 'Bob', 'email': 'bob@example.com'},
  };
  int teste = 2;
  @override
  Future<Map<String, dynamic>> get(String key) async {
    return _storage[key] ?? {};
  }

  @override
  List<Map<String, dynamic>> getDatabase() {
    teste++;
    _storage['$teste'] = {'id': teste, 'name': 'User$teste', 'email': 'user$teste@example.com'};
    final list = _storage.values.toList();

    // Simula um banco de dados local
    return list;
  }

  @override
  Future<void> save(String key, Map<String, dynamic> data) async {
    _storage[key] = data;
  }
}

class RemoteAppService implements AppService {
  @override
  Future<Map<String, dynamic>> get(String key) async {
    // Simula uma chamada remota
    await Future.delayed(const Duration(seconds: 1));
    return {'remoteKey': 'remoteValue'};
  }

  @override
  List<Map<String, dynamic>> getDatabase() {
    // Simula um banco de dados remoto
    return [
      {'id': 3, 'name': 'Charlie', 'email': 'charlie@example.com'},
      {'id': 4, 'name': 'Diana', 'email': 'diana@example.com'},
    ];
  }

  @override
  Future<void> save(String key, Map<String, dynamic> data) async {
    // Simula salvar dados remotamente
    await Future.delayed(const Duration(seconds: 1));
  }
}
