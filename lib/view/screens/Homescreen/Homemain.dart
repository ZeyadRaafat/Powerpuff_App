import 'package:Powerpuff/view/screens/Profilemenue/menu.dart';
import 'package:Powerpuff/view/widgets/bottomnavbar.dart';
import 'package:Powerpuff/view/widgets/categorybutton.dart';
import 'package:Powerpuff/view/widgets/coursecard.dart';
import 'package:Powerpuff/view/widgets/headline.dart';
import 'package:Powerpuff/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:Powerpuff/view/widgets/photoslider.dart';
import 'package:get/get.dart';

class Homemain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => Get.to(Profilemenu(),
                            transition: Transition.leftToRight,
                            duration: Duration(milliseconds: 500)),
                      ),
                      Column(
                        children: [
                          Text(
                            "good morning",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                          Text(
                            "Amgooodd",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.bookmark,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldFor(
                  hintText: 'Search for course',
                  prefixIcon: Icons.search,
                ),
              ),
              Container(
                height: 200,
                child: sliderpic(),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headlinee(
                    firtext: 'Categories',
                    sectext: 'view all',
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      CategoryChip(
                        label: 'Java',
                        onPressed: () {},
                      ),
                      CategoryChip(
                        label: 'SQL',
                        onPressed: () {},
                      ),
                      CategoryChip(
                        label: 'amgd',
                        onPressed: () {},
                      ),
                      CategoryChip(
                        label: 'Python',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headlinee(
                    firtext: 'Courses',
                    sectext: 'view all',
                  ),
                ],
              ),
              CourseCard(
                coursename: 'Course name',
                description: 'questions',
                price: 'xxx',
                image: 'assets/images/chemistry.png',
                createdAt: 'xx',
              ),
              CourseCard(
                coursename: 'Course name',
                description: 'questions',
                price: 'xxx',
                image: 'assets/images/chemistry.png',
                createdAt: 'xx',
              ),
              CourseCard(
                coursename: 'Course name',
                description: 'questions',
                price: 'xxx',
                image: 'assets/images/chemistry.png',
                createdAt: 'xx',
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        home: true,
      ),
    );
  }
}
