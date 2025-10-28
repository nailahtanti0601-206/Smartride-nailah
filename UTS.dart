import 'dart:math';

abstract class Transportasi {
  String nama;
  double tarif;
  Transportasi(this.nama, this.tarif);
  double hitung(int jp);
}

class Taksi extends Transportasi {
  double jarak;
  Taksi(super.nama, super.tarif, this.jarak);
  @override
  double hitung(int jp) => tarif*jarak;
}

class Bus extends Transportasi {
  bool wifi;
  Bus(super.nama, super.tarif, this.wifi);
  @override
  double hitung(int jp) => tarif * jp + (wifi ? 5000 : 0);
}

class Pesawat extends Transportasi {
  String kelas;
  Pesawat(super.nama, super.tarif, this.kelas);
  @override
  double hitung(int jp) => tarif * jp * (kelas == 'Bisnis' ? 1.5 : 1.0);
}

void main() {
  var list = [
    {'t': Taksi('Taksi', 5000, 15), 'n': 'Nursan', 'jp': 2},
    {'t': Bus('Bus', 4000, true), 'n': 'Mila', 'jp': 5},
    {'t': Pesawat('Pesawat', 8000000, 'Bisnis'), 'n': 'Astrid', 'jp': 1},
  ];

  for (var d in list) {
    var t = d['t'] as Transportasi;
    var jp = d['t'] as int;
    var total = t.hitung(jp);
    print(
      '${d['n']} naik ${t.nama}: Rp${total.toStringAsFixed(0)} (ID-${Random().nextInt(999)})',
    );
  }
}
