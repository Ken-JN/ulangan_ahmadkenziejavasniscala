class FoodOrderModel {
  final String namaMakanan;
  final String harga;
  final int porsi;
  final String tipePromo;
  final double nilaiPromo;
  final double diskonNominal;
  final double subtotal;
  final double pajakResto;
  final double serviceCharge;
  final double totalBayar;
  final String gambar;

  FoodOrderModel({
    required this.namaMakanan,
    required this.harga,
    required this.porsi,
    required this.tipePromo,
    required this.nilaiPromo,
    required this.diskonNominal,
    required this.subtotal,
    required this.pajakResto,
    required this.serviceCharge,
    required this.totalBayar,
    required this.gambar,
  });
}
