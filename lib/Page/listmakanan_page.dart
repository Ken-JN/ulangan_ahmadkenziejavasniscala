import 'package:flutter/material.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Controller/food_controller.dart';
import 'package:ulangan_ahmadkenziejavasniscala/routes.dart';
import 'package:get/get.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Controller/listmakanan_controller.dart';


class ListMakananPage extends StatelessWidget {
  ListMakananPage({super.key});

  final controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Makanan")),
      body: Container(
        margin: EdgeInsets.all(18),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.listMakanan.length,
            itemBuilder: (context, index) {
              final makanan = controller.listMakanan[index];

              return Dismissible(
                key: ValueKey(makanan.namaMakanan),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),

                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.detailmakanan);
                  },

                  child: Card(
                    elevation: 10,
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            makanan.gambar,
                            height: 20,
                          ),

                          Text(
                            makanan.namaMakanan,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Harga: Rp.${makanan.hargaMakanan}",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
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
