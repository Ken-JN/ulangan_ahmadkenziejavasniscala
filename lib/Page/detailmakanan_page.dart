import 'package:flutter/material.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Components/custom_textField.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Controller/food_controller.dart';
import 'package:get/get.dart';

class DetailmakananPage extends StatelessWidget {
  DetailmakananPage({super.key});

  final controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food & Restaurant Order"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pesanan Menu Restoran",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              txtController: controller.NamaMakanan,
              MyHint: "Nama Menu (contoh: Nasi Goreng Spesial)",
              textColor: Colors.black,
            ),
            // tes
            const SizedBox(height: 12),
            CustomTextField(
              txtController: controller.txtHarga,
              MyHint: "Harga per Porsi (Rp)",
              textColor: Colors.black,
              isNumber: true,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              txtController: controller.txtPorsi,
              MyHint: "Jumlah Porsi",
              textColor: Colors.black,
              isNumber: true,
            ),
            const SizedBox(height: 12),
            const Text(
              "Tipe Diskon / Voucher:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  value: controller.tipePromo.value,
                  items: const ['Kupon (Rp)', 'Persen (%)'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.setTipePromo(value);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(
              () => CustomTextField(
                txtController: controller.txtDiskon,
                MyHint: controller.tipePromo.value == "Persen (%)"
                    ? "Besaran Diskon (contoh: 10 untuk 10%)"
                    : "Voucher Diskon (contoh: 10000 untuk 10rb)",
                textColor: Colors.black,
                isNumber: true,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.receipt_long, color: Colors.deepOrange),
                  SizedBox(width: 8),
                  Text(
                    "Pajak Resto PB1: 10% | Service: 5%",
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () => controller.hitung(),
                    child: const Text(
                      "Pesan Sekarang",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  ),
                  onPressed: () => controller.reset(),
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Obx(() {
              final hasil = controller.hasilOrder.value;
              if (hasil == null) {
                return const SizedBox();
              }

              return Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "STRUK RESTORAN & FOOD ORDER",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const Divider(height: 20, thickness: 1.5),
                      _itemRow("Menu Pesanan", hasil.namaMakanan),
                      _itemRow("Harga Porsi", "Rp ${hasil.harga}"),
                      _itemRow("Jumlah Porsi", "${hasil.porsi} porsi"),
                      const Divider(height: 16),
                      _itemRow("Subtotal", "Rp ${hasil.subtotal.toStringAsFixed(0)}"),
                      _itemRow(
                        "Diskon (${hasil.tipePromo})",
                        "- Rp ${hasil.diskonNominal.toStringAsFixed(0)}",
                        valueColor: Colors.red,
                      ),
                      _itemRow(
                        "Pajak Resto (PB1 10%)",
                        "+ Rp ${hasil.pajakResto.toStringAsFixed(0)}",
                      ),
                      _itemRow(
                        "Service Charge (5%)",
                        "+ Rp ${hasil.serviceCharge.toStringAsFixed(0)}",
                      ),
                      const Divider(height: 20, thickness: 1.5),
                      _itemRow(
                        "TOTAL TAGIHAN",
                        "Rp ${hasil.totalBayar.toStringAsFixed(0)}",
                        isBold: true,
                        valueColor: Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _itemRow(
    String label,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isBold ? 16 : 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isBold ? 18 : 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
