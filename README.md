# FindFlight App

findflight App, flutter ile yazılmıştır. 2,5mb boyutunda ve toplamda 66bin satır içeren tek parça json dosyasının parse edilmesi ve elde edilen 201 adet uçuş bilgisinin filtrelenerek tekrar listelenmesi amaçlanmıştır.

<img src="media/1.png" alt="drawing" height="300"/> <img src="media/2.png" alt="drawing" height="300"/> <img src="media/3.png" alt="drawing" height="300"/> <img src="media/4.png" alt="drawing" height="300"/>

# Library | Use
provider: ^6.0.0
<br />http: ^0.13.3
<br />email_validator: ^2.0.1

<img src="media/5.png" alt="drawing" height="300"/> <img src="media/6.png" alt="drawing" height="300"/> <img src="media/6.png" alt="drawing" height="300"/> <img src="media/8.png" alt="drawing" height="300"/>

# How to
Uygulama için öncelikle json dosyasına göre modeller oluşturulmuş ve parse işlemi tamamlanmıştır. Ardından ekran tasarımlarına geçilmiş ve ilk ekran oluşturulmuştur. Uygulama; nereden nereye, tarih ve benzeri uçuş bilgilerinin görüntülendiği ekranla açılmaktadır. Hemen altında ki sonuçları görüntüle butonuna bastığımızda json dosyasından parse edilen bilgiler uçuş bilgi card'ları olarak 201 adet görüntülenmekedir.
<br />Ardından filtreleme sayfasına geçilerek, aktarma / aktarmasız, fiyat aralığı, kalkış saat aralığı, iniş saat aralığı, uçuşların bağlı olduğu havaalanları ve havayolu firma seçimi şeklinde sonuçlar filtrelenerek listelenmektedir.


<img src="media/9.png" alt="drawing" height="300"/> <img src="media/10.png" alt="drawing" height="300"/>
<br />Validasyon ekranında ise veri girişine uygun olarak tek bir form yapısı latında validasyonlar sağlanmaktadır. Ayrıca yaş kontrolü yapılarak yetişkin bireyler için 12 yaş sınırı belirlenmiş olup 12 yaşın altında olan doğum tarihi seçimi yapılmasına izin verilmemiştir.

# Youtube video
<br />[![FindFlight App](https://img.youtube.com/vi/LED03IRaDTk/0.jpg)](https://www.youtube.com/watch?v=LED03IRaDTk "FindFlight App")
<br />[![FindFlight App](https://img.youtube.com/vi/WxzZP7Klcrw/0.jpg)](https://www.youtube.com/watch?v=WxzZP7Klcrw "FindFlight App")

- Uygulama tasarımında, arayüz ve kullanıcı deneyimi dikkate alınmamıştır.
- Uygulama, Iphone SE (2nd Generation) emülatörü üzerinde test edilerek geliştirilmiştir.
- Uygulama ekran görüntülerine ve video içeriklerine media klasöründen ulaşılabilir.
