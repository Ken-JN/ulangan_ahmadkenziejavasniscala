import 'package:ulangan_ahmadkenziejavasniscala/Models/makanan_model.dart';
import 'package:get/get.dart';

class HomepageController extends GetxController {
  RxList<MakananModel> listMakanan = <MakananModel>[
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
}