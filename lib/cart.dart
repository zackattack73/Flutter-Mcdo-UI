class Cart {
  String name; //ID Unique de l'image
  String img;
  double price;
  int qtt;

  getTotalPrice() {
    return price*qtt;
  }

  add() {
    qtt=qtt+1;
  }

  remove() {
    qtt=qtt-1;
  }


  Cart(this.name, this.img, this.price, this.qtt);
}