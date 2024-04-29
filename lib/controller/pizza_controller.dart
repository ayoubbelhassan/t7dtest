import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t7dpizzza/services/pizza_api.dart';
import '../model/pizza.dart';
import '../provider/pizza_local.dart';
import '../utils/sql_db.dart';


class PizzaController extends GetxController {

  RxList<Pizza> pizzas = <Pizza>[].obs;

  RxList<Pizza> pizzasComplted = <Pizza>[].obs;

  RxList<Pizza> pizzasList = <Pizza>[].obs;

  TextEditingController searchController=TextEditingController();



  void search(String searchTerm) async {

    // String searchTerm=searchController.text;

    List<Pizza> searchResult = pizzasComplted.where((pizza) =>
        pizza.name.toLowerCase().contains(searchTerm.toLowerCase())
    ).toList();

    // Update pizzas with the search result
    pizzas.assignAll(searchResult);
  }



  Future<void> getRemotePizzas() async {
    List<Pizza>? listpizza=await PizzaApi.getPizzas();
    if(listpizza!=null){
      pizzas.assignAll(listpizza);
      pizzasComplted.assignAll(listpizza);
      await PizzaLocal.saveAllPizzaLocally(listpizza);
    }
  }


  void getLocalPizza()async {
    List<Pizza>? listpizza=await PizzaLocal.getAllPizza();
    print(listpizza);
    if(listpizza != null && listpizza.length > 0){
      pizzas.assignAll(listpizza);
      pizzasComplted.assignAll(listpizza);
    }else{
      getRemotePizzas();
    }

  }


  void getPizzaPanie()async {
    List<Pizza>? listpizza=await PizzaLocal.getAllPizzaShoped();
    print("panie");
    print(listpizza);
    if(listpizza != null){

      pizzasList.assignAll(listpizza);
    }

  }



  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    await SqlDb().initialDb();

    getLocalPizza();
    getPizzaPanie();
    super.onInit();
  }

  TextEditingController nameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController prixController=TextEditingController();

  void addPizza()async{

    Pizza pizza=Pizza(id: 1, name: nameController.text, price: int.parse(prixController.text), description: descriptionController.text, img: "");

    bool result = await PizzaLocal.addPizzaLocally(pizza);

    if(result){

      pizzas.add(pizza);
      Get.snackbar("Succes", "Succes");

      nameController.clear();
      descriptionController.clear();
      prixController.clear();

    }


  }

  void removePizza(Pizza pizza)async{
    bool result = await PizzaLocal.removePizzaLocally(pizza.id);

    if(result){

      print("Woork");

      pizzas.remove(pizza);
      Get.snackbar("Succes", "Removed from list ");

    }


    }


  void UpdatePizza(Pizza pizza)async{
    bool result = await PizzaLocal.updatePizzaLocally(pizza);

    if(result){

      print("Woork");

      int index = pizzas.indexWhere((p) => p.id == pizza.id);
      if (index != -1) {
        pizzas[index] = pizza;
      }
      Get.snackbar("Succes", "Updated");

    }


    }





  void SavePizza(Pizza pizza)async{

    bool result = await PizzaLocal.SavePizza(pizza);

    if(result){
      pizzasList.add(pizza);
      Get.snackbar("Succes", "Saved");
    }


  }

  void removeSavedPizza(Pizza pizza)async{

    bool result = await PizzaLocal.removeSavedPizzad(pizza.id);

    if(result){
      pizzasList.remove(pizza);
      Get.snackbar("Succes", "removed Saved pizza");
    }


  }







}