// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:learning/models/shoe.dart';


// class ShowTile extends StatelessWidget {
//   final Shoe shoe;
//   final void Function()? onTap;

//   ShowTile({Key? key, required this.shoe, required this.onTap}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 500,
//       child: Container(
//         margin: EdgeInsets.only(left: 25.0),
//         decoration: BoxDecoration(
//           color: Colors.grey,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   shoe.imagePath,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Text(
//                 shoe.descreption,
//                 // overflow: TextOverflow.values,
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         shoe.name,
//                         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                       ),
//                       const SizedBox(height: 5),
//                       Text('\$ ' + shoe.price),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: onTap,
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
//                       ),
//                       child: Icon(Icons.add, color: Colors.white),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






class ShowTile extends StatelessWidget{
  
  Shoe shoe;
  void Function()? onTap;
  ShowTile({super.key, required this.shoe, required this.onTap});
  
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: 25.0),
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image
          
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(shoe.imagePath,
               fit: BoxFit.fill,
               
              )
            ),
          ),
          
          //description
          Text(shoe.descreption),
          //price +details
          Padding(
            padding: const EdgeInsets.only(left:10.0),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text(shoe.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),), 
                const SizedBox(height: 5,),
                Text('\$ '+ shoe.price), 
               ],
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomRight: Radius.circular(12))
                  ),
                  child: Icon(Icons.add, color: Colors.white,)
                  
                  ),
              )
              ],),
          ),
          
          //button add to cart
        
        ],
      ),
    );
  }
}