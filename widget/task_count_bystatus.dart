import 'package:flutter/material.dart';

class TaskCountBystatus extends StatelessWidget {
  final String title;
  final int count;
  const TaskCountBystatus({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:15,vertical: 15),
        child: Column(
          children:[

            Text(count.toString(),
            style: Theme.of(context).textTheme.bodyLarge,),


            Text(title,
              style:Theme.of(context).textTheme.bodyLarge ,)
          ],
        ),
      ),
    );
  }
}
