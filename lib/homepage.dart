

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Database ng posts
  final List<Map<String, String>> posts = const [
    {
      "username": "katarinabluu",
      "profile": "https://pbs.twimg.com/media/FwyPVgFXsAMypfD.jpg",
      "postImage": "https://pbs.twimg.com/media/FwyPVgFXsAMypfD.jpg",
      "caption": "I am a rich man! 🍜😋 #foodie #ramen",
      "likes": "2.5M likes"
    },
    {
      "username": "Clarrisse Pelinta",
      "profile": "https://api.dicebear.com/7.x/avataaars/jpg?seed=Juan",
      "postImage": "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=500",
      "caption": "Coding all night! 💻🔥",
      "likes": "1,240 likes"
    },
    {
      "username": "juan_flutter",
      "profile": "https://api.dicebear.com/7.x/avataaars/jpg?seed=Juan",
      "postImage": "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=500",
      "caption": "Exploring the mountains! ⛰️",
      "likes": "1,240 likes"
    },
    {
      "username": "travel_ph",
      "profile": "https://i.pravatar.cc/150?u=travel",
      "postImage": "https://picsum.photos/id/10/400/400",
      "caption": "Miss ko na ang Boracay! 🌊 #travelph",
      "likes": "3,420 likes"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Jamestagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: -1,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline, color: Colors.black)),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return const StoriesSection();
          return PostWidget(postData: posts[index - 1]);
        },
      ),
    );
  }
}

// --- INAYOS NA SECTION PARA SA STORIES ---
class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  final List<String> storyNames = const [
    "Your Story", "juan_dev", "katarina", "tech_tips", "foodie_ph", "travel_bug", "coder_101", "fitness"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 115,
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: storyNames.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    // Gradient Border Container
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: index == 0
                            ? null
                            : const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Color(0xFF9B2282), Color(0xFFEEA863)],
                        ),
                        color: index == 0 ? Colors.grey[300] : null,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(2.5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[200],
                          backgroundImage: NetworkImage(
                            "https://api.dicebear.com/7.x/avataaars/jpg?seed=${storyNames[index]}",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 70,
                      child: Text(
                        storyNames[index],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}

// --- WIDGET PARA SA POST ---
class PostWidget extends StatelessWidget {
  final Map<String, String> postData;
  const PostWidget({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(postData['profile']!),
          ),
          title: Text(postData['username']!, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_horiz),
        ),

        // POST IMAGE - FitWidth para makita ang buong picture
        Image.network(
          postData['postImage']!,
          width: double.infinity,
          fit: BoxFit.fitWidth,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              height: 300,
              color: Colors.grey[50],
              child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            height: 200,
            color: Colors.grey[200],
            child: const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),

        // Action Buttons
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.chat_bubble_outline)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark_border)),
          ],
        ),

        // Caption at Likes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(postData['likes']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(text: "${postData['username']} ", style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: postData['caption']),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ],
    );
  }
}