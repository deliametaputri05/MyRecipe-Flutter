class Recipe {
  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;
  String alat;
  String bahan;
  String prosedur1;
  String prosedur2;
  String prosedur3;

  Recipe(
      this.title,
      this.description,
      this.image,
      this.calories,
      this.carbo,
      this.protein,
      this.alat,
      this.bahan,
      this.prosedur1,
      this.prosedur2,
      this.prosedur3);
}

List<Recipe> getRecipes() {
  return <Recipe>[
    Recipe(
        "Chiken Salad",
        "Kolaraborasi Chiken dengan Salad yang berprotein",
        "assets/images/chicken_fried_rice.png",
        120,
        80,
        60,
        "Teflon, Spatula, Piring, Sendok, Pisau, Telenan, Mangkok",
        "Dada Ayam, Bawang Putih, Kecap Asin, Saus Tiram, Lada Hitam, Olive Oil, Selada, Kubis, Wortel, Tomat ",
        "1. Lumuri ayam dengan bawang putih, kecap asin, saus tiram, dan lada hitam, aduk sampai rata, diamkan 15 menit di kulkas",
        "2. Setelah 15 menit, siapkan ayam, panaskan teflon, beri olive oil, panggang ayam Sambil dibolak-balik sampai matang",
        "3. Tata sayuran dan ayam di piring, beri dressing secukupnya. Selamat Mencoba!!!"),
    Recipe(
        "Pasta Bolognese",
        "Lezat dan Bernutrisi",
        "assets/images/pasta_bolognese.png",
        180,
        115,
        80,
        "Wajan, Spatula, Sendok, Piring, Pisau, Panci",
        "Makaroni, tomat merah, daging cincang, bawang bombay kecil (potong kotak kecil), bawang putih (cincang halus), oregano bubuk, bay leaves yg dikeringkan, saus tomat Del Monte, parsley flakes, italian herbs, olive oil, Merica, Gula, Garam",
        "1. Rebus tomat hingga kulitnya mengelupas. Tunggu dingin kemudian lepaskan kulitnya. Blender halus tomat yang sudah dikuliti. Tumis bawang bombay menggunakan olive oil hingga harum, masukkan bawang putih cincang tumis lagi sebentar. Masukkan daging cincang, tumis hingga daging matang berwarna coklat. Boleh kasih air dikit aja biar tidak gosong.",
        "2. Masukkan jus tomat, saus tomat, bay leaves, oregano, parsley flakes, dan italian herbs. Masak dengan api kecil hingga airnya berkurang banyak dan saus mengental, sampai warnanya merah tua.",
        "3. Tambahkan gula, garam, merica. Rebus & Masak Macaroni sesuai petunjuk, sisihkan dan beri minyak supaya tidak lengket. Sajikan makaroni bersama saus. Beri taburan keju. Kejunya boleh apa aja..cheddar, parmesan, mozarella. Tabur lg sama parsley flakes kalau ada. Siap untuk disajikan."),
    Recipe(
        "Steak Daging Sapi",
        "Lezat dan Bernutrisi",
        "assets/images/filete_con_papas_cambray.png",
        250,
        90,
        100,
        "Wajan, Spatula, Sendok, Piring, Pemanggang, Pisau Daging, Telenan",
        "Daging Sapi, Wortel, Jagung, Buncis, Kentang, Kecap Asin, Kecap Inggris, Minyak Goreng, Saus Tiram, Saus Tomat, Garam, Lada Bubuk, Bawang Bombay, Bawang Putih, Air, Maizena, Margarin",
        "1. Iris daging melebar tapi jangan terlalu tipis. Campur semua bumbu peredam dan masukan daging. Diamkan selama 1 jam.",
        "2. Siapkan semua bahan pelengkap, rebus wortel, buncis, dan jagung. Dan Untuk Kentang harus digoreng. Membuat Saus : tumis bawang putih dan bawang bombay dengan margarin. Masukan semua bumbu, dan terakhir masukan air dan larutan maizena.",
        "3. Panggang daging dengan margarin sampai matang.Steak daging sapi siap dinikmati selagi hangat. Lebih enak lagi kalau penyajiannya menggunakan hot plate."),
    Recipe(
        "Asparagus Steak Daging",
        "Asparagus Bernutrisi",
        "assets/images/asparagus.png",
        170,
        100,
        50,
        "Piring , Sendok, Wajan, Spatula",
        "Asparagus, Daging Sapi, Garam, Minyak wijen, Gula Pasir, Bawang Bombai",
        "1. Panaskan minyak di atas api sedang. Lalu tumis bawang putih dan bawang bombai hingga harum dan layu.",
        "2. Masukkan Daging Sapi, aduk terus hingga berubah warna.",
        "3. Tambahkan potongan asparagus, jamur, dan paprika. Aduk hingga semua bahan tercampur rata dan setengah layu."),
    Recipe(
        "Steak Bacon",
        "Lezat, berprotein dan sehat",
        "assets/images/steak_bacon.png",
        200,
        120,
        130,
        "Teflon, Spatula, Sendok, Piring, Pisau Daging, Telenan",
        "bacon sapi, potong besar-besar. Minyak olive atau minyak goreng. Jamur kancing, bagi jadi 4 bagian. 1 buah tomat, buang isinya dan potong kotak-kotak. 1 sdm saus Worcestershire atau saus Inggris. Daun seledri secukupnya. Merica hitam secukupnya",
        "1. Panaskan teflon dengan minyak. Goreng bacon sapi hingga crispy dan sisihkan. ",
        "2. Di dalam panci yang sama, tambahkan jamur dan tomato. Aduk sebentar dan tambahkan saus Inggris. Masukkan bacon kembali dan aduk.",
        "3. Taburi dengan daun seledri dan bubuhi merica hitam secukupnya. Sajikan bersama telur dan roti panggang (toasted bread). Sajikan untuk 1 porsi."),
    Recipe("Spagheti Seafood", "Lezat dan Bernutrisi",
        "assets/images/food1.png", 150, 140, 190, "", "", "", "", ""),
    Recipe("Chicken Steak", "Lezat dan Bernutrisi", "assets/images/food2.png",
        130, 95, 165, "", "", "", "", ""),
    Recipe("Ikan Nila Goreng", "Lezat dan Bernutrisi",
        "assets/images/food3.png", 180, 70, 250, "", "", "", "", ""),
    Recipe("Chicken Steak Lemon", "Lezat dan Bernutrisi",
        "assets/images/food4.png", 185, 70, 130, "", "", "", "", ""),
    Recipe("Udang Cah Brokoli", "Lezat dan Bernutrisi",
        "assets/images/food5.png", 180, 80, 225, "", "", "", "", ""),
    Recipe("Nasi Telor Cincang Sapi", "Lezat dan Bernutrisi",
        "assets/images/food6.png", 210, 100, 150, "", "", "", "", ""),
    Recipe("Nasi Goreng Sayur", "Lezat dan Bernutrisi",
        "assets/images/food7.png", 120, 220, 90, "", "", "", "", ""),
    Recipe("Udang Saus Tiram", "Lezat dan Bernutrisi",
        "assets/images/food8.png", 160, 75, 110, "", "", "", "", ""),
    Recipe("Sup Daging Sapi", "Lezat dan Bernutrisi",
        "assets/images/food10.png", 250, 100, 120, "", "", "", "", ""),
    Recipe("Papaya Salad", "Lezat dan Bernutrisi", "assets/images/food9.png",
        100, 150, 200, "", "", "", "", ""),
  ];
}
