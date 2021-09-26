# findflight

findflight App, flutter ile yazılmıştır. 2,5mb boyutunda ve toplamda 66bin satır içeren tek parça json dosyasının parse edilmesi ve elde edilen 201 adet uçuş bilgisinin filtrelenerek tekrar listelenmesi amaçlanmıştır.

<img src="media/1.png" alt="drawing" height="300"/> <img src="media/2.png" alt="drawing" height="300"/> <img src="media/3.png" alt="drawing" height="300"/> <img src="media/4.png" alt="drawing" height="300"/>

# Library | Use
provider: ^6.0.0
<br />http: ^0.13.3

# How to
Uygulama için öncelikle json dosyasına göre modeller oluşturulmuş ve parse işlemi tamamlanmıştır.
Ardından ekran tasarımlarına geçilmiş ve ilk ekran oluşturulmuştur. Uygulama; nereden nereye, tarih ve benzeri uçuş bilgilerinin görüntülendiği ekranla açılmaktadır. Hemen altında ki sonuçları görüntüle butonuna bastığımızda json dosyasından parse edilen bilgiler uçuş bilgi card'ları olarak 201 adet görüntülenmekedir. 
Ardından filtreleme sayfasına geçilerek, aktarma / aktarmasız, fiyat aralığı, kalkış saat aralığı, iniş saat aralığı, uçuşların bağlı olduğu havaalanları ve havayolu firma seçimi yapılarak sonuçların listenmektedir.  

<img src="media/5.png" alt="drawing" height="300"/> <img src="media/6.png" alt="drawing" height="300"/> <img src="media/7.png" alt="drawing" height="300"/> <img src="media/8.png" alt="drawing" height="300"/> 


<br />Uygulama tasarımında, arayüz ve kullanıcı deneyimi dikkate alınmamış olup yalnızca fonksyonellik gözetilmiştir. 
<br />Uygulama, Iphone SE (2nd Generation) emülatörü üzerinde test edilerek geliştirilmiştir.
<br />Uygulama ekran görüntülerine ve video içeriklerine media klasöründen ulaşılabilir.
