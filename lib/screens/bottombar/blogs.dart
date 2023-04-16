import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List blogs = [];

  Future fetchBlogs() async {
    var response =
        await http.get(Uri.https('carbonfootprint.onrender.com', '/blogs'));
    setState(() {
      blogs = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Footprint Blogs'),
      ),
      body: ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              blogs[index]['image'],
              width: 80,
              height: 80,
            ),
            title: Text(
              blogs[index]['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              'By ${blogs[index]['author']}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlogDetail(blog: blogs[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BlogDetail extends StatelessWidget {
  final blog;

  BlogDetail({this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog['title']),
      ),
      body: Column(
        children: [
          Image.network(
            blog['image'],
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              blog['desc'],
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'By ${blog['author']}',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Read More'),
            ),
          ),
        ],
      ),
    );
  }
}
