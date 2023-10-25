void main() {
  List<int> asalListe = [];

  int girilenN(int N) {
    for (int sayi = 2; sayi <= N; sayi++) {
      bool asalMi = true;
      for (int i = 2; i < sayi; i++) {
        if (sayi % i == 0) {
          asalMi = false;
          break; 
        }
      }
      if (asalMi) {
        asalListe.add(sayi);
      }
    }
    return N;
  }

  print("girilen N sayisi: ${girilenN(55)}");
  print("1 den ${girilenN(55)} e kadar olan asal sayılar: $asalListe"); //iki kere yazıyor
}
