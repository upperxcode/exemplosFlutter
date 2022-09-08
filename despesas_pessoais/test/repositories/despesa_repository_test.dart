import 'package:despesas_pessoais/repositories/despesa_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('inserir no banco de dados', () {
    DespesaRepository db = DespesaRepository();
    db.add('teste', 20.34, DateTime.now());
    expect(db, 'null');
  });
}
