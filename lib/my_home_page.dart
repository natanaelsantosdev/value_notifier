import 'package:change_notifier/home_controller.dart';
import 'package:flutter/material.dart';

class MyHommePage extends StatefulWidget {
  const MyHommePage({super.key});

  @override
  State<MyHommePage> createState() => _MyHommePageState();
}

class _MyHommePageState extends State<MyHommePage> {
  final TextEditingController nameController = TextEditingController();
  final HomeController homeControoler = HomeController();

  @override
  void initState() {
    super.initState();
    homeControoler.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ChangeNotifier',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          homeControoler.names.isEmpty
              ? const Center(child: Text('Nenhum nome cadastrado'))
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 120),
                  itemCount: homeControoler.names.length,
                  itemBuilder: (_, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green.shade300,
                      child: Center(
                        child: Text(
                          homeControoler.names[index][0],
                        ),
                      ),
                    ),
                    title: Text(
                      homeControoler.names[index],
                    ),
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.03),
                    offset: const Offset(0, -5),
                    blurRadius: 4,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Digite um nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        homeControoler.addName(name: nameController.text);
                        nameController.clear();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
