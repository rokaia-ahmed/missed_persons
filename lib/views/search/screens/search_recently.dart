import 'package:flutter/material.dart';
import 'package:missed_people/views/search/screens/search_screen.dart';

class Search_recently extends StatelessWidget {
  static String routeName = 'SearchRecntly';
  List<String> searchs = [
    'Karla Noah',
    'Nina Chris',
    'Atef Sayed',
    'Nael Wael'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color(0xFF092E5C),
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(Icons.arrow_back),
          ),
          title: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 245, 245, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const TextField(
              // controller: _textEditingController,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                hintText: "Search",
                prefixIcon: ImageIcon(AssetImage('assets/images/search.png')),
              ),
            ),
          )),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(searchs[0], style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    const Icon(
                      Icons.close,
                      color: Colors.grey,
                    )
                  ],
                ),
                const Divider(color: Colors.black, indent: 10, endIndent: 10),
                Row(
                  children: [
                    Text(searchs[1], style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    const Icon(
                      Icons.close,
                      color: Colors.grey,
                    )
                  ],
                ),
                const Divider(color: Colors.black, indent: 10, endIndent: 10),
                Row(
                  children: [
                    Text(searchs[2], style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    const Icon(
                      Icons.close,
                      color: Colors.grey,
                    )
                  ],
                ),
                const Divider(color: Colors.black, indent: 10, endIndent: 10),
                Row(
                  children: [
                    Text(searchs[3], style: const TextStyle(color: Colors.grey)),
                    const Spacer(),
                    const Icon(
                      Icons.close,
                      color: Colors.grey,
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 90,right: 90,top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: const Color(0xFF092E5C)),
              child: Row(
                children: const [
                  ImageIcon(AssetImage('assets/images/search_icon.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Seach by photo',style: TextStyle(
                    fontSize: 16
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
