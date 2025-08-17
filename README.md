# Kurtlar Sofrası

Flutter tabanlı mobil uygulama projesi.

## Özellikler

- Firebase entegrasyonu (Authentication, Database, Storage)
- Çoklu dil desteği
- Resim yükleme ve yönetimi
- Cross-platform (Android, iOS, Web, Windows, macOS, Linux)

## Gereksinimler

- Flutter SDK (>=2.7.4)
- Dart SDK
- Firebase projesi

## Kurulum

1. Projeyi klonlayın
2. `kurtlar` klasörüne gidin
3. Bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```
4. Firebase yapılandırmasını tamamlayın
5. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```

## Teknolojiler

- **Framework**: Flutter
- **Backend**: Firebase
- **State Management**: Flutter built-in
- **Localization**: Flutter Localizations + intl
- **Image Handling**: image_picker, firebase_storage

## Proje Yapısı

```
kurtlar/
├── lib/           # Dart kaynak kodları
├── assets/        # Resimler ve statik dosyalar
├── android/       # Android platform dosyaları
├── ios/          # iOS platform dosyaları
├── web/          # Web platform dosyaları
├── windows/      # Windows platform dosyaları
├── macos/        # macOS platform dosyaları
└── linux/        # Linux platform dosyaları
```
