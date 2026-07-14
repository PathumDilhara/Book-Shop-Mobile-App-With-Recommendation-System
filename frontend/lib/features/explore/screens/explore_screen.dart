import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/models/book_card_model.dart';
import 'package:frontend/core/provider/book_provider.dart';
import 'package:frontend/core/widgets/custom_button.dart';
import 'package:frontend/core/widgets/svg_icon.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final double cardSpace = 30.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 16,
            right: 16.0,
            bottom: 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // leading icon, Searchbar, profile icon
              _buildTopBar(),
              SizedBox(height: cardSpace * 1.5),

              // // TODO : Test
              // customButton(
              //   title: "toprated",
              //   bgColor: Colors.green,
              //   borderColor: Colors.green,
              //   onTap: () async{
              //     print("Fetching...");
              //
              //     final dioClient = DioClient();
              //     await BookAPIService(dio: dioClient.dio).getTopRatedBooks();
              //   },
              // ),

              // Advertisement card
              _buildAdvertisementCard(screenWidth, screenHeight),
              SizedBox(height: cardSpace),

              // Book list by genre horizontal area
              Text("Genres", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 20),
              _buildGenresList(),
              SizedBox(height: cardSpace),

              // Top rated books
              Text(
                "Recommended For You",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              _buildCustomBookList(),
              SizedBox(height: cardSpace),

              // New Arrivals
              Text(
                "Trending Now",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              // _buildCustomBookList(ref),
              SizedBox(height: cardSpace),

              // New Arrivals
              Text(
                "New Arrivals",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              // _buildCustomBookList(ref),
              SizedBox(height: cardSpace),
            ],
          ),
        ),
      ),
    );
  }

  // ========================== Widgets =================================

  // top app bar with > options icon + search icon + user profile icon
  Widget _buildTopBar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Options icon
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
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        width: screenWidth,
        height: screenHeight * 0.23,
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
                  customButton(
                    title: "Buy Now",
                    bgColor: Colors.transparent,
                    borderColor: Colors.white,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            // Col 2 image
            Expanded(flex: 4, child: Image.asset("assets/images/ads.png")),
          ],
        ),
      ),
    );
  }

  // Genres cards list
  Widget _buildGenresList() {
    final genres = ref.watch(genresProvider);
    return SizedBox(
      height: 40,
      child: genres.when(
        data:
            (data) => ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String genre = data[index];
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text(
                      genre,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                );
              },
            ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }

  // Genres horizontal scrollable card list
  Widget _buildCustomBookList() {
    final books = ref.watch(topRatedBooksProvider);
    return SizedBox(
      height: 150,
      child: books.when(
        data:
            (books) => ListView.builder(
              itemCount: books.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                late BookCardModel book;
                if (index < 10) {
                  book = books[index];
                } else {
                  book = books[0];
                }
                return (index < 10)
                    ? Container(
                      margin: EdgeInsets.all(5),
                      width: 80,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              book.coverUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 3),
                          Expanded(
                            child: Text(
                              book.title,
                              softWrap: true,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    )
                    : Center(
                      child: customButton(
                        title: "see more",
                        bgColor: Colors.blue,
                        borderColor: Colors.blueAccent,
                        textColor: Colors.black,
                        icon: Icons.arrow_forward_outlined,
                        bw: 130,
                        bh: 40,
                        onTap: () {},
                      ),
                    );
              },
            ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
