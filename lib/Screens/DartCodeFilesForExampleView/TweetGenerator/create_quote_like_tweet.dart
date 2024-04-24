import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MakeQuoteLikeTweet {
  final String? text;
  final String? userId;
  final String? userName;

  MakeQuoteLikeTweet({this.text, this.userId, this.userName});
}

class QuotesAppScreen extends StatefulWidget {
  const QuotesAppScreen({super.key});

  @override
  State<QuotesAppScreen> createState() => _QuotesAppScreenState();
}

class _QuotesAppScreenState extends State<QuotesAppScreen> {
  final List<MakeQuoteLikeTweet> quotes = [];
  final ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? profileImage;

  final _formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final userIdController = TextEditingController();
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            InkWell(
              onTap: () async {
                image =
                await picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: Container(
                height: 350,
                width: 400,
                // height: 400,
                color: Colors.deepPurple[100],
                child: Stack(
                  children: [
                    Container(
                      height: 500,
                      width: 500,
                      color: Colors.transparent,
                      child: image == null
                          ? const Icon(Icons.add_a_photo)
                          : Opacity(
                        opacity: 0.92,
                        // child: Image.network(
                        //   (image!.path),
                        //   fit: BoxFit.cover,
                        // ),
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: quotes.length,
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 1, height: 1);
                      },
                      itemBuilder: (context, index) {
                        final quote = quotes[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 70, left: 30, right: 30),
                          child: Container(
                            decoration: BoxDecoration(
                              // color: Colors.white12,
                              color: Colors.white38,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: InkWell(
                                    onTap: () async {
                                      profileImage =
                                      await picker.pickImage(
                                          source:
                                          ImageSource.gallery);
                                      setState(() {});
                                    },
                                    child: profileImage == null
                                        ? const Icon(Icons.add_a_photo)
                                        : Container(
                                      height: 40,
                                      width: 40,
                                      decoration:
                                      const BoxDecoration(
                                        // image: DecorationImage(
                                        // for emulator
                                        // AssetImage(profileImage!.path),
                                        // for chrome
                                        // image: NetworkImage(
                                        //     profileImage!.path),
                                        // fit: BoxFit.cover,
                                        // ),
                                        color: Colors.greenAccent,
                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipOval(
                                        child: Image.file(
                                          File(profileImage!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    '${quote.userName}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${quote.userId}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 20,),
                                          child: Text(
                                            "${quote.text}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.indigo,
                                              fontSize: 16,
                                              shadows: [
                                                Shadow(
                                                  color:
                                                  Colors.indigo.shade200,
                                                  offset:
                                                  const Offset(1, 1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Divider(),
                                const SizedBox(height: 8),
                                const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(CupertinoIcons.chat_bubble, size: 18),
                                    Icon(CupertinoIcons.arrow_2_squarepath, size: 18),
                                    Icon(Icons.favorite_border, size: 18),
                                    Icon(CupertinoIcons.share, size: 18),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("download your image...."),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    maxLines: 2,
                    minLines: 1,
                    controller: textController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a quote';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your quote here',
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your user name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your user name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: userIdController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your user ID';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your user ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                quotes.add(MakeQuoteLikeTweet(
                                  text: textController.text,
                                  userName: userNameController.text,
                                  userId: userIdController.text,
                                ));
                                textController.clear();
                                userNameController.clear();
                                userIdController.clear();
                              });
                            }
                          },
                          child: const Text('Post'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

