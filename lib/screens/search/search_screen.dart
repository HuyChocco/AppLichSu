import 'package:flutter/material.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:tiengviet/tiengviet.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  List<Content> _list;
  bool _isSearching;
  //String _searchText = "";
  List searchresult = [];
  final _searchFocusNode = FocusNode();
  bool _isInit = false;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    _isSearching = false;
    values();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
      _isInit = true;
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void values() async {
    _list = [];
    _list = await ContentProvider().loadAllContentForSearching();
  }

  void searchOperation(String searchText) {
    String _searchText = TiengViet.parse(searchText);
    //print(searchText);
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        Content data = _list[i];
        if (TiengViet.parse(_list[i].keyWord)
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5F7),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: _controller,
          focusNode: _searchFocusNode,
          style: TextStyle(color: Color(0xFFA0A5BD)),
          decoration: InputDecoration(
            hintText: "Nhập từ khóa ...",
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFFA0A5BD),
            ),
            hintStyle: TextStyle(color: Color(0xFFA0A5BD)),
          ),
          onChanged: searchOperation,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: searchresult.length != 0 || _controller.text.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (ctx, index) {
                          Content listData = searchresult[index];
                          return ListTile(
                            title: Text(
                              listData.keyWord,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  '/main-content-screen',
                                  arguments: {
                                    'id': listData.id,
                                    'imagePath': listData.imagePath,
                                    'videoPath': listData.videoPath,
                                    'filePath': listData.filePath,
                                    'idCate': listData.idCate,
                                    'title': listData.title,
                                  }).then((value) {
                                // updateStateReading();
                              });
                            },
                          );
                        },
                        itemCount: searchresult.length,
                      )
                    : ListView.builder(
                        itemBuilder: (ctx, index) {
                          Content listData = _list[index];
                          return ListTile(
                            title: Text(
                              listData.keyWord,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  '/main-content-screen',
                                  arguments: {
                                    'id': listData.id,
                                    'imagePath': listData.imagePath,
                                    'videoPath': listData.videoPath,
                                    'filePath': listData.filePath,
                                    'idCate': listData.idCate,
                                    'title': listData.title,
                                  }).then((value) {
                                // updateStateReading();
                              });
                            },
                          );
                        },
                        itemCount: _list.length,
                      )),
          ],
        ),
      ),
    );
  }
}
