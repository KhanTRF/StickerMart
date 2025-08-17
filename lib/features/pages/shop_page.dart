// import 'package:flutter/material.dart';
//
// import 'package:untitled1/models/shoe.dart';
//
// import '../components/shoe_tile.dart';
//
// class ShopPage extends StatefulWidget {
//   const ShopPage({super.key});
//
//   @override
//   State<ShopPage> createState() => _ShopPageState();
// }
//
// class _ShopPageState extends State<ShopPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Search Bar
//         Container(
//           padding: const EdgeInsets.all(12),
//           margin: const EdgeInsets.symmetric(horizontal: 25),
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Search', style: TextStyle(color: Colors.grey)),
//               Icon(Icons.search, color: Colors.grey),
//             ],
//           ),
//         ),
//         // Message
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 25),
//           child: Text(
//             'Make Cars Great Again',
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         // Hot Picks
//         const Padding(
//           padding: EdgeInsets.all(12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'HOT Picks',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 'See All',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 10),
//         // Expanded(
//         //   child: ListView.builder(
//         //     itemCount: 4,
//         //     scrollDirection: Axis.horizontal,
//         //     // Fix infinite list
//         //     itemBuilder: (context, index) {
//         //       Shoe shoe = Shoe(
//         //           name: 'BMW E36',
//         //           price: '20',
//         //           description: 'Drift machine',
//         //           imagePath: 'lib/images/bmw.jpg');
//         //       return ShoeTile(shoe: shoe);
//         //     },
//         //   ),
//         // ),
//     SingleChildScrollView(
//     child: Column(
//     children: [
//     // ... [all your current widgets]
//
//     const SizedBox(height: 10),
//     SizedBox(
//     height: 250, // Give height for horizontal ListView
//     child: ListView.builder(
//     itemCount: 4,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//     Shoe shoe = Shoe(
//     name: 'BMW E36',
//     price: '20',
//     description: 'Drift machine',
//     imagePath: 'lib/images/bmw.jpg',
//     );
//     return ShoeTile(shoe: shoe);
//     },
//     ),
//     ),
//     ],
//     ),
//     ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/models/shoe.dart';
import '../components/shoe_tile.dart';
import '/models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
   //Add Shoe to Cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context,listen: false).addItemToCart(shoe);
    //Notify The user that Item is added in cart
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(title: Text('Item Added Successfully'),
              content: Text('Check your Cart'),));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder:(context, value, child)=>Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar
        Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Search', style: TextStyle(color: Colors.grey)),
              Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ),

        // Message
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              'Make Cars Great Again',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        // Hot Picks header
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HOT Picks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Text(
                'See All',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
         SizedBox(height: 40),
        // Horizontal List of Shoes
        SizedBox(
          height: 340, // <-- give this ListView a fixed height
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
                 Shoe shoe = value.getShoelist()[index];
              // final shoe = Shoe(
              //   name: 'BMW E36',
              //   price: '20',
              //   description: 'Drift machine',
              //   imagePath: 'lib/images/bmw.jpg',
              // );
              return ShoeTile(shoe: shoe,
              onTap:() => addShoeToCart(shoe),);

            },
          ),
        ),
    const Padding(
    padding:  EdgeInsets.only(top:25,left: 25,right: 25),
     child: Divider(color: Colors.white,),
    ),
      ],
    ), );
  }
}

