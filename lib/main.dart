import 'package:demo1/checkboxmodal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final allChecked = CheckBoxModal(title: 'All Checked');
  final chekBoxList = [
    CheckBoxModal(title: 'CheckBox1'),
    CheckBoxModal(title: 'CheckBox2'),
    CheckBoxModal(title: 'CheckBox3'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Checkbox flutter'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => onAllChecked(allChecked),
            leading: Checkbox(
              value: allChecked.value,
              onChanged: (value) => onAllChecked(allChecked),
            ),
            title: Text(
              allChecked.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ...chekBoxList.map((item) => ListTile(
                onTap: () => onItemChecked(item),
                leading: Checkbox(
                  value: item.value,
                  onChanged: (value) => onItemChecked(item),
                ),
                title: Text(
                  item.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    ));
  }

  onAllChecked(CheckBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = !ckbItem.value;
      chekBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }

  onItemChecked(CheckBoxModal ckbItem) {
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      if (!newValue) {
        allChecked.value = false;
      } else {
        final allListChecked = chekBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}
