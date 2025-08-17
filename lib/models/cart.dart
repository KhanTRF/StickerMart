import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/shoe.dart';

class Cart extends ChangeNotifier{
  List <Shoe> shoeShop =[
   Shoe(name: 'BMW E30', price:'120,000', imagePath: 'lib/images/E30_M3.jpg', description: 'Name Of Perfection'),
    Shoe(name: 'Nissan Gtr R35', price:'120', imagePath: 'lib/images/GTR35.png', description: 'Godzilla'),
    Shoe(name: 'BMW', price:'120', imagePath: 'lib/images/aa.jpg', description: 'Peak JDM Perfection Machine'),
    Shoe(name: 'Nissan S14', price:'20', imagePath: 'lib/images/Initial D.png', description: 'Dragons of the Mount Fuji'),

  ];
  List<Shoe> userCart =[];
  List<Shoe> getShoelist(){
    return shoeShop;
  }
  List<Shoe> getUserCart(){
    return userCart;
  }
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}