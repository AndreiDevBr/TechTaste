import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/splash/_core/bag_provider.dart';
import 'package:flutter_techtaste/ui/splash/home/restaurant/dish/dish.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    if (bagProvider.dishesOnBag.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sacola"),
          actions: [
            TextButton(
                onPressed: () {
                  bagProvider.clearBag();
                },
                child: Text(
                  "Limpar",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    "Nenhum pedido!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  "Lista vazia!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Sacola"),
          actions: [
            TextButton(
                onPressed: () {
                  bagProvider.clearBag();
                },
                child: Text(
                  "Limpar",
                  style: TextStyle(color: Colors.red),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Pedidos",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                Column(
                  children: List.generate(
                      bagProvider.getMapByAmount().keys.length, (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return ListTile(
                      leading: Image.asset(
                        'assets/dishes/default.png',
                        width: 48,
                        height: 48,
                      ),
                      title: Text(
                        dish.name,
                      ),
                      subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                bagProvider.removeDish(dish);
                              },
                              icon: Icon(Icons.remove)),
                          Text(
                            bagProvider.getMapByAmount()[dish].toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                bagProvider.addAllDishes([dish]);
                              },
                              icon: Icon(Icons.add)),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
