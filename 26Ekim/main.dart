/*
Verilen sayının Armstrong Sayı olup olmadığını bulan fonksiyonu yazınız ve test ediniz.

Armstrong Sayı Nedir ?
N haneli bir sayının basamaklarının n’inci üstlerinin toplamı, sayının kendisine eşitse, böyle sayılara Armstrong sayı denir.


Örneğin 407 = (4^3)+ (0^3)+(7^3) = 64+0+343 = 407  bir armstrong sayıdır.
*/
import 'dart:math';

void ayirVeYazdir() {
  int sayi = 407;
  int verilenSayi = sayi;
  late int usToplami;
  List<int> basamaklar = [];

  if (sayi == 0) {
    basamaklar.add(0);
  } else {
    while (sayi > 0) {
      int basamak = sayi % 10; //sayının modunu al
      basamaklar.add(basamak); //kalan 7 basamak değişkenini list e ekle
      sayi ~/= 10; //sayi 407, 10a böl tam kısmı al demek
    }
  }

  basamaklar = basamaklar.reversed.toList(); //7.0.4 olduğu için ters çevir

  print("Sayının basamakları: $basamaklar");

  int sayiAdeti = basamaklar.length; //üs için kullan
  List<int> usSonuclari = [];

  for (int sayi1 in basamaklar) {
    int sonuc = pow(sayi1, sayiAdeti).toInt();
    //basamaklar list i boyunca çalış,  list uzunluğunu üs kullan
    usSonuclari.add(sonuc);
  }

  print("basamak listindeki adet $sayiAdeti ile üs bulma");
  for (int i = 0; i < basamaklar.length; i++) {
    print('${basamaklar[i]} üzeri $sayiAdeti = ${usSonuclari[i]}');
    //0.index =4 üzeri 3 = üs sonuçlarını sırayla yazdır
  }

  int toplam = 0;
  for (int sayi2 in usSonuclari) {
    toplam += sayi2; //0+=64 64+=0 64+=343 407
  }
  usToplami = toplam; //if döngüsü için

  print("Ussonuclari list içindeki sayıların toplamı: $usToplami");

  if (verilenSayi == usToplami) {
    print("bu sayi $verilenSayi Armstrong sayidir.");
  } else {
    print("bu sayi $verilenSayi Armstrong sayi değildir.");
  }
}

void main() {
  ayirVeYazdir();
}
