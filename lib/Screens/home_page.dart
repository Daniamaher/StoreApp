
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black), // Changed text color to black
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top:65),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
       builder:(context,snapshot){

        if (snapshot.hasData) {
          List<ProductModel>products  =snapshot.data!;
  return   GridView.builder(
    itemCount: products.length,
    clipBehavior: Clip.none,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
  childAspectRatio: 1.3,
  crossAxisSpacing: 30,
  mainAxisSpacing:30, 
  //
  ), 
  itemBuilder: (context, index) {
    return CustomCard(product: products[index],);
  },);
}
else{
 return Center(child: CircularProgressIndicator());
} 
       







        } ,
                   
        ),
      ),
    
      
    );
  }
}

