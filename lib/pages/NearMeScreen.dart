import 'package:flutter/material.dart';

class NearMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
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
                      SizedBox(height: 20),
                      Text(
                        "Near Me",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Choose From Nearby Restaurants\nWith Deliciousness Awaiting",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 20),
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
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterChipWidget(label: "Cuisines"),
                  FilterChipWidget(label: "Rated 4.5+"),
                  FilterChipWidget(label: "Promo"),
                ],
              ),
            ),
            SizedBox(height: 20),
            RestaurantList(),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  FilterChipWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      label: Text(label),
      avatar: Icon(Icons.filter_list, size: 16, color: Colors.black54),
    );
  }
}

class RestaurantList extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      "image": "images/rice_chicken.jpg",
      "name": "Bubur Ayam Pak Yono",
      "details": "Porridge, Rice, Chicken",
      "price": "Rp 10.000",
      "time": "12 min",
      "distance": "1 km",
      "rating": "4.9",
      "reviews": "400+ ratings",
      "tag": "Best Seller",
    },
    {
      "image": "images/meat.jpg",
      "name": "Sate Kambing Pak Slamet",
      "details": "Satay, Chicken, Meat",
      "price": "Rp 10.000",
      "time": "20 min",
      "distance": "1.2 km",
      "rating": "4.7",
      "reviews": "200+ ratings",
      "tag": "Promo",
    },
    {
      "image": "images/noodles.jpg",
      "name": "Bakmi Ayam Bangka 78",
      "details": "Noodle, Chicken",
      "price": "Rp 12.000",
      "time": "25 min",
      "distance": "2 km",
      "rating": "4.8",
      "reviews": "300+ ratings",
      "tag": "Budget Meal",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: restaurants.map((restaurant) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    restaurant["image"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              restaurant["name"],
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          if (restaurant["tag"] != "")
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                restaurant["tag"],
                                style: TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                        ],
                      ),
                      Text(restaurant["details"], style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.directions_bike, size: 14, color: Colors.green),
                          SizedBox(width: 4),
                          Text(restaurant["price"], style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 10),
                          Icon(Icons.access_time, size: 14, color: Colors.red),
                          SizedBox(width: 4),
                          Text("${restaurant['time']} • ${restaurant['distance']}"),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.orange),
                          SizedBox(width: 4),
                          Text(restaurant["rating"], style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 5),
                          Text(restaurant["reviews"], style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
