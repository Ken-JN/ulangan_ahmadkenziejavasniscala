import 'package:flutter/material.dart';
import 'package:ulangan_ahmadkenziejavasniscala/routes.dart';
import 'package:get/get.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Controller/homepage_controller.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});

  final HomepageController controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Makanan")),
      body: Container(
        margin: const EdgeInsets.all(15),
        height: 140,
        child: Obx(
          () => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.listMakanan.length,
            itemBuilder: (context, index) {
              final makanan = controller.listMakanan[index];

              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.detailmakanan, arguments: makanan);
                },
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 160,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          makanan.namaMakanan,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Harga: ${makanan.hargaMakanan}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

