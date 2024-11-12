class Product{
   String? id;
   String? name;
   String? price;
   Product({this.id,required this.name,required this.price});

   Product.fromJson(Map<String,dynamic> json){
      id=json["id"];
      name= json["name"];
      price = json["price"].toString();
   }
   Map<String,dynamic> toJson(){
     return {
        "id":id,
        "name":name,
        "price":price
     };
   }
}


