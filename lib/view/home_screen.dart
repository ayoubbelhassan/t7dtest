import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t7dpizzza/controller/pizza_controller.dart';
import 'package:t7dpizzza/model/pizza.dart';
import 'package:t7dpizzza/view/pizza_shoped_screen.dart';
import 'package:t7dpizzza/widgets/custom_pizza.dart';

import '../widgets/text_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PizzaController _pizzaController=Get.put(PizzaController());

  void updatePizza(Pizza pizza){

    _pizzaController.nameController.text=pizza.name;
    _pizzaController.prixController.text= "${pizza.price}";
    _pizzaController.descriptionController.text=pizza.description;

    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            SizedBox(height: 16,),

            TextInput(title: 'pizza name',controller: _pizzaController.nameController,),
            SizedBox(height: 8,),


            TextInput(title: 'pizza Description',controller: _pizzaController.descriptionController),
            SizedBox(height: 8,),

            TextInput(title: 'pizza prix',controller: _pizzaController.prixController),
            SizedBox(height: 8,),


            ElevatedButton(
                onPressed: () {

                  Pizza pizzaf=Pizza(id: pizza.id, name: _pizzaController.nameController.text, price: int.parse(_pizzaController.prixController.text), description: _pizzaController.descriptionController.text, img: pizza.img);

                  _pizzaController.UpdatePizza(pizzaf);

                  Navigator.pop(context);

                }, child: Text("Update"))


          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.all(8),
            child: IconButton(icon: Icon(Icons.add), onPressed: () {


              showModalBottomSheet(
                context: context,
                 builder: (context) => Container(
                   padding: EdgeInsets.all(16),
                   child: Column(
                     children: [

                       SizedBox(height: 16,),

                       TextInput(title: 'pizza name',controller: _pizzaController.nameController,),
                       SizedBox(height: 8,),


                       TextInput(title: 'pizza Description',controller: _pizzaController.descriptionController),
                       SizedBox(height: 8,),

                       TextInput(title: 'pizza prix',controller: _pizzaController.prixController),
                       SizedBox(height: 8,),


                       ElevatedButton(
                           onPressed: () {
                             _pizzaController.addPizza();
                             Navigator.pop(context);

                       }, child: Text("Add"))


                     ],
                   ),
                 ),
              );




            },)),
        actions: [
          GestureDetector(
            onTap: () {
              // Get.to(PizzaShopedScreen());

              Get.toNamed('/panie');
            },
            child: Container(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.shopping_basket)),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body:Column(
        children: [
          SizedBox(height: 16,),


          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
              child: SearchBar(onChanged: _pizzaController.search,)
          ),

          SizedBox(height: 16,),


          Obx(()=> Expanded(
            child: ListView.builder(
              itemCount: _pizzaController.pizzas.length,
              itemBuilder: (context, index) => CustomPizza(name: _pizzaController.pizzas[index].name, price: _pizzaController.pizzas[index].price, description: _pizzaController.pizzas[index].description, img: _pizzaController.pizzas[index].img, onRemove: () {
                _pizzaController.removePizza(_pizzaController.pizzas[index]);
              }, onSave: () {
                _pizzaController.SavePizza(_pizzaController.pizzas[index]);
              },
                onUpdate: () {
            
                  updatePizza(_pizzaController.pizzas[index]);
            
                },
            
              ),
            ),
          ), )

        ],
      ),
    );
  }
}
