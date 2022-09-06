import 'package:despesas_pessoais/components/utils/separator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  late DateTime? _selectedDate = DateTime.now();

  _onSubmitForm() {
    final title = _titleController.text;
    final value = double.parse(_valueController.text);
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    print('valores $title, $value, $_selectedDate');

    widget.onSubmit(title, value, _selectedDate!);
    _titleController.clear();
    _valueController.clear();
    _selectedDate = null;
    Navigator.of(context).pop();
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pd) {
      if (pd == null) {
        return null;
      }
      setState(() {
        _selectedDate = pd;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextField(
            onSubmitted: (_) => _onSubmitForm(),
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Título'),
          ),
          const Separator(Direction.horizontal),
          TextField(
            onSubmitted: (_) => _onSubmitForm(),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: _valueController,
            decoration: InputDecoration(labelText: 'Valor R\$'),
          ),
          const Separator(Direction.horizontal),
          Row(children: [
            Expanded(
              child: Text(
                _selectedDate != null
                    ? 'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}'
                    : 'Selecione uma data',
              ),
            ),
            TextButton(
              onPressed: _showDatePicker,
              child: Text(
                'Selecione uma data!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          const Separator(Direction.horizontal),
          ElevatedButton(
            onPressed: () => _onSubmitForm(),
            child: const Text('Nova despesa'),
          )
        ]),
      ),
    );
  }
}
