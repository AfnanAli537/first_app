import 'package:flutter/material.dart';
import 'package:app1/content/app_strings.dart';
import 'package:app1/content/container.dart';
import 'package:app1/content/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const Text(' Home ',
          style: TextStyle( 
            color: Colors.white, 
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),   
      ),
      body: Column( 
      children: [
        Expanded(
        flex:10,
        child: Container(
          child: ListView.builder(
            itemCount: 21,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
                subtitle: Text('Subtitle for item $index'),
                leading: Icon(Icons.star),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                   Fluttertoast.showToast(
                    msg: 'Tapped on Item $index',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black54,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
              );
            }, 
          ),
        ),
      ),
      Expanded(
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          selectedItemColor: AppColors.mainColor,
          onTap: (index) {
            // Handle navigation
          },
        ),
      )],
      ), 
    );
  } 
}
