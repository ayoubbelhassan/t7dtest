import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPizza extends StatelessWidget {

  final String name;
  final int price;
  final String description;
  final String img;
  final void Function()? onSave;
  final void Function()? onUpdate;
  final void Function() onRemove;
  final bool forPanie;


  const CustomPizza({super.key , required this.name ,required this.price ,required this.description ,required this.img ,  this.onSave , this.onUpdate , required this.onRemove , this.forPanie=true });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(img),
          ),
          title: Text(name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description),
              Text('\$$price'),
            ],
          ),
          trailing: Column(
            children: [
              GestureDetector(
                onTap: onRemove,
                  child: Icon(Icons.remove_circle , color: Colors.red, size: 18)
              ),

              Visibility(
                visible: forPanie,
                  child: GestureDetector(child: Icon(Icons.add , size: 18) , onTap: onSave,)),
              Visibility(
                visible: forPanie,
                  child: GestureDetector(child: Icon(Icons.update , size: 18) , onTap: onUpdate,)),
            ],
          ),
        ),
      ),
    );
  }
}
