# iOS-all-projects

# 001 - What Did I Watched?

## Uygulama Tanımı

Uygulama 18-25 arası gençlerin izlediği, izleyeceği ve devam edeceği dizi ya da filmleri kayıt edebileceği bir platform olacak. Kullanıcı dizi ya da filmi eklerken imdb kodunu kullanarak direkt olarak dizinin ya da filmin bilgilerini çekebilecek. Eğer dizi ya da film imdb kütüphanesinde yok ise kullanıcı filmin afişini ve isimini girerek de kayıt edebilecek. Kayıt ettiği dizi ya da filmin bilgisi içinde gezebilecek. Eğer devam etmek üzere bıraktığı bir dizi ise bıraktığı sezon ve bölümü belirtebilecek.

## Uygulama Gereklilikleri

- Imdb den bilgi çekebilmek için IMDB API
- Bilgileri saklamak için database ya da local data base
- Resim alabilmek ve boyut ayarı için Image Kütüphanesi
- Kullanıcı bir dizi ya da filmi devam edecem olarak işaretlediyse kullanıcıya yarım bıraktığı dizi ya da film bildirim olarak gönderilecek. “Şimdi devam etmenin tam sırası”
- Kullanıcı dizi ya da filmi tekrar izlerim diye kayıt ederse de üzerinden 1 ay geçen dizi ya da film bildirim olarak gönderilecek. “Tekrar izle ve yad et”
- Kullanıcı bildirimin üzerine tıkladığında gönderilen dizi ya da filmin bilgileri ile uygulama açılacak. ”Giriş yapılmışsa eğer”; “Giriş yapılmamışsa eğer giriş yaptırıldıktan sonra kullanıcı bilgilere yönlendirilecek.”

## Uygulama Dizayn Bilgileri

### İlk Ekran

Kullanıcı ilk gördüğü ekran ile ugulamaya giriş yapacak. Hesabı yoksa kayıt olacak.

### İkinci Ekran

Kullanıcı kayıt ettiği dizi ve filmleri görecek. Altta bir tab controller ile tamamlananlar, devam edecekler ve izlenecekler arasında geçiş yapabilecek. Her tab controller gösterdiği dizi ve filmi kendileri içinde guruplandırarak “Segmented Controller” alt başlık ile gösterecek.

Özel bir listView tasarımı yapılacak. Sol da filmin ya da dizinin afişi ve sağ da ise filmin ya da dizinin ismi, verdiğin puan, imdb puanı, mevcut durumu, tekrar izleyecem gibi bilgileri olacak.

Kaydırarak silme eventi olacak.

### Üçüncü Ekran

Kullanıcının tıkladığı dizi ya da film ekrana alttan açılan ekran olarak gelecek ve kullanıcı seçtiği dizinin ya da filmin imdb üzerinden çekilmiş bilgilerini görecek.
