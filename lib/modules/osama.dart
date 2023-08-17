
import 'package:flutter/material.dart';




class ChatBoot extends StatefulWidget {
  const ChatBoot({Key? key}) : super(key: key);

  @override
  _ChatBootState createState() => _ChatBootState();
}

class _ChatBootState extends State<ChatBoot> {
  //late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
   // DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AMBot'),
      ),
      body: ListView.separated(itemBuilder: (context,index)=>Container(
        height: 100,
        width: double.infinity,
        color: Colors.orange,
      ), separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: 2),

      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        color: Colors.deepPurple,
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {

                    _controller.clear();
                  },
                  icon: Icon(Icons.send))
          ),
          controller: _controller,
          style: TextStyle(color: Colors.white),
        ),
      ),

    );
  }

}