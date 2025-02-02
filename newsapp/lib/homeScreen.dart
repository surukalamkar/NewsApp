import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:newsapp/NewsScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomescreenState();
}

List article = [];
bool isloading = true;

class _HomescreenState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getnewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('News Articles')),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: article.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 8.0, top: 5, left: 4),
                                child: article[index]["urlToImage"] != null &&
                                        article[index]["urlToImage"]
                                            .isNotEmpty &&
                                        article[index]["urlToImage"]
                                            .trim()
                                            .isNotEmpty
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          article[index]["urlToImage"],
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Image.network(
                                        "https://imgs.search.brave.com/e-a05P8tLOyJok_4PfRtcVzuogdaC1h8ezGv7dYRaVM/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzAzLzU4Lzc3/LzM2MF9GXzIwMzU4/Nzc3MV9MZXRxbXdQ/ZG5UZVN2WkVnenp5/ZEJiT1cyaGRnOVBp/TC5qcGc",
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  article[index]["source"] != null &&
                                          article[index]["source"]["name"] !=
                                              null
                                      ? article[index]["source"]["name"]
                                      : 'No source available',
                                  style: GoogleFonts.lato(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.redAccent,
                                  ),
                                  maxLines: 3,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Newsscreen(article: article[index]),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Text(
                                    article[index]['description'] != null &&
                                            article[index]['description']
                                                .isNotEmpty
                                        ? article[index]['description']
                                            .replaceAll('\n', '\n')
                                        : 'No description available',
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "read more",
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        article[index]["author"] ??
                                            'No author available',
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueAccent,
                                        ),
                                        maxLines: 3,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  // SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          article[index]["publishedAt"] ??
                                              'No date ', // Handle null gracefully
                                          style: GoogleFonts.lato(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey,
                                          ),
                                          maxLines: 3,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              ));
  }

  void getnewsData() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=");
    http.Response response = await http.get(url);

    var responseData = json.decode(response.body);

    setState(() {
      article = responseData["articles"];

      isLoading = false;
    });
  }
}
