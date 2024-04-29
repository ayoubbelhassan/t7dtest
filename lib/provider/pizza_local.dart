import '../model/pizza.dart';
import '../utils/sql_db.dart';

class PizzaLocal {
  static SqlDb _sqlDb = SqlDb();


  static Future<List<Pizza>> getAllPizza() async {
    String sql = 'SELECT * FROM pizza';
    List<Map> pizzaData = await _sqlDb.readData(sql);
    List<Pizza> pizzas = [];
    for (var pizzaMap in pizzaData) {
      pizzas.add(Pizza.fromJson(pizzaMap as Map<String, dynamic>));
    }
    return pizzas;
  }



  static Future<List<Pizza>> getAllPizzaShoped() async {
    String sql = 'SELECT * FROM pizzashoped';
    List<Map> pizzaData = await _sqlDb.readData(sql);
    List<Pizza> pizzas = [];
    for (var pizzaMap in pizzaData) {
      pizzas.add(Pizza.fromJson(pizzaMap as Map<String, dynamic>));
    }
    return pizzas;
  }






  static Future<void> saveAllPizzaLocally(List<Pizza> pizzas) async {
    for (var pizza in pizzas) {
      await _sqlDb.InsertData(
          'INSERT INTO pizza (name, price, description, img) VALUES ("${pizza.name}", ${pizza.price}, "${pizza.description}", "${pizza.img}")');
    }
  }

  static Future<bool> addPizzaLocally(Pizza pizza) async {
    int result = await _sqlDb.InsertData(
      'INSERT INTO pizza (name, price, description, img) VALUES ("${pizza.name}", ${pizza.price}, "${pizza.description}", "${pizza.img}")',
    );
    return result > 0;
  }



  static Future<bool> removePizzaLocally(int id) async {
    int result = await _sqlDb.InsertData(
      'DELETE FROM pizza WHERE id = $id',
    );
    return result > 0;
  }

  static Future<bool> updatePizzaLocally(Pizza pizza) async {
    int result = await _sqlDb.InsertData(
      'UPDATE pizza SET name = "${pizza.name}", price = ${pizza.price}, description = "${pizza.description}", img = "${pizza.img}" WHERE id = ${pizza.id}',
    );
    return result > 0;
  }



  static Future<bool> SavePizza(Pizza pizza) async {
    int result = await _sqlDb.InsertData(
      'INSERT INTO pizzashoped (name, price, description, img) VALUES ("${pizza.name}", ${pizza.price}, "${pizza.description}", "${pizza.img}")',
    );
    return result > 0;
  }




  static Future<bool> removeSavedPizzad(int id) async {
    print("hihs");
    try{

      int result = await _sqlDb.InsertData(
        'DELETE FROM pizzashoped WHERE id = $id',
      );
      print(result);
      return result > 0;

    }catch(e){
      print(e);

      return false;

    }


  }




}
