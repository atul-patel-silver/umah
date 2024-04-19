import 'package:get/get.dart';
import 'package:umah/model/wishlist.dart';
import 'package:umah/services/wishlist_repo.dart';
import '../helper/model_data/product_data.dart';
import '../model/product.dart';
import 'login_controller.dart';

/*
 *This Controller handle State of Wishlist in this code write crud operation methode
 */

class WishListController extends GetxController {
  //Wishlist observable list
  var wishlists = <WishList>[].obs;

  //product observable list
  var products = <Product>[].obs;

  //Login controller for access Login User Data and perform operation
  final LoginController loginController = Get.put(LoginController());
  var isSaved = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadWishlistByUserId(loginController.loginUser.value?.userId);
    getAllProductInWishList(loginController.loginUser.value!.userId);
    isSaved.value = List<bool>.generate(
      products.length,
      (index) => false,
    );
  }

  /*
   * this methode use add wishlist in hive database
   *
   * parameter :- Wishlist Object
   *
   * return:- void return type
   */
  void addWishList(WishList wishList, index) {
    try {
      WishListRepo().addToWishList(wishList);
      wishlists.add(wishList);
      getAllProductInWishList(wishList.userId);
      isSaved[index] = true;
    } catch (e) {
      print(e);
    }
  }

  /*
   * this methode use Fetch All Wishlist From Hive Database
   *
   * parameter :- No
   *
   * return:- void return type
   */
  loadAllWishList() {
    try {
      wishlists.value = WishListRepo().loadAllWishList();
      print(wishlists.value.length);
    } catch (e) {
      print(e);
    }
  }

  /*
   * this methode use fro fetch wishlist by userid
   *
   * parameter :- userid
   *
   * return:- void return type
   */

  loadWishlistByUserId(userId) {
    try {
      loadAllWishList();
      List<WishList> list =
          wishlists.where((wishList) => wishList.userId == userId).toList();
      wishlists.value = list;
    } catch (e) {
      print(e);
    }
  }

  /*
   * this methode use for get All product from wishlist
   *
   * parameter :- user id
   *
   * return:- void return type
   */
  void getAllProductInWishList(userId) {
    try {
      var productIds = wishlists.map((wishlist) => wishlist.productId).toSet();

      var userProducts = getProductData()
          .where((product) => productIds.contains(product.productId))
          .toList();

      products.value = userProducts;
    } catch (e) {
      print(e);
    }
  }
}
