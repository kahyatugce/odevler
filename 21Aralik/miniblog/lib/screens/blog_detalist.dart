import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';
import "package:http/http.dart" as http;

class BlogDetalist extends StatefulWidget {
  const BlogDetalist({super.key, required this.blogId});
  final String blogId;

  @override
  State<BlogDetalist> createState() => _BlogDetalistState();
}

class _BlogDetalistState extends State<BlogDetalist> {
  List<Blog> blogList = [];
  Blog blog = Blog();

  fetchBlogs() async {
    Uri url = Uri.parse(
        "https://tobetoapi.halitkalayci.com/api/Articles/${widget.blogId}");
    final response = await http.get(url);
    final jsonData = json.decode(response.body);

    setState(() {
      blog = Blog.fromJson(jsonData);
    });
  }

  void initState() {
    super.initState();
    fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog.title == null ? "Veriler Bekleniyor" : blog.title!),
      ),
      body: blog.id == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Card(
              color: Colors.pinkAccent.shade100,
              margin: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    blog.title!,
                    style: TextStyleEdit().style.copyWith(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.network(blog.thumbnail!),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      blog.content!,
                      style: TextStyleEdit().style.copyWith(
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Divider(),
                  Text(
                    blog.author!,
                    style: TextStyleEdit().style.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}

class TextStyleEdit extends TextStyle {
  final style = TextStyle(
      backgroundColor: Colors.white30,
      fontStyle: FontStyle.italic,
      fontSize: 20);
}
