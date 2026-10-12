# Taş Kağıt Makas Yapay Zekası

**TÜBİTAK 4006-A Bilim Fuarı projesi**

Hazırlayan öğrenciler: **Umut Dalga**, **Ruhi Emre Karaman**
Danışman öğretmen: **Mehmet Akbaş**

Oyuncunun hamle desenlerini okuyup ona karşı oynayan bir taş kağıt makas yapay zekâsı. Tarayıcıda çalışır; kurulum veya sunucu gerektirmez.

## Nasıl çalışır?

Yapay zekâ, her turda 30'dan fazla tahminciyi aynı anda çalıştırır:

- Hamle sıklığı (kısa, orta ve uzun hafıza)
- Hamle dizileri (Markov zincirleri, 1–5 derinlik)
- İki oyuncunun ortak geçmişi
- Kazanınca ya da kaybedince ne yapıldığı
- Geçmişte en uzun eşleşen anı bulup ardından ne oynandığı
- Oyuncunun yapay zekâyı tahmin etmeye çalışıp çalışmadığı

Her tahmin üç açıdan (doğrudan, bir adım önde, iki adım önde) puanlanır ve son dönemde en başarılı olan seçilir. Güvenilir bir desen bulunamadığında yapay zekâ rastgele oynayarak kendini korur.

Tamamen rastgele oynayan birine karşı hiçbir strateji uzun vadede %33'ün üstüne çıkamaz. İnsanlar ise rastgele oynayamaz; bu proje o alışkanlıkları bulup onlara karşı oynar.

## Özellikler

- Oyuncu sırası ve skor tablosu (sergi için tek bilgisayarda)
- Ayarlanabilir tur süresi ve tur sayısı
- Rastgelelik puanı ve desen haritası
- Tam ekran modu, ses efektleri, animasyonlar
- Mobil ve dokunmatik ekran desteği

## Geliştirme

Kaynak dosya `index.html`'dir. GitHub Pages sürümü `docs/index.html` olarak şu komutla üretilir:

```bash
bash build.sh
```
