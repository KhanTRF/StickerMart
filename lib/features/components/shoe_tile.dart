// import 'package:flutter/material.dart';
// import 'package:untitled1/models/shoe.dart';
//
// class ShoeTile extends StatelessWidget {
//   Shoe shoe;
//   ShoeTile({super.key, required this.shoe});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 12),
//       width: 280,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           //shoePic
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.asset(shoe.imagePath),
//           ),
//           //Description
//           Text(shoe.description, style: TextStyle(color: Colors.grey[700])),
//           //price+Details
//           Padding(
//             padding: const EdgeInsets.only(left: 25.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(shoe.name, style: const
//                     TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 5,),
//                     Text('\$' + shoe.price, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
//                   ],
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(25),
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(12),
//                       bottomRight: Radius.circular(12),
//                     ),
//                   ),
//
//                   child: Icon(Icons.add, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           //Add to Cart Button
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:untitled1/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12!,
            blurRadius: 12,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // fixed-size image container
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),

            child: SizedBox(

              height: 160,
              width: double.infinity,
              child: Image.asset(
                shoe.imagePath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(

              shoe.description,
              style: TextStyle(color: Colors.grey[700]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          const Spacer(),

          // Name & Price / Add button
          Padding(
            padding: const EdgeInsets.only(left: 25.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // name & price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${shoe.price}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                // add button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

