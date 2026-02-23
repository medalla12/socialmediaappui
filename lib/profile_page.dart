import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'James_Dev', // Yung username mo
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          // 1. Profile Header (TikTok Style)
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://api.dicebear.com/7.x/avataaars/jpg?seed=James"),
          ),
          const SizedBox(height: 15),
          const Text(
            '@jamestagram_official',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),

          // 2. Stats Section (Following, Followers, Likes)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatItem("120", "Following"),
              _buildDivider(),
              _buildStatItem("45M", "Followers"),
              _buildDivider(),
              _buildStatItem("900M", "Likes"),
            ],
          ),
          const SizedBox(height: 20),

          // 3. Edit Profile Button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text(
                  "Edit profile",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(Icons.bookmark_border),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // 4. Bio Section
          const Text(
            "Flutter Developer | Coffee Lover ☕\nBuilding Jamestagram 🚀",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // 5. Tabs (Grid, Likes, Private)
          const Divider(height: 1),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.grid_on), // Posts Grid
              ),
              Icon(Icons.favorite_border, color: Colors.grey), // Liked Videos
              Icon(Icons.lock_outline, color: Colors.grey), // Private
            ],
          ),

          // 6. Post Grid
          Expanded(
            child: GridView.builder(
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 3/4, // Vertical style gaya ng TikTok
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  "https://picsum.photos/id/${index + 20}/200/300",
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper para sa stats
  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }

  // Helper para sa maliit na vertical line
  Widget _buildDivider() {
    return Container(
      height: 15,
      width: 1,
      color: Colors.grey[300],
      margin: const EdgeInsets.symmetric(horizontal: 20),
    );
  }
}