import 'package:change_notifier/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HommePage extends StatefulWidget {
  const HommePage({super.key});

  @override
  State<HommePage> createState() => _HommePageState();
}

class _HommePageState extends State<HommePage> {
  final TextEditingController nameController = TextEditingController();
  final HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('ValueNotifier', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
              animation: homeController.names,
              builder: (_, __) {
                return homeController.names.value.isEmpty
                    ? const Center(
                        child: Text('Nenhum nome cadastrado'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 120),
                        itemCount: homeController.names.value.length,
                        itemBuilder: (_, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigo.shade400,
                            child: Center(
                              child: Text(
                                homeController.names.value[index][0],
                              ),
                            ),
                          ),
                          title: Text(
                            homeController.names.value[index],
                          ),
                          trailing: TextButton(
                            onPressed: () {
                              homeController.removeName(
                                  name: homeController.names.value[index]);
                            },
                            child:
                                const Icon(Icons.delete, color: Colors.indigo),
                          ),
                        ),
                      );
              }),
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
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: homeController.nameController,
                        decoration: InputDecoration(
                          hintText: 'Insira um nome',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ValueListenableBuilder(
                      valueListenable: homeController.botaoAdd,
                      builder: (context, value, child) {
                        return FloatingActionButton.small(
                          onPressed: !value
                              ? null
                              : () {
                                  homeController.addName(
                                      name: homeController.nameController.text);
                                  homeController.nameController.clear();
                                },
                          child: const Icon(
                            Icons.add,
                            //color: Colors.white,
                          ),
                          //backgroundColor: Colors.indigo,
                        );
                      },
                    ),
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
