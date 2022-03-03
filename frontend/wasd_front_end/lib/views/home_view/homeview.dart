// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, unnecessary_const
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:wasd_front_end/app/routes/routes.dart';
import 'package:wasd_front_end/constants/constants.dart';
import 'package:wasd_front_end/core/model/post_model.dart';
import 'package:wasd_front_end/widgets/post_card.dart';
// import 'package:wasd_front_end/core/notifier/authentication_notifier.dart';
// import 'package:wasd_front_end/core/notifier/post_notifier.dart';
// import 'package:wasd_front_end/core/services/cacheservice.dart';
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PostNotifier postNotifier(bool renderUri) => Provider.of<PostNotifier>(context,listen: renderUri);
    // CacheService _cacheService = CacheService();
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: ConstantColors.backgroundColor,
        elevation: 0,
        title: const Image(image: AssetImage('lib/static/logo.png'),height: 85,width: 85,),
        actions: <Widget> [
          IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message_outlined),
        ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            PostCard(
              user: 'Dante',
              title: 'First Post sdads asdasda dad asd ad as das dadas da d',
              imageUrl: 'lib/static/post3.jpg', 
              likes: 10, profileImageUrl: 'lib/static/profile.jpg', 
              comments: 2
            ),
            PostCard(
              user: 'Trident',
              title: 'First Post sdads asdasda dad asd ad as das dadas da d',
              imageUrl: 'lib/static/post0.jpg', 
              likes: 10, profileImageUrl: 'lib/static/trident.jpg', 
              comments: 2
            ),
            PostCard(
              user: 'Decoy',
              title: 'First Post sdads asdasda dad asd ad as das dadas da d',
              imageUrl: 'lib/static/post1.jpg', 
              likes: 10, profileImageUrl: 'lib/static/decoy.jpg', 
              comments: 2
            ),
            PostCard(
              user: 'Sukuna',
              title: 'First Post sdads asdasda dad asd ad as das dadas da d',
              imageUrl: 'lib/static/post2.jpg', 
              likes: 10, profileImageUrl: 'lib/static/max.jpg', 
              comments: 2
            ),
          ],
        ),
      ),
    );
  }
}

class ListOfPosts extends StatelessWidget {
  final dynamic snapshot;
  const ListOfPosts({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.length,
      itemBuilder: (context, index){
        PostData postData = snapshot[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(postData.postImages[0]),
          ),
          title: Text(postData.postTitle),
        );
      }
    );
  }
}

//Container(
        // child: FutureBuilder(
        //   future: postNotifier(false).fetchPost(context: context),
        //   builder: (context,snapshot) {
        //     if(snapshot.connectionState == ConnectionState.waiting){
        //       return const Center(
        //         child: const CircularProgressIndicator(),
        //       );
        //     }
        //     else{
        //       var _snapshot = snapshot.data as List;
        //       return ListOfPosts(snapshot: _snapshot);
        //     }
        //   }
        // ),
//      )

// floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () async {
//           postNotifier(false).fetchPost(context: context);
//           final authenticationNotifier = Provider.of<AuthenticationNotifier>(context, listen: false);
//           await authenticationNotifier.fetchUserEmail(context: context);
//           Navigator.of(context).pushNamed(AddPostRoute);
//         },
//       )

// IconButton(
//           onPressed: () {
//             // _cacheService.deleteCache(key: "jwt");
//             // Navigator.of(context).pushReplacementNamed(LoginRoute);
//           },
//           icon: const Icon(Icons.message_outlined),
//         ),