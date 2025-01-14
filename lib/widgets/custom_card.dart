
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Screens/update_product_page.dart';
import 'package:store_app/models/product_model.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.product,
    super.key,
  });
 ProductModel product;
  @override
  Widget build(BuildContext context) {
     
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
      
            
            decoration: BoxDecoration(
              boxShadow:[ BoxShadow(
                blurRadius: 40,
                color:Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                offset: Offset(10, 10),
            ),
             ] 
             ),
            child: Card(
              elevation:10 ,
              
          
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:16.0,vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                       product.title.substring(0, 6),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10
                      ),
                    ),
                    SizedBox(height:3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                         Text(
                       r'$' '${product.price.toString()}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Icon(FontAwesomeIcons.solidHeart,color: Colors.red,)
                      ],
                
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(right: 32,top:-60,
            child: Image.network(product.image,height:100,width:100)),
        ],
      ),
    );
  }
}


