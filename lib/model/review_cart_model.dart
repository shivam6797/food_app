class ReviewCartModel {
  String? cartId;
  String? cartImage;
  String? cartName;
  int cartPrice=0;
  int cartQuantity=0;
  var cartUnit;
  ReviewCartModel({
    this.cartId,
    this.cartUnit,
    this.cartImage,
    this.cartName,
    required this.cartPrice,
    required this.cartQuantity,
  });
}