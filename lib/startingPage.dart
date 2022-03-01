import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memories/endingPage.dart';

class MainApp extends StatefulWidget {
  String name, email, phone, DoB;

  MainApp(
      {required this.name,
      required this.email,
      required this.phone,
      required this.DoB});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  XFile? _imageFile;
  final ImagePicker picker = ImagePicker();
  TextEditingController _date = new TextEditingController();
  TextEditingController _tittle = new TextEditingController();
  TextEditingController _about = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black //change your color here
            ),
        backgroundColor: Colors.white,
        title: Text(
          'Hi, ${widget.name}',
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _date,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: '01/01/2000',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _tittle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Add tittle',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: _about,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      labelText: 'Write the moment',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                      },
                      child: Icon(
                        Icons.camera_alt_sharp,
                        color: Colors.grey,
                        size: 28.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.black,
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => displayApp(
                                    date: _date.text,
                                    about: _about.text,
                                    tittle: _tittle.text)),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void takePhoto(ImageSource source) async{
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            'Choose the Photo',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  icon: Icon(Icons.image),
                  label: Text('Gallery'),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                    // takePhoto(ImageSource.gallery);
                  }),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  // takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
