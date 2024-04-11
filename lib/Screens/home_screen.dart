import 'dart:convert';
import 'package:api_user_data/Screens/user_screen.dart';
import 'package:api_user_data/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

import '../Models/product_model.dart';
import '../Models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UserModel> futureUserData;
  late Future<ProductModel> futureProductData;

  Future<UserModel> fetchUserData() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<ProductModel> fetchProdData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load product data");
    }
  }

  @override
  void initState() {
    futureUserData = fetchUserData();
    futureProductData = fetchProdData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen()));
            },
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.white70,
            ),
          ),
        ],
        title: const Text(
          "Dummy API",
          style: TextStyle(
            color: Color(0xffFFFFFF),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
        future: Future.wait([futureUserData, futureProductData]),
        // future: futureUserData,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          snapshot.data?[0];
          snapshot.data?[1];
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Users>? users = snapshot.data?[0]!.users;
            List<Products>? products = snapshot.data?[1]!.products;

            if (users != null && users.isNotEmpty) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  Users user = users[index];
                  Products product = products![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              curve: Curves.easeInCirc,
                              duration: const Duration(milliseconds: 500),
                              reverseDuration:
                                  const Duration(milliseconds: 500),
                              child: UserScreen(
                                id: user.id,
                                firstname: user.firstName,
                                lastname: user.lastName,
                                middlename: user.maidenName,
                                gender: user.gender,
                                email: user.email,
                                username: user.username,
                                password: user.password,
                                birthdate: user.birthDate,
                                image: user.image,
                                bloodGroup: user.bloodGroup,
                                age: user.age,
                                phone: user.phone,
                                ssn: user.ssn,
                                height: user.height,
                                university: user.university,
                                address: user.address,
                                bank: user.bank,
                                company: user.company,
                                title: product.title,
                                thumbnail: product.thumbnail,
                                price: product.price,
                                brand: product.brand,
                                category: product.category,
                                description: product.description,
                              ),
                              type: PageTransitionType.fade));
                    },
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            '${user.firstName} ${user.lastName}',
                            style: const TextStyle(
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          subtitle: Text(
                            'Email: ${user.email}',
                            style: const TextStyle(
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          leading: Hero(
                            tag: "${user.id}",
                            child: Image.network("${user.image}"),
                          ),
                        ),
                        // Divider(
                        //   indent: 30,
                        //   endIndent: 30,
                        //   thickness: 0.3,
                        //   color: Colors.white70,
                        // ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No users found.'));
            }
          }
        },
      ),
    );
  }
}


// body: Column(
// children: [
// Expanded(
// child: FutureBuilder(
// future: fetchUsersFromApi(),
// builder: (context, snapshot) {
// if (!snapshot.hasData) {
// return Center(
// child: CircularProgressIndicator(color: Colors.blue),
// );
// } else {
// // return CircularProgressIndicator(
// //   color: Colors.black,
// // );
// return ListView.builder(
// itemCount: usersList.length,
// itemBuilder: (context, index) {
// return ListTile(
// title: Text(usersList[index].firstName ?? "empty string"),
// );
// },
// );
// }
// },
// ),
// ),
// ],
// ),
