class Activity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int price;
  final double rating;

  const Activity(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.rating});

  static const List<Activity> activities = [
    Activity(
        id: "1",
        title: "ソネヴァ・フシ",
        description: "隠れ家ソネヴァ・フシ(Soneva Fushi)はロマンチックなリゾートホテルとして有名です。",
        imageUrl: "assets/h1.png",
        price: 1200,
        rating: 3),
    Activity(
        id: "2",
        title: "ソネバ・ジャニ",
        description: "Lorem ipsum dolor sit amet, ",
        imageUrl: "assets/h2.png",
        price: 40000,
        rating: 4),
    Activity(
        id: "3",
        title: "フォーシーズンモルティブ",
        description: "Lorem ipsum dolor sit amet, ",
        imageUrl: "assets/h3.png",
        price: 40000,
        rating: 4),
    Activity(
        id: "4",
        title: "アヤダ・モルディブ",
        description: "Lorem ipsum dolor sit amet, ",
        imageUrl: "assets/h4.png",
        price: 40000,
        rating: 4),
    Activity(
        id: "5",
        title: "ヴェラー・プライベート",
        description: "Lorem ipsum dolor sit amet, ",
        imageUrl: "assets/h5.png",
        price: 40000,
        rating: 4),
    Activity(
        id: "6",
        title: "台湾",
        description: "Lorem ipsum dolor sit amet, ",
        imageUrl: "assets/t6.png",
        price: 40000,
        rating: 4),
    Activity(
        id: "7",
        title: "Cruise and Snorkel the Amalfi Coast",
        description: "Lorem ipsum dolor sit amet, ",
        imageUrl: "assets/t7.png",
        price: 40000,
        rating: 4),
    Activity(
        id: "8",
        title: "Cruise and Snorkel the Amalfi Coast",
        description: "Lorem ipsum dolor sit amet, ",
        imageUrl:
            "https://ekulabo.com/wp-content/uploads/2018/07/mathf_round.jpg",
        price: 40000,
        rating: 4),
  ];
}
