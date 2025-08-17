# Kurtlar Sofrası 🐺

Flutter tabanlı cross-platform mobil uygulama projesi. Firebase backend servisleri ile entegre, modern mobil uygulama geliştirme teknolojileri kullanılarak geliştirilmiştir.

## 📱 Proje Hakkında

Bu proje, Flutter framework'ü kullanılarak geliştirilmiş modern bir mobil uygulamadır. Firebase servisleri ile backend entegrasyonu sağlanmış, çoklu platform desteği (Android, iOS, Web, Windows, macOS, Linux) sunulmaktadır.

## ✨ Ana Özellikler

### 🔐 Kimlik Doğrulama ve Güvenlik
- Firebase Authentication entegrasyonu
- Güvenli kullanıcı girişi ve kayıt sistemi
- Oturum yönetimi

### 💾 Veri Yönetimi
- Firebase Realtime Database entegrasyonu
- Cloud Firestore veritabanı desteği
- Offline veri senkronizasyonu

### 🖼️ Medya İşlemleri
- Resim yükleme ve yönetimi
- Firebase Storage entegrasyonu
- Galeri ve kamera erişimi

### 🌍 Çoklu Dil Desteği
- Flutter Localizations framework'ü
- intl paketi ile gelişmiş lokalizasyon
- Dinamik dil değiştirme

### 📱 Cross-Platform Desteği
- **Android**: Native Android uygulaması
- **iOS**: Native iOS uygulaması
- **Web**: Progressive Web App (PWA)
- **Desktop**: Windows, macOS, Linux desteği

## 🛠️ Teknoloji Stack'i

### Frontend Framework
- **Flutter**: Google'ın cross-platform UI framework'ü
- **Dart**: Flutter'ın programlama dili
- **Material Design**: Modern UI/UX tasarım sistemi

### Backend Servisleri
- **Firebase Core**: Ana Firebase servisi
- **Firebase Auth**: Kullanıcı kimlik doğrulama
- **Firebase Database**: Realtime veritabanı
- **Cloud Firestore**: NoSQL veritabanı
- **Firebase Storage**: Dosya depolama

### Ek Paketler
- **shared_preferences**: Yerel veri saklama
- **http**: HTTP istekleri
- **image_picker**: Resim seçimi
- **flag**: Bayrak ikonları
- **localization**: Gelişmiş lokalizasyon

## 📋 Sistem Gereksinimleri

### Geliştirme Ortamı
- **Flutter SDK**: 2.7.4 veya üzeri
- **Dart SDK**: Flutter ile birlikte gelir
- **IDE**: VS Code, Android Studio veya IntelliJ IDEA
- **Git**: Versiyon kontrol sistemi

### Platform Gereksinimleri
- **Android**: API Level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **Web**: Modern web tarayıcıları
- **Desktop**: Windows 10+, macOS 10.14+, Ubuntu 18.04+

## 🚀 Kurulum ve Çalıştırma

### 1. Proje Klonlama
```bash
git clone [repository-url]
cd kurtlar_Sofrasi
```

### 2. Flutter Kurulumu
Flutter SDK'nın sisteminizde kurulu olduğundan emin olun:
```bash
flutter doctor
```

### 3. Bağımlılıkları Yükleme
```bash
cd kurtlar
flutter pub get
```

### 4. Firebase Yapılandırması
1. Firebase Console'da yeni proje oluşturun
2. Android, iOS ve Web uygulamalarını ekleyin
3. Yapılandırma dosyalarını indirin:
   - `google-services.json` → `android/app/`
   - `GoogleService-Info.plist` → `ios/Runner/`
   - Firebase config → `web/index.html`

### 5. Uygulamayı Çalıştırma
```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

## 📁 Proje Yapısı

```
kurtlar/
├── lib/                    # Dart kaynak kodları
│   ├── main.dart          # Ana uygulama giriş noktası
│   ├── screens/           # Ekran widget'ları
│   ├── widgets/           # Yeniden kullanılabilir widget'lar
│   ├── models/            # Veri modelleri
│   ├── services/          # Firebase ve API servisleri
│   ├── utils/             # Yardımcı fonksiyonlar
│   └── constants/         # Sabit değerler
├── assets/                 # Statik dosyalar
│   └── images/            # Resim dosyaları
├── android/               # Android platform dosyaları
├── ios/                   # iOS platform dosyaları
├── web/                   # Web platform dosyaları
├── windows/               # Windows platform dosyaları
├── macos/                 # macOS platform dosyaları
├── linux/                 # Linux platform dosyaları
├── test/                  # Test dosyaları
├── pubspec.yaml           # Proje bağımlılıkları
├── pubspec.lock           # Kilitli bağımlılık versiyonları
├── analysis_options.yaml  # Dart analiz ayarları
└── l10n.yaml             # Lokalizasyon ayarları
```

## 🔧 Geliştirme Komutları

### Temel Komutlar
```bash
# Bağımlılıkları yükle
flutter pub get

# Uygulamayı çalıştır
flutter run

# Build oluştur
flutter build apk          # Android APK
flutter build ios          # iOS
flutter build web          # Web
flutter build windows      # Windows
flutter build macos        # macOS
flutter build linux        # Linux

# Test çalıştır
flutter test

# Kod analizi
flutter analyze

# Paket güncelle
flutter pub upgrade
```

### Debug ve Profiling
```bash
# Debug modunda çalıştır
flutter run --debug

# Release modunda çalıştır
flutter run --release

# Profile modunda çalıştır
flutter run --profile
```

## 📱 Platform Özellikleri

### Android
- Minimum API Level: 21
- Target API Level: 33
- Permissions: Camera, Storage, Internet

### iOS
- Minimum iOS Version: 11.0
- Target iOS Version: 16.0
- Permissions: Camera, Photo Library

### Web
- Progressive Web App (PWA) desteği
- Service Worker entegrasyonu
- Responsive tasarım

### Desktop
- Native performans
- Platform-specific UI adaptasyonu
- Sistem entegrasyonu

## 🧪 Test ve Kalite

### Test Türleri
- **Unit Tests**: Fonksiyon ve sınıf testleri
- **Widget Tests**: UI bileşen testleri
- **Integration Tests**: End-to-end testler

### Test Çalıştırma
```bash
# Tüm testleri çalıştır
flutter test

# Belirli test dosyasını çalıştır
flutter test test/widget_test.dart

# Coverage ile test çalıştır
flutter test --coverage
```

## 📦 Build ve Dağıtım

### Android APK
```bash
flutter build apk --release
# APK: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle
```bash
flutter build appbundle --release
# AAB: build/app/outputs/bundle/release/app-release.aab
```

### iOS
```bash
flutter build ios --release
# Xcode ile archive ve upload
```

### Web
```bash
flutter build web --release
# build/web/ klasöründe dağıtım dosyaları
```

## 🔍 Sorun Giderme

### Yaygın Sorunlar

#### Flutter Doctor Hataları
```bash
flutter doctor -v
flutter clean
flutter pub get
```

#### Build Hataları
```bash
flutter clean
flutter pub get
flutter build [platform] --verbose
```

#### Firebase Bağlantı Sorunları
- API anahtarlarını kontrol edin
- Firebase kurallarını gözden geçirin
- Network bağlantısını test edin

## 📚 Faydalı Kaynaklar

### Flutter Dokümantasyonu
- [Flutter Resmi Sitesi](https://flutter.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)
- [Flutter API Reference](https://api.flutter.dev/)

### Firebase Dokümantasyonu
- [Firebase Console](https://console.firebase.google.com/)
- [Firebase Flutter Plugin](https://firebase.flutter.dev/)
- [Firebase Kuralları](https://firebase.google.com/docs/rules)

### Topluluk Kaynakları
- [Flutter Community](https://flutter.dev/community)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
- [Flutter GitHub](https://github.com/flutter/flutter)

## 🤝 Katkıda Bulunma

1. Projeyi fork edin
2. Feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## 📄 Lisans

Bu proje [MIT Lisansı](LICENSE) altında lisanslanmıştır.

## 📞 İletişim

- **Proje Sahibi**: [İsim]
- **E-posta**: [E-posta adresi]
- **GitHub**: [GitHub profil linki]

---

**Not**: Bu README dosyası proje geliştikçe güncellenecektir. En güncel bilgiler için proje kaynak kodunu kontrol edin.
