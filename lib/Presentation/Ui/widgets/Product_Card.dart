import 'package:flutter/material.dart';
import '../../../Model/product.dart';

class ProductCard extends StatelessWidget {
  final Data product;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const ProductCard({super.key, required this.product, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 4),
              height: 140,
              color: Colors.grey,
              child: Image.network(product.img.toString(),fit: BoxFit.cover,),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 5,top: 3,bottom: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.productName.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('Price: ${product.unitPrice} | Qty: ${product.qty}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed: onEdit, child: Text('Edit',style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold),),),
                      IconButton(onPressed: onDelete, icon: Icon(Icons.delete,color: Colors.red,))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}