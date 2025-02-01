import 'package:flutter/material.dart';
import 'package:practiceapp/pages/NearMeScreen.dart';

void main() {
  runApp(FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Chart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Location",
                                style: TextStyle(color: Colors.white, fontSize: 14),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.red),
                                    SizedBox(width: 5),
                                    Text("Jl. Kampung Melon No. 32"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Hungry? We've Got You Covered!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 46),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "What do you want to eat?",
                            icon: Icon(Icons.search, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CategoryGrid(),
            SizedBox(height: 20),
            CuisineSection(),
          ],
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {"icon": Icons.near_me, "label": "Near Me", "images": "images/near_me.jpeg"},
    {"icon": Icons.local_offer, "label": "Big Promo", "images": "images/promo.jpg"},
    {"icon": Icons.star, "label": "Best Seller", "images": "images/best_seller.png"},
    {"icon": Icons.attach_money, "label": "Budget Meal", "images": "images/budget_meal.jpeg"},
    {"icon": Icons.health_and_safety, "label": "Healthy Food", "images": "images/healthy_food.png"},
    {"icon": Icons.access_time, "label": "Open 24 Hours", "images": "images/open.png"},
    {"icon": Icons.restaurant, "label": "Popular Restaurant", "images": "images/popular.jpg"},
    {"icon": Icons.more_horiz, "label": "More", "images": "images/more.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 0.8,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // onTap: () {
              // if (categories[index]['label'] == "Near Me") {
                // Navigator.push(
                  // context,
                  // MaterialPageRoute(builder: (context) => NearMeScreen()),
                // );
              // }
            // },


            child: Column(

              children: [
                CircleAvatar(
                  backgroundColor: Colors.red.shade100,
                  radius: 30,
                  child: categories[index]['images'] != null
                      ? ClipOval(
                    child: Image.asset(
                      categories[index]['images'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  )
                      : Icon(categories[index]['icon'], color: Colors.red, size: 30),
                ),
                SizedBox(height: 5),
                Text(categories[index]['label'], style: TextStyle(fontSize: 12)),
    if (categories[index]['label'] == "Near Me")
                GestureDetector(
                  onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NearMeScreen()),
                      );

                  },
                  child: Icon(Icons.arrow_forward, color: Colors.red, size: 20),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


class CuisineSection extends StatelessWidget {
  final List<Map<String, String>> cuisines = [
    {"label": "Chicken", "image": "images/chicken.png"},
    {"label": "Burger", "image": "images/burger.png"},
    {"label": "Pizza", "image": "images/pizza.png"},
    {"label": "Bakery", "image": "images/bakery.png"},
    {"label": "Salad", "image": "images/salad.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cuisines", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("View All", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 80, // Ensures a scrollable horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cuisines.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red.shade100,
                        radius: 25,
                        child: ClipOval(
                          child: Image.asset(
                            cuisines[index]['image']!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        cuisines[index]['label']!,
                        style: TextStyle(fontSize: 12),

                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
