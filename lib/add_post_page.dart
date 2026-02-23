import 'package:flutter/material.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, color: Colors.black)
        ),
        title: const Text(
          'New Post',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Dito ilalagay ang logic para i-save ang post
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Post Shared! 🎉")),
              );
            },
            child: const Text(
              "Share",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Image Preview at Caption Area
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Thumbnail Preview
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage("https://picsum.photos/200"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // Caption Input
                const Expanded(
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Write a caption...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),

          // 2. Menu Options
          _buildMenuOption(Icons.location_on_outlined, "Add Location"),
          const Divider(height: 1),
          _buildMenuOption(Icons.person_outline, "Tag People"),
          const Divider(height: 1),
          _buildMenuOption(Icons.music_note_outlined, "Add Music"),
          const Divider(height: 1),

          const Spacer(),

          // 3. Bottom Gallery Preview (TikTok Style)
          Container(
            height: 200,
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Recent Photos", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Image.network(
                        "https://picsum.photos/id/${index + 50}/150/150",
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}