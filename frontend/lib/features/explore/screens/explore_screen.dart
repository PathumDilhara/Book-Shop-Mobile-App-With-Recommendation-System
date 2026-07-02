import 'package:flutter/material.dart';
import 'package:frontend/core/widgets/svg_icon.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // leading icon, Searchbar, profile icon
              _buildTopBar(),
              SizedBox(height: 50),

              // Advertisement card
              _buildAdvertisementCard(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgIcon(
              icon: "assets/icons/widgets.svg",
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),

          // Searchbar
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search your item...",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              maxLines: 1,
            ),
          ),
          SizedBox(width: 10),

          // User profile icon
          SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset("assets/images/person.jpg", fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  // advertisement card
  Widget _buildAdvertisementCard(double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(20),
      width: screenWidth,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Col 1
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description
                Text(
                  "Find the best book",
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Button
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Col 2 image
          Expanded(flex: 4, child: Image.asset("assets/images/ads.png")),
        ],
      ),
    );
  }
}
