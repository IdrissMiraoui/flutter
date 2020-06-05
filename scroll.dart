
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xFFEEEEEE),
        child: LazyLoadScrollView(
          isLoading: isLoading,
          onEndOfPage: () => loadData(),
          child: RefreshIndicator(
              child: CustomScrollView(
                slivers: <Widget>[
                  // Add the app bar to the CustomScrollView.
                  SliverAppBar(
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    // Provide a standard title.
                    snap: true,
                    forceElevated: true,
                    title: const Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    floating: true,
                    expandedHeight: 45,
                  ),
                  // Next, create a SliverList
                  getData(yourHeight),
                  getProgressBar(),
                ],
              ),
              onRefresh: () {
                return Future.value(true);
              }),
        ),
      ),
    );
  }

  Widget getData(yourHeight) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (200 / yourHeight),
        ),
        delegate: new SliverChildListDelegate(_getCardList(yourHeight)));
  }

  Widget getProgressBar() {
    if (isLoading) {
      return SliverToBoxAdapter(
          child: new Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.grey,
        )),
      ));
    } else {
      return SliverToBoxAdapter(
        child: Center(),
      );
    }
  }


  List _getCardList(double yourHeight) {
    print("_getCardList");
    List<Widget> listItems = List();
    listItems.addAll(data);
    return listItems;
  }

  Widget card(int pair, double yourHeight, Post post) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          padding: EdgeInsets.only(left: 0, top: 25, right: 0, bottom: 0),
          height: yourHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 35.0,
                        height: 35.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              ''),
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                        height: 15.0,
                        child: Icon(
                          Icons.check_circle,
                          color: Color(0xFFFFB74D),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Color(0xFFF5F5F5)),
                                  ),
                                  //Border.all(color: Color(0xFFF5F5F5)),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Image.asset('assets/images/creative.gif'),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              )),
                          const Divider(
                            color: Colors.black,
                            height: 1,
                            thickness: 1,
                            indent: 1,
                            endIndent: 0,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Color(0xFFF5F5F5)),
                                ),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '',
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Image.asset('assets/images/creative.gif'),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
