import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: 30, // Dami ng pictures sa grid
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 pictures per row
          crossAxisSpacing: 2, // Space sa gilid
          mainAxisSpacing: 2,  // Space sa baba
        ),
        itemBuilder: (context, index) {
          return Image.network(
            'https://picsum.photos/id/${index + 20}/300/300', // Random photos
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}