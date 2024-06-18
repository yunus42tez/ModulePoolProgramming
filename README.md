# ModulePoolProgramming
Module Pool Program - Dialog Screen

 ![image](https://github.com/yunus42tez/ModulePoolProgramming/assets/119634510/d2b74967-3c36-4c5f-b639-40ffda40944b)

 
1.	Program tipi module pool olacak (SE38 den yaratırken). TOP, PBO,PAI ve FRM include larını içerecek.
2.	Her screen için Se11'den stucture oluşturulacak. Ekran verileri bu structure'lar üzerinden kontrol edilecek.
3.	Malzeme no, girişi seçilip yada yazılabilecek. Enter'a basınca malzeme tanımı yanına text field a yazacak.
4.	Üretim yeri, açılır kutu olacak ve veriler standart uyarlama tablosundan alınacak (T001W). Tanımı nasıl bulunacağı öğrenilecek
5.	Fason sipariş tıkı, mamül malzeme (radio2 seçili) ise, seçilebilir olacak aksi durumda pasif olacak.
6.	Siparişler kısmında girilen malzeme+üy ne göre VBAP tablosundan siparişleri alınacak. Altında da textbox 'da "sipariş+kalemi" görüntülenecek. Yanlardaki ok tuşları(buton) basılınca da siparişler arası dolaşılabilecek. Gezinti sırasında da hangi siparişte ise onun "indeksi / toplam sipariş sayısı" gösterilecek.
7.	Eğer sipariş bulunamadı ise, "Siparişler" in altında VBELN+POSNR yerine "Uygun sipariş bulunamadı!" hatası verilecek.
8.	Sipariş varsa vbeln+posnr üzerine çift tıkladığımda alttaki tabstrip 1 de sipariş detayları gelecek. 
9.	Sipariş no ve kalemi ile LIPS-VGBEL ve VGPOS 'a vereceğiz. Kayıt gelirse, tab2 de teslimat bilgileri yer alıcak.
10.	Teslimat no ve kalemi ile VBRP-VGBEL ve VGPOS 'a vereceğiz. Kayıt gelirse, tab3 de fatura bilgileri yer alıcak.
11.	Tüm selectlerde sadece gerekli alanlar alınacak.
12.	Her 3 tabdaki veriler, siparişlerdeki sağa-sola gezinti butonlarına tıklandığında yenilecek. Kayıt yoksa boş gelecek.
13.	"Temizle" butonu ile ekranlardaki tüm alanlar clear edilecek.
14.	"Kaydet" butonu ile o an seçili olan sipariş verileri Z'li tabloya kaydedilecek.
15.	"Çıkış" butonu ile ekrandan çıkılacak. (exit module)

 
 
