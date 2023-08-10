import 'package:api/Helper.dart';
import 'package:api/HomeModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/show',
          page: () => ShowScreen(),
        ),
      ],
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiHelper apiHelper = ApiHelper();

  @override
  void initState() {
    super.initState();

    // apiHelper.apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: apiHelper.apiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<dynamic>? l1 = snapshot.data;
              return ListView.builder(
                  itemCount: l1!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          '/show',
                          arguments: index + 1,
                        );
                      },
                      child: ListTile(
                        title: Text("${l1[index].nameTranslated}"),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class ShowScreen extends StatefulWidget {
  const ShowScreen({Key? key}) : super(key: key);

  @override
  State<ShowScreen> createState() => _ShowScreenState();
}

class _ShowScreenState extends State<ShowScreen> {

  ApiHelper apiHelper = ApiHelper();
  @override
  void initState() {
    super.initState();

  }

  int index = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: apiHelper.api1Call(index: index),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<dynamic>? l1 = snapshot.data;
              return ListView.builder(
                  itemCount: l1!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          '/show',
                          arguments: index + 1,
                        );
                      },
                      child: ListTile(
                        title: Text("${l1[index].id}"),
                      ),
                    );
                  });
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
