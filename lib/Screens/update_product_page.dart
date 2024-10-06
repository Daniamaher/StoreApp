import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({
    super.key,
  });
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100),
              CustomTextField(
                hintText: 'Product Name',
                onChanged: (data) {
                  productName = data;
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'description',
                onChanged: (data1) {
                  description = data1;
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'price',
                onChanged: (data2) {
                   price=data2;
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                hintText: 'image',
                onChanged: (data) {
                  description = data;
                },
              ),
              SizedBox(height: 50),
              CustomButon(
                text: ('Update'),
                onTap: () async  {
                  /*
                  isLoading = true;
                  setState(() {});
                  updateMethod(product);
                  isLoading = false;
                  setState(() {});*/
                   
                     
                   isLoading = true;
                    setState(() {});
                    try {
                       await updateMethod(product);

                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateMethod(ProductModel product) async{
    await    UpdateProductService().updateProduct(
         id:product.id,
        title: productName==null ?product.title:productName!,
        price: price == null ? product.price.toString() : price!,
        desc: description == null ? product.description : description!,
        image: image == null ? product.image : image!,
        category: product.category
        
        
        
        );
  }
}
