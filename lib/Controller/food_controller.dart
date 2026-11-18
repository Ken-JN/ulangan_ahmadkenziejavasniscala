import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Models/makanan_model.dart';
import 'package:ulangan_ahmadkenziejavasniscala/Models/food_order_model.dart';

class FoodController extends GetxController {
  late MakananModel makanan;
  TextEditingController NamaMakanan = TextEditingController();
  TextEditingController txtPorsi = TextEditingController(text: "1");
  TextEditingController txtDiskon = TextEditingController();
  TextEditingController txtHarga = TextEditingController();
  late String gambar;
  late String deskripsiMakanan;


   @override
  void onInit() {
    super.onInit();
    makanan = Get.arguments;
    deskripsiMakanan = makanan.deskripsiMakanan;
    gambar = makanan.gambar;
  }

  var tipePromo = "Kupon (Rp)".obs; // "Persen (%)" atau "Kupon (Rp)"
  var pajakPB1 = 0.5.obs; // Pajak Restoran (PB1) 10%
  var serviceCharge = 0.0.obs; // Service Charge 5%

  var hasilOrder = Rxn<FoodOrderModel>();

  // List Menu Makanan
  final RxList<MakananModel> listMakanan = <MakananModel>[
    MakananModel(
      namaMakanan: 'Nasi Goreng Spesial',
      deskripsiMakanan:
          'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
      hargaMakanan: "Rp. 25.000",
      gambar:
          'https://o-cdf.oramiland.com/unsafe/cnc-magazine.oramiland.com/parenting/original_images/soto_ayam_bumbu_kuning.jpg',
    ),
    MakananModel(
      namaMakanan: 'Ayam Bakar Madu',
      deskripsiMakanan:
          'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan',
      hargaMakanan: "Rp. 30.000",
      gambar:
          'https://image.idn.media/post/20220101/screenshot-2022-01-02-05-10-19-72-1c337646f29875672b5a61192b9010f9-6d2cbb4bbec2340f770674be006d2944-0c6c08844a9f986440835cb11b7d41d0.jpg',
    ),
    MakananModel(
      namaMakanan: 'Sate Ayam Madura',
      deskripsiMakanan:
          '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
      hargaMakanan: "Rp. 28.000",
      gambar:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYl7YyuGr_vIp41cytKJfAqOJxE7WNvzmXsdWxKQcAb_nmLws575GnxbY&s=10',
    ),
    MakananModel(
      namaMakanan: 'Mie Ayam Bakso',
      deskripsiMakanan:
          'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
      hargaMakanan: "Rp. 20.000",
      gambar:
          'https://asset.tribunnews.com/PdNdZ8WFnhSh8g0l5t0cPLGF478=/1200x675/filters:upscale():quality(30):format(webp):focal(0.5x0.5:0.5x0.5)/tribunnews/foto/bank/originals/bakso-sapi-kuah-1.jpg',
    ),
    MakananModel(
      namaMakanan: 'Es Teh Manis Jumbo',
      deskripsiMakanan:
          'Minuman teh melati segar dengan gula asli dan es batu kristal.',
      hargaMakanan: "Rp. 8.000",
      gambar:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShlIIPuBs9f0b7ClpkhefMFWDOsbMZhLVzSHscLG4XWQ&s=10',
    ),
  ].obs;

  void pilihMenu(MakananModel food) {
    NamaMakanan.text = food.namaMakanan;
    txtHarga.text = food.hargaMakanan;
  }

  void setTipePromo(String tipe) {
    tipePromo.value = tipe;
  }

  void hitung() {
    if (NamaMakanan.text.trim().isEmpty ||
        txtHarga.text.trim().isEmpty ||
        txtPorsi.text.trim().isEmpty) {
      Get.snackbar("Peringatan", "Nama menu, harga, dan porsi harus diisi!");
      return;
    }

    double? harga = double.tryParse(txtHarga.text.trim());
    int? porsi = int.tryParse(txtPorsi.text.trim());

    if (harga == null || harga <= 0 || porsi == null || porsi <= 0) {
      Get.snackbar("Error", "Harga dan porsi harus berupa angka positif!");
      return;
    }

    double nilaiPromoInput = 0;
    if (txtDiskon.text.trim().isNotEmpty) {
      nilaiPromoInput = double.tryParse(txtDiskon.text.trim()) ?? 0;
    }

    double subtotal = harga * porsi;
    double diskonNominal = 0;

    if (tipePromo.value == "Persen (%)") {
      diskonNominal = subtotal * (nilaiPromoInput / 100);
    } else {
      diskonNominal = nilaiPromoInput;
    }

    if (diskonNominal > subtotal) {
      diskonNominal = subtotal;
    }

    double setelahDiskon = subtotal - diskonNominal;
    double pajak = setelahDiskon * (pajakPB1.value / 100);
    double service = setelahDiskon * (serviceCharge.value / 100);
    double totalBayar = setelahDiskon + pajak + service;

    hasilOrder.value = FoodOrderModel(
      namaMakanan: NamaMakanan.text.trim(),
      harga: txtHarga.text,
      porsi: porsi,
      tipePromo: tipePromo.value,
      nilaiPromo: nilaiPromoInput,
      diskonNominal: diskonNominal,
      subtotal: subtotal,
      pajakResto: pajak,
      serviceCharge: service,
      totalBayar: totalBayar,
      gambar: gambar,
    );

    Get.snackbar(
      "Berhasil",
      "Total Tagihan: Rp ${totalBayar.toStringAsFixed(0)}",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void reset() {
    txtPorsi.text = "1";
    txtDiskon.clear();
    tipePromo.value = "Kupon (Rp)";
    hasilOrder.value = null;
  }
}
