import 'package:despesas_pessoais/repositories/despesa_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final DespesaRepository transaction;

  const TransactionList(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transaction,
      builder: (context, child) {
        return transaction.items.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constraints) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Sem dados ...',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                          height: constraints.maxHeight * 0.6,
                          child: Image.asset(
                            'assets/images/empty-folder.png',
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: transaction.items.length,
                itemBuilder: (ctx, index) {
                  final tr = transaction.items[index];
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(child: Text('${tr.value}')),
                        ),
                      ),
                      title: Text(
                        tr.title!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date!)),
                      trailing: IconButton(
                        onPressed: () => transaction.remove(transaction.items[index].id!),
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  );
                });
      },
    );
  }
}
