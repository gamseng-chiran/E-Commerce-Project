class Urls {
  static String _baseUrl = "http://ecom-api.teamrabbil.com/api";

  static String homeSlider = '$_baseUrl/ListProductSlider';
  static String categoryList = "$_baseUrl/CategoryList";
  static String productListByCategory(int categoryID) => "$_baseUrl/ListProductByCategory/$categoryID";
  static String productListByRemark(String remark) => "$_baseUrl/ListProductByRemark/$remark";
  static String productDetails(int productId) => "$_baseUrl/ProductDetailsById/$productId";
}