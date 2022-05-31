import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miarma_network/models/user_me.dart';
import 'package:miarma_network/models/user_media_displayed.dart';
import 'package:miarma_network/utils/text_utils.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  final TextUtils _textUtils = TextUtils();

  late TabController tabController;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  late Future<String> items = fetchMediaDisplayedUrl();
  late Future<String> items2 = fetchMediaDisplayedUsername();
  late Future<String> items3 = getUserMe();
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: scrollController,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1564564295391-7f24f26f568b")),
                          const SizedBox(height: 10),
                          _textUtils.normal16(getUserMe().toString(), Colors.white)
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              _textUtils.bold20("16", Colors.white),
                              const SizedBox(height: 5),
                              _textUtils.normal14("Posts", Colors.white),
                            ],
                          ),
                          Column(
                            children: [
                              _textUtils.bold20("158", Colors.white),
                              const SizedBox(height: 5),
                              _textUtils.normal14("Followers", Colors.white)
                            ],
                          ),
                          Column(
                            children: [
                              _textUtils.bold20("1,425", Colors.white),
                              const SizedBox(height: 5),
                              _textUtils.normal14("Following", Colors.white)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child:
                              _textUtils.normal16("Edit Profile", Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5)),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _textUtils.bold14("Story Highlights", Colors.white),
                            const SizedBox(
                              height: 5,
                            ),
                            _textUtils.normal14(
                                "Keep your favourite stories on your profile",
                                Colors.white)
                          ],
                        ),
                        flex: 9,
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 18,
                        ),
                        flex: 1,
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.add, size: 35),
                                  style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(
                                          side:
                                              BorderSide(color: Colors.white)),
                                      padding: const EdgeInsets.all(15),
                                      primary: Colors.transparent)),
                              const SizedBox(
                                height: 10,
                              ),
                              _textUtils.normal12("New", Colors.white)
                            ],
                          )),
                      for (int i = 0; i < 10; i++) favouriteStoriesWidget(),
                    ],
                  ),
                ),
              ),
              TabBar(
                indicatorColor: Colors.white,
                indicatorWeight: 0.8,
                indicatorPadding: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                controller: tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.grid_on_rounded)),
                  Tab(icon: Icon(Icons.person_pin_outlined)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    GridView.count(
                      controller: scrollController,
                      crossAxisCount: 3,
                      children: [],
                    ),
                    GridView.count(
                      controller: scrollController,
                      crossAxisCount: 3,
                      children: [
                        for (int i = 0; i < 7; i++)
                          Container(
                              margin: const EdgeInsets.only(right: 3, top: 3),
                              child: SizedBox(
                                child: Image.network(
                                    fetchMediaDisplayedUrl().toString(),
                              ))
                          )],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget favouriteStoriesWidget() {
    return const Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: CircleAvatar(
        radius: 33,
        backgroundColor: Color(0xFF3E3E3E),
      ),
    );
  }

  Future<String> fetchMediaDisplayedUrl() async {
    final response = await http.get(Uri.parse(
        'https://graph.instagram.com/18059112139273906?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJYemJ1YmxjTkwyd09MTnU1RWU0U0dtS1pjYS1lOVhJU3ZAmLVpTcjc1M3BCLVVaT2pNaVR6WW54VkR1Q050bjBwM0hPZA2lIUVJOeHVHTFNPZAV9SVXhmd3JmRTRIZAUg1TzU1NXU0VzVvcnF1d21CXwZDZD'));
    if (response.statusCode == 200) {
      return MediaDisplayedRespose.fromJson(jsonDecode(response.body)).mediaUrl;
    } else {
      throw Exception('Failed to load planets');
    }
  }

  Future<String> fetchMediaDisplayedUsername() async {
    final response = await http.get(Uri.parse(
        'https://graph.instagram.com/18059112139273906?fields=id,media_type,media_url,username,timestamp&access_token=IGQVJYemJ1YmxjTkwyd09MTnU1RWU0U0dtS1pjYS1lOVhJU3ZAmLVpTcjc1M3BCLVVaT2pNaVR6WW54VkR1Q050bjBwM0hPZA2lIUVJOeHVHTFNPZAV9SVXhmd3JmRTRIZAUg1TzU1NXU0VzVvcnF1d21CXwZDZD'));
    if (response.statusCode == 200) {
      return MediaDisplayedRespose.fromJson(jsonDecode(response.body)).username;
    } else {
      throw Exception('Failed to load planets');
    }
  }

  Future<String> getUserMe() async {
    

    var url = "https://graph.instagram.com/v13.0/me?fields=media_count,account_type,username&access_token=IGQVJWMmpYdkx4akszNHBLcTNyRmM3bm5HeUZAFckxiS0NCTjg2X09EdFFVNGd5MGcwSlk0RHBKZAFRpTzd2ZAEJZAaFVFbURGbmRlNi1xby1JNFFHNU1DcmI1cVA5OVpSaS00RkxNdDVuOW1NWHZAJSzdyZAwZDZD";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return UserMeResponse.fromJson(jsonDecode(response.body)).username;
  } else {
    throw Exception('Failed to load hourly weather');
  }
  }
}
