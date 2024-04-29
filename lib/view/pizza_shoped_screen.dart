import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../controller/pizza_controller.dart';
import '../widgets/custom_pizza.dart';

class PizzaShopedScreen extends StatefulWidget {
  const PizzaShopedScreen({super.key});

  @override
  State<PizzaShopedScreen> createState() => _PizzaShopedScreenState();
}

class _PizzaShopedScreenState extends State<PizzaShopedScreen> {
  PizzaController _pizzaController=Get.put(PizzaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Obx(()=> ListView.builder(
      itemCount: _pizzaController.pizzasList.length,
      itemBuilder: (context, index) => CustomPizza(name: _pizzaController.pizzasList[index].name, price: _pizzaController.pizzasList[index].price, description: _pizzaController.pizzasList[index].description, img: _pizzaController.pizzasList[index].img, forPanie: false, onRemove: () {

        _pizzaController.removeSavedPizza(_pizzaController.pizzasList[index]);

      },),
    )),
    );
  }
}
