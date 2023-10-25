void main() {
  int faktoriyelHesabi(int girilenSayi) {
    int sonuc = 1;
    for (var i = 1; i < girilenSayi + 1; i++) {
      /*
      1=1*1
      1=1*2
      2=2*3
      6=6*4
      24=24*5
      burada biter çünkü i<girilen +1 yani 6 durur
      */
      sonuc = sonuc * i;
    }
    return sonuc;
  }

  print("Girilen sayı ile  faktöriyel hesaplama: ${faktoriyelHesabi(5)}");
}
