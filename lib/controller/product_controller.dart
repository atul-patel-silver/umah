import 'package:get/get.dart';
import 'package:umah/helper/model_data/product_data.dart';
import 'package:umah/model/product.dart';
import 'package:umah/services/product_repo.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadProduct();
  }

  void loadProduct() {
    try {
      List<Product> lists = getProductData();
      products.value = lists;
    } catch (e) {
      printInfo(info: e.toString());
    }
  }


  /*
   * get Products By Category Id
   *
   * Param:- Category Id
   *
   * Return:-void
   */
  void getProductByCategoryId(categoryId) {
    try {
      List<Product> lists= ProductRepo().getByCategoryId(categoryId);
      products.value = lists;
    } catch (e) {
      print(e);
    }
  }

  
}