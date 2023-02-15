import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_generator/todo.dart';

class TodoView extends StatefulWidget {
  Todo todo;
  TodoView({Key key, this.todo}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState(todo: this.todo);
}

class _TodoViewState extends State<TodoView> {
  Todo todo;
  _TodoViewState({this.todo});
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (todo != null) {
      titleController.text = todo.title;
      descriptionController.text = todo.description;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        //backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
        title: const Text("RDP INFO"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                onChanged: (data) {
                  todo.title = data;
                },
                //style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  //labelStyle: const TextStyle(color: Colors.white),
                  labelText: "Title",
                  //fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  //fillColor: Colors.green
                ),
                controller: titleController,
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                onChanged: (data) {
                  todo.description = data;
                },
                //style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  //labelStyle: const TextStyle(color: Colors.white),
                  labelText: "AuthKey",
                  //fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    //borderSide: const BorderSide(color: Colors.white),
                  ),
                  //fillColor: Colors.green
                ),
                controller: descriptionController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 55.0,
        child: BottomAppBar(
          //color: const Color.fromRGBO(58, 66, 86, 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              /* InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text("Alert"),
                        content: Text(
                            "Mark this todo as ${todo.status ? 'not done' : 'done'}  "),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("No"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                todo.status = !todo.status;
                              });
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Yes"),
                          )
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "${todo.status ? 'Mark as Not Done' : 'Mark as Done'} ",
                    style: const TextStyle(color: Colors.white),
                  )), */
              /* const VerticalDivider(
                color: Colors.white,
              ), */
              IconButton(
                icon: const Icon(Icons.save, color: Colors.greenAccent),
                onPressed: () {
                  Navigator.pop(context, todo);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  /*  Widget colorOverride(Widget child) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      child: child,
    );
  } */
}
