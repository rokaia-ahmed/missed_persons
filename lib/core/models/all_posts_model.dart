class AllPostsModel {
   int? idPost;
   String? nameChild;
   String? location;
   String? phone;
   String? details;
   String? clothesColor;
   String? picture;
   int? age;
   int? likes;
   bool? finder;
   String? date;
   Poster? poster;

  AllPostsModel.fromJson(Map<String,dynamic>json){
       idPost= json['id'];
       nameChild= json['name'];
       location= json['location'];
       phone= json['phone'];
       details= json['details'];
       clothesColor= json['clothesColor'];
       picture= json['picture'];
       age= json['age'];
       likes= json['likes'];
       finder= json['finder'];
       date= json['date'];
       poster= Poster.fromJson(json['poster']);
  }
}

class Poster {
   int? idPoster;
   String? name;
   String? phone;
   String? email;
   String? picture;
  Poster.fromJson(Map<String,dynamic> json){
       idPoster = json['id'];
       name = json['name'] ??"";
       phone = json['phone'];
       email = json['email'];
       picture = json['picture'];
  }
}
