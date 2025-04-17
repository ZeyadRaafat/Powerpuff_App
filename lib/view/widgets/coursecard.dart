import 'package:flutter/material.dart';
import 'package:Powerpuff/view/widgets/elevated_button.dart';

class CourseCard extends StatelessWidget {
  final String coursename;
  final String description;
  final String price;
  final String image;
  final String createdAt;

  const CourseCard({
    super.key,
    required this.coursename,
    required this.description,
    required this.price,
    required this.image,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coursename,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      description,
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Text(
                      'price: ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    Text(
                      'duration: ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: CustomElevatedButton(
                        text: 'Login',
                        backgroundColor: Theme.of(context).primaryColor,
                        onPressed: () {},
                        horizontalPadding: 30,
                        verticalPadding: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 100,
              height: 80,
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
