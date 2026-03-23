import 'package:flutter/material.dart';
import 'package:task_manager/data/controller/auth_Controller.dart';

class TmAppbar extends StatelessWidget implements PreferredSize{
  const TmAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final profilePic = AuthController.userModel!.photo;
    return AppBar(
      backgroundColor: Colors.green,
      
      title: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              profilePic!
            ),
          ),
          SizedBox(width: 10,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${AuthController.userModel!.firstName} ${AuthController.userModel!.lastName}',


                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white
              ),),

              


        Text(AuthController.userModel!.email!,style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.white
        ))
            ]
        )

        ]


      ),
      
      actions: [
        IconButton(onPressed: (){}, 
            icon: Icon(Icons.logout,color: Colors.white,))
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
