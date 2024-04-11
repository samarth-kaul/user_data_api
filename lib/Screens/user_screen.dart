import 'package:flutter/material.dart';

import '../Models/user_model.dart';

class UserScreen extends StatefulWidget {
  // user details
  int? id;
  String? firstname;
  String? lastname;
  String? middlename;
  String? gender;
  String? email;
  String? username;
  String? password;
  String? birthdate;
  String? image;
  String? bloodGroup;
  String? ssn;
  int? height;
  int? age;
  String? phone;
  String? university;
  Address? address;
  Bank? bank;
  Company? company;

  // product details
  String? title;
  String? description;
  String? brand;
  String? category;
  String? thumbnail;
  int? price;

  UserScreen({
    required this.id,
    required this.bank,
    required this.address,
    required this.company,
    required this.phone,
    required this.university,
    required this.firstname,
    required this.lastname,
    required this.middlename,
    required this.gender,
    required this.email,
    required this.username,
    required this.password,
    required this.birthdate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.age,
    required this.ssn,
    required this.price,
    required this.title,
    required this.brand,
    required this.category,
    required this.description,
    required this.thumbnail,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isZoomed = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff252525),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
          ),
          title: Text(
            "PROFILE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       isZoomed = !isZoomed;
                //     });
                //   },
                //   child: isZoomed
                //       ? Container(
                //           color: Colors.black,
                //           child: PhotoView(
                //             imageProvider: NetworkImage("${widget.image}"),
                //           ),
                //         )
                //       : CircleAvatar(
                //           radius: 60,
                //           backgroundColor: Color(0xffFF624C),
                //           child: CircleAvatar(
                //             radius: 57,
                //             backgroundImage: NetworkImage("${widget.image}"),
                //           ),
                //         ),
                // ),

                CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xffFF624C),
                  child: Hero(
                    tag: "${widget.id}",
                    child: CircleAvatar(
                      radius: 57,
                      backgroundImage: NetworkImage("${widget.image}"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "${widget.firstname} ${widget.lastname}",
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      // color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  "@${widget.firstname}${widget.lastname}",
                  style: TextStyle(
                      // color: Color(0xff4D4D4D),
                      color: Colors.white70),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("${widget.gender}",
                              style: TextStyle(color: Color(0xffFFFFFF))),
                          Text("Gender",
                              style: TextStyle(color: Color(0xffFFFFFF))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: Color(0xff696969),
                        thickness: 2,
                        // indent: 600,
                        // endIndent: 600,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${widget.height} ",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ],
                          ),
                          Text("Height",
                              style: TextStyle(color: Color(0xffFFFFFF))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: Color(0xff696969),
                        thickness: 2,
                        // indent: 600,
                        // endIndent: 600,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "${widget.age}",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Age",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 65,
                        width: 190,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color(0xff383838),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Text(
                                //   "Blood Group    ",
                                //   style: TextStyle(color: Colors.white),
                                // ),
                                Icon(Icons.bloodtype_rounded),
                                Text(
                                  "${widget.bloodGroup}",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF), fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 65,
                        width: 190,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color(0xff383838),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Text(
                                //   "Birth Date    ",
                                //   style: TextStyle(color: Colors.white),
                                // ),
                                Icon(Icons.date_range_rounded),
                                Text(
                                  "${widget.birthdate}",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF), fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    childrenPadding: EdgeInsets.only(left: 20),
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    collapsedBackgroundColor: Color(0xff383838),
                    collapsedTextColor: Colors.blue,
                    textColor: Colors.green,
                    backgroundColor: Color(0xff383838),
                    title: Text(
                      "Residental Address",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    children: [
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Text(
                            "Street: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.address!.address}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "City: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.address!.city}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "State: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.address!.state}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    collapsedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    childrenPadding: EdgeInsets.only(left: 20),
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    collapsedBackgroundColor: Color(0xff383838),
                    collapsedTextColor: Colors.blue,
                    textColor: Colors.green,
                    backgroundColor: Color(0xff383838),
                    title: Text(
                      "Personal Info",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    children: [
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Text(
                            "Email: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.email}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Contact: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.phone}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Username: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.username}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Password: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.password}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    collapsedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    childrenPadding: EdgeInsets.only(left: 20),
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    collapsedBackgroundColor: Color(0xff383838),
                    collapsedTextColor: Colors.blue,
                    textColor: Colors.green,
                    backgroundColor: Color(0xff383838),
                    title: Text(
                      "Company Details",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    children: [
                      const SizedBox(height: 7),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            "Company Name: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.company!.name}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Address: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.company!.address!.city}, ${widget.company!.address!.state}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Department: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.company!.department}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Title: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.company!.title}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    collapsedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    childrenPadding: EdgeInsets.only(left: 20),
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    collapsedBackgroundColor: Color(0xff383838),
                    backgroundColor: Color(0xff383838),
                    title: Text(
                      "Bank Details",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    children: [
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Text(
                            "Currency: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.bank!.currency}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Card Type: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.bank!.cardType}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Card Number: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.bank!.cardNumber}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Card Expiry Date: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.bank!.cardExpire}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    collapsedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    childrenPadding: EdgeInsets.only(left: 20),
                    expandedAlignment: Alignment.topLeft,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    collapsedBackgroundColor: Color(0xff383838),
                    backgroundColor: Color(0xff383838),
                    title: Text(
                      "Product Details",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    children: [
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Text(
                            "Product Title: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.title}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            "Description: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.description}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Price: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.price}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Category: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.category}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Brand: ",
                            style: TextStyle(
                                color: Color(0XFF686868),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "${widget.brand}",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Version 4.0.8",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
