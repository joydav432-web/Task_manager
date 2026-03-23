import 'package:flutter/material.dart';


class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text('Task title',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18
            ),
          ),


          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Desc"),
              Text("Date : 13 mar 2026"),


              Row(
                children: [


                  Chip(label: Text("New"),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,

                    ),),
                  Spacer(),

                  IconButton(onPressed: (){},
                      icon: Icon(Icons.edit,color: Colors.orange,)),

                  IconButton(onPressed: (){},
                      icon: Icon(Icons.delete,color: Colors.red,))

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
