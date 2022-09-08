import 'package:flutter/foundation.dart';
import 'package:sqlite3/sqlite3.dart';
import '../database/db.dart';
import '../models/despesa_model.dart';
import '../utils/sub_date.dart';

class DespesaRepository extends ChangeNotifier {
  Database? _despesa;
  List<DespesaModel> items = [];

  DespesaRepository() {
    _initRepository();
  }

  _initRepository() async {
    _despesa = await DB.instance.database;
    _refresh();
  }

  _refresh() async {
    final result = _despesa!.select('select * from despesa', []);

    items = [];

    for (final Row row in result) {
      final data = addRow(row['id'], row['title'], row['value'], DateTime.fromMillisecondsSinceEpoch(row['date']));
      items.add(data);
    }

    notifyListeners();
  }

  DespesaModel addRow(int id, String title, double value, DateTime date) {
    return DespesaModel.fromMap({
      "id": id,
      "title": title,
      "value": value,
      "date": date,
    });
  }

  Future<void> _insert(String title, double value, DateTime date) async {
    final List<dynamic> list = [title, value, date.millisecondsSinceEpoch];
      //final id = Random().nextInt(99999999);
    try {
      _despesa!.execute('insert into despesa (title, value, date) values(?,?,?)', list);
      final id = _despesa!.lastInsertRowId;
      final data = addRow(id, title, value, date);
      items.add(data);
    } catch (e) {
      throw Exception('Erro ao tentar inserir na tabela ${e.toString()}');
    }

    //_refresh();
    notifyListeners();
  }

  void add(String title, double value, DateTime date) async {
    await _insert(title, value, date);
  }

  void remove(int id) {
    try {
      _despesa!.execute('delete from despesa where id = ?', [id]);
      items.removeWhere((e) => e.id == id);
    } catch (e) {
      throw Exception('Erro ao tentar deletar ${e.toString()}');
    }
    notifyListeners();
  }

  List<DespesaModel> recentTransactions() {
    return items.where((tr) => tr.date!.isAfter(subDate(7))).toList();
  }

  /// chartIsVisble */
  bool _chartIsVisible = false;
  bool get chatIsVisible => _chartIsVisible;

  set chatIsVisible(bool v) {
    _chartIsVisible = v;
    notifyListeners();
  }

  ///End chartIsVisble */

  @override
  void dispose() {
    super.dispose();
  }
}
