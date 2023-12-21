class CartItem {
  int? id;
  final int productVariationId;
  final int quantity;

  CartItem(this.productVariationId,
      this.quantity); //user can add one or multiple items of the same product variation at once
}
