import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'hero_title': 'Reliable Local Repair & Renovation Services',
      'hero_subtitle':
          'Quick, affordable help for your home or business – from painting to plumbing.',
      'request_technician': 'Request a Technician',
      'home': 'Home',
      'services': 'Services',
      'app_name':
          'Özinan Yapı Malzemeleri - Reliable Local Repair & Renovation Services',
      'request_service': 'Request Service',
      'reviews': 'Reviews',
      'our_services': 'Our Services',
      'services_subtitle':
          'We offer a comprehensive range of repair and renovation services to keep your home or business in perfect condition.',
      'painting': 'Painting',
      'plumbing': 'Plumbing',
      'electrical': 'Electrical',
      'tiling': 'Tiling',
      'view_all_services': 'View all services',
      'contact_us': 'Contact Us',
      'quick_links': 'Quick Links',
      'privacy_policy': 'Privacy Policy',
      'terms_of_service': 'Terms of Service',
      'all_rights_reserved': 'All rights reserved.',
      'company_name': 'Özinan Yapı Malzemeleri',
      'working_hours': 'Mon-Sat: 8.30AM - 8PM',
      'trusted_experts_title': 'Professional Plumbing Solutions Since 1995',
      'trusted_experts_desc1':
          'Founded by Master Davut in 1995, Özinan Yapı Malzemeleri has been providing expert plumbing solutions for over 30 years. Our deep expertise in plumbing repairs and renovations has made us the trusted choice for countless households in Istanbul.',
      'trusted_experts_desc2':
          'At Özinan Yapı Malzemeleri, we combine our extensive experience with high-quality plumbing materials and modern techniques. We specialize in bathroom and kitchen repairs, drain cleaning, complete bathroom renovations, and emergency plumbing services.',
      'trusted_experts_desc3':
          'Our team of skilled plumbers, led by Master Davut, ensures every job is completed to the highest standards. Whether it\'s a simple faucet repair or a complete bathroom renovation, we provide reliable solutions with quality materials from our own supply store.',
      'years_experience': 'Years Experience',
      'projects_completed': 'Projects Completed',
      'customer_satisfaction': 'Customer Satisfaction',
      'emergency_service': 'Emergency Service',
      'what_we_can_help': 'What We Can Help You With',
      'what_we_can_help_subtitle':
          'From small repairs to complete renovations, our skilled technicians can handle all your home improvement needs.',
      'ready_to_repair': 'Ready to get your repair project started?',
      'ready_to_repair_subtitle':
          'Our team of skilled technicians is ready to help with your home or business repair needs. Request service today and get a quick response.',
      'call_us_now': 'Call Us Now',
      'need_fix': 'Need a Fix? Let\'s Get Started',
      'need_fix_subtitle':
          'Fill out the form below to request our services. We\'ll get back to you within 24 hours to schedule your appointment.',
      'full_name': 'Full Name',
      'enter_full_name': 'Enter your full name',
      'phone_number': 'Phone Number',
      'enter_phone': 'Enter your phone number',
      'address': 'Address',
      'enter_address': 'Enter your address',
      'type_of_need': 'Type of Need',
      'select_service_type': 'Select service type',
      'additional_notes': 'Additional Notes (optional)',
      'describe_needs': 'Describe your repair needs in detail',
      'submit_request': 'Submit Request',
      'whatsapp_chat': 'Prefer WhatsApp? Click here to chat with us now',
      'what_customers_say': 'What Our Customers Say',
      'customers_say_subtitle':
          'Don\'t just take our word for it. Here\'s what our satisfied customers have to say about our services.',
      'doors_windows': 'Doors & Windows',
      'garden_exterior': 'Garden & Exterior',
      'other': 'Other',
      'bathroom_renovation': 'Bathroom Renovation',
      'kitchen_renovation': 'Kitchen Renovation',
      'water_leakage': 'Water Leakage',
      'water_leakage_repair': 'Water Leakage Repair',
      'review1_name': 'James Davidson',
      'review1_initials': 'JD',
      'review1_text':
          'Had a major bathroom renovation done by Özinan Yapı. They replaced all the plumbing, installed a new shower system, and fixed some long-standing drainage issues. The team was professional and the quality of work is outstanding!',
      'review2_name': 'Sarah Livingston',
      'review2_initials': 'SL',
      'review2_text':
          'Called them for an emergency pipe leak in my kitchen. They arrived quickly, identified the problem, and fixed it efficiently. Very reasonable pricing and excellent service. Would definitely recommend!',
      'review3_name': 'Michael Rodriguez',
      'review3_initials': 'MR',
      'review3_text':
          'They did a complete renovation of our bathroom including new toilet installation and fixing all plumbing issues. Master Turgut personally supervised the work and ensured everything was perfect. Very satisfied with the result.',
      'review4_name': 'Emily Thompson',
      'review4_initials': 'ET',
      'review4_text':
          'Had persistent clogging issues in multiple drains that other companies couldn\'t solve. Master Mahmut from Özinan Yapı identified the root cause and fixed everything permanently. Their expertise is unmatched!',
      'review5_name': 'Master Turgut',
      'review5_initials': 'TU',
      'review5_text':
          'As a master plumber with 25 years of experience at Özinan Yapı, I take pride in solving complex plumbing issues. We specialize in bathroom and kitchen repairs, drain cleaning, and complete bathroom renovations. Quality and customer satisfaction are our priorities.',
      'review6_name': 'Master Mahmut',
      'review6_initials': 'MA',
      'review6_text':
          'Having served countless customers over 20 years at Özinan Yapı, I can confidently say that no plumbing problem is too difficult for us. We use the latest technology and techniques to ensure lasting solutions for all your plumbing needs.',
      'service1_title': 'Drain Cleaning',
      'service1_desc':
          'Professional drain cleaning for kitchen, bathroom, and all household drains. We solve persistent clogs and ensure proper water flow.',
      'service2_title': 'Bathroom Repairs',
      'service2_desc':
          'Complete bathroom plumbing services including toilet repairs, faucet replacement, shower system installation, and leak fixes.',
      'service3_title': 'Kitchen Plumbing',
      'service3_desc':
          'Expert kitchen plumbing services including sink repairs, faucet installation, drain maintenance, and pipe leak fixes.',
      'service4_title': 'Emergency Plumbing',
      'service4_desc':
          'Fast response emergency plumbing service for urgent issues like burst pipes, major leaks, and severe clogs.',
      'service5_title': 'Bathroom Renovation',
      'service5_desc':
          'Complete bathroom renovation services with focus on plumbing infrastructure, including pipe replacement and fixture installation.',
      'service6_title': 'Maintenance Service',
      'service6_desc':
          'Regular plumbing maintenance and inspection to prevent issues and ensure your plumbing system works efficiently.',
      'whatWeCanHelp': 'Our Plumbing Services',
      'whatWeCanHelpSubtitle':
          'Professional plumbing solutions for your home and business. Our experienced master plumbers are ready to solve all your plumbing needs.',
    },
    'tr': {
      'hero_title': 'Güvenilir Yerel Tamir ve Yenileme Hizmetleri',
      'hero_subtitle':
          'Eviniz veya işyeriniz için hızlı, uygun fiyatlı yardım – boyamadan tesisata.',
      'request_technician': 'Usta Talep Et',
      'home': 'Ana Sayfa',
      'services': 'Hizmetler',
      'app_name': 'Özinan Yapı Malzemeleri - Tamir ve Tadilat Hizmetleri',
      'request_service': 'Hizmet Talebi',
      'reviews': 'Yorumlar',
      'our_services': 'Hizmetlerimiz',
      'services_subtitle':
          'Evinizi veya işyerinizi mükemmel durumda tutmak için kapsamlı tamir ve yenileme hizmetleri sunuyoruz.',
      'painting': 'Boya',
      'plumbing': 'Tesisat',
      'electrical': 'Elektrik',
      'tiling': 'Fayans',
      'view_all_services': 'Tüm hizmetleri görüntüle',
      'contact_us': 'Bize Ulaşın',
      'quick_links': 'Hızlı Bağlantılar',
      'privacy_policy': 'Gizlilik Politikası',
      'terms_of_service': 'Kullanım Şartları',
      'all_rights_reserved': 'Tüm hakları saklıdır.',
      'company_name': 'Özinan Yapı Malzemeleri',
      'working_hours': 'Pzt-Cmt: 8.30-20.00',
      'trusted_experts_title': '1995\'den Beri Profesyonel Tesisat Çözümleri',
      'trusted_experts_desc1':
          '1995 yılında Davut Usta tarafından kurulan Özinan Yapı Malzemeleri, 30 yılı aşkın süredir uzman tesisat çözümleri sunuyor. Tesisat onarımları ve yenilemelerdeki derin uzmanlığımız, İstanbul\'da sayısız evin güvenilir tercihi olmamızı sağladı.',
      'trusted_experts_desc2':
          'Özinan Yapı Malzemeleri olarak, uzun yıllara dayanan tecrübemizi kaliteli tesisat malzemeleri ve modern tekniklerle birleştiriyoruz. Banyo ve mutfak tamiratları, gider açma, komple banyo yenileme ve acil tesisat hizmetleri konularında uzmanız.',
      'trusted_experts_desc3':
          'Davut Usta önderliğindeki uzman tesisatçı ekibimiz, her işin en yüksek standartlarda tamamlanmasını sağlıyor. Basit bir musluk tamirinden komple banyo yenilemesine kadar, kendi malzeme mağazamızdan temin ettiğimiz kaliteli ürünlerle güvenilir çözümler sunuyoruz.',
      'years_experience': 'Yıllık Deneyim',
      'projects_completed': 'Tamamlanan Proje',
      'customer_satisfaction': 'Müşteri Memnuniyeti',
      'emergency_service': 'Acil Servis',
      'what_we_can_help': 'Size Nasıl Yardımcı Olabiliriz',
      'what_we_can_help_subtitle':
          'Küçük tamirlerden komple yenilemelere kadar, uzman ustalarımız tüm ev geliştirme ihtiyaçlarınızı karşılayabilir.',
      'ready_to_repair': 'Tamir projenize başlamaya hazır mısınız?',
      'ready_to_repair_subtitle':
          'Uzman usta ekibimiz, ev veya işyeri tamir ihtiyaçlarınız için yardıma hazır. Hemen hizmet talep edin ve hızlı yanıt alın.',
      'call_us_now': 'Hemen Arayın',
      'need_fix': 'Tamire mi İhtiyacınız Var? Hemen Başlayalım',
      'need_fix_subtitle':
          'Hizmetlerimizi talep etmek için aşağıdaki formu doldurun. 24 saat içinde randevunuzu planlamak için size geri döneceğiz.',
      'full_name': 'Ad Soyad',
      'enter_full_name': 'Adınızı ve soyadınızı girin',
      'phone_number': 'Telefon Numarası',
      'enter_phone': 'Telefon numaranızı girin',
      'address': 'Adres',
      'enter_address': 'Adresinizi girin',
      'type_of_need': 'İhtiyaç Türü',
      'select_service_type': 'Hizmet türü seçin',
      'additional_notes': 'Ek Notlar (opsiyonel)',
      'describe_needs': 'Tamir ihtiyaçlarınızı detaylı olarak açıklayın',
      'submit_request': 'Talebi Gönder',
      'whatsapp_chat':
          'WhatsApp tercih eder misiniz? Hemen bizimle sohbet etmek için tıklayın',
      'what_customers_say': 'Müşterilerimiz Ne Diyor',
      'customers_say_subtitle':
          'Sadece bizim sözümüze güvenmeyin. İşte memnun müşterilerimizin hizmetlerimiz hakkında söyledikleri.',
      'doors_windows': 'Kapı ve Pencereler',
      'garden_exterior': 'Bahçe ve Dış Mekan',
      'other': 'Diğer',
      'bathroom_renovation': 'Banyo Yenileme',
      'kitchen_renovation': 'Mutfak Yenileme',
      'water_leakage': 'Su Sızıntısı',
      'water_leakage_repair': 'Su Sızıntısı Tamiri',
      'review1_name': 'Ahmet Yılmaz',
      'review1_initials': 'AY',
      'review1_text':
          'Özinan Yapı\'ya banyomuzun yenilenmesi için başvurduk. Tüm tesisatı yenilediler, yeni duş sistemi kurdular ve uzun süredir devam eden gider sorunlarını çözdüler. Ekip çok profesyoneldi ve işçilik kalitesi mükemmel!',
      'review2_name': 'Sevgi Kaya',
      'review2_initials': 'SK',
      'review2_text':
          'Mutfaktaki acil boru sızıntısı için aradım. Hızlıca geldiler, sorunu tespit ettiler ve etkili bir şekilde çözdüler. Çok makul fiyat ve mükemmel hizmet. Kesinlikle tavsiye ederim!',
      'review3_name': 'Mehmet Demir',
      'review3_initials': 'MD',
      'review3_text':
          'Banyomuzun komple yenilenmesi, klozet değişimi ve tüm tesisat sorunlarının giderilmesi işlemlerini yaptılar. Turgut Usta bizzat işin başında durdu ve her şeyin mükemmel olmasını sağladı. Sonuçtan çok memnun kaldık.',
      'review4_name': 'Elif Türk',
      'review4_initials': 'ET',
      'review4_text':
          'Diğer firmaların çözemediği birden fazla giderdeki tıkanıklık sorunumuz vardı. Özinan Yapı\'dan Mahmut Usta kök nedeni tespit etti ve kalıcı olarak çözdü. Uzmanlıkları gerçekten benzersiz!',
      'review5_name': 'Turgut Usta',
      'review5_initials': 'TU',
      'review5_text':
          'Özinan Yapı\'da 25 yıllık usta tesisatçı olarak, karmaşık tesisat sorunlarını çözmekten gurur duyuyorum. Banyo ve mutfak tamiratları, gider açma ve komple banyo yenileme konularında uzmanız. Kalite ve müşteri memnuniyeti önceliğimizdir.',
      'review6_name': 'Mahmut Usta',
      'review6_initials': 'MA',
      'review6_text':
          'Özinan Yapı\'da 20 yılı aşkın süredir sayısız müşteriye hizmet verdikten sonra diyebilirim ki, bizim için çözülemeyecek tesisat sorunu yoktur. En son teknoloji ve teknikleri kullanarak tüm tesisat ihtiyaçlarınıza kalıcı çözümler sunuyoruz.',
      'service1_title': 'Gider Açma',
      'service1_desc':
          'Mutfak, banyo ve tüm ev giderlerinde profesyonel tıkanıklık açma hizmeti. İnatçı tıkanıklıkları çözüyor ve düzgün su akışını sağlıyoruz.',
      'service2_title': 'Banyo Tamiratı',
      'service2_desc':
          'Klozet tamiri, musluk değişimi, duş sistemi kurulumu ve su kaçağı onarımı dahil komple banyo tesisat hizmetleri.',
      'service3_title': 'Mutfak Tesisatı',
      'service3_desc':
          'Lavabo tamiri, musluk montajı, gider bakımı ve boru sızıntısı onarımı dahil uzman mutfak tesisat hizmetleri.',
      'service4_title': 'Acil Tesisat',
      'service4_desc':
          'Patlak boru, büyük sızıntılar ve ciddi tıkanıklıklar gibi acil durumlar için hızlı müdahale hizmeti.',
      'service5_title': 'Banyo Yenileme',
      'service5_desc':
          'Boru değişimi ve tesisat montajı dahil, tesisat altyapısına odaklı komple banyo yenileme hizmetleri.',
      'service6_title': 'Bakım Hizmeti',
      'service6_desc':
          'Sorunları önlemek ve tesisat sisteminizin verimli çalışmasını sağlamak için düzenli tesisat bakımı ve kontrolü.',
      'whatWeCanHelp': 'Tesisat Hizmetlerimiz',
      'whatWeCanHelpSubtitle':
          'Ev ve işyeriniz için profesyonel tesisat çözümleri. Deneyimli usta tesisatçılarımız tüm tesisat ihtiyaçlarınızı çözmeye hazır.',
    },
  };

  String get heroTitle => _localizedValues[locale.languageCode]!['hero_title']!;
  String get heroSubtitle =>
      _localizedValues[locale.languageCode]!['hero_subtitle']!;
  String get requestTechnician =>
      _localizedValues[locale.languageCode]!['request_technician']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get appName => _localizedValues[locale.languageCode]!['app_name']!;
  String get services => _localizedValues[locale.languageCode]!['services']!;
  String get requestService =>
      _localizedValues[locale.languageCode]!['request_service']!;
  String get reviews => _localizedValues[locale.languageCode]!['reviews']!;
  String get ourServices =>
      _localizedValues[locale.languageCode]!['our_services']!;
  String get servicesSubtitle =>
      _localizedValues[locale.languageCode]!['services_subtitle']!;
  String get painting => _localizedValues[locale.languageCode]!['painting']!;
  String get plumbing => _localizedValues[locale.languageCode]!['plumbing']!;
  String get electrical =>
      _localizedValues[locale.languageCode]!['electrical']!;
  String get tiling => _localizedValues[locale.languageCode]!['tiling']!;
  String get viewAllServices =>
      _localizedValues[locale.languageCode]!['view_all_services']!;
  String get contactUs => _localizedValues[locale.languageCode]!['contact_us']!;
  String get quickLinks =>
      _localizedValues[locale.languageCode]!['quick_links']!;
  String get privacyPolicy =>
      _localizedValues[locale.languageCode]!['privacy_policy']!;
  String get termsOfService =>
      _localizedValues[locale.languageCode]!['terms_of_service']!;
  String get allRightsReserved =>
      _localizedValues[locale.languageCode]!['all_rights_reserved']!;
  String get companyName =>
      _localizedValues[locale.languageCode]!['company_name']!;
  String get workingHours =>
      _localizedValues[locale.languageCode]!['working_hours']!;
  String get trustedExpertsTitle =>
      _localizedValues[locale.languageCode]!['trusted_experts_title']!;
  String get trustedExpertsDesc1 =>
      _localizedValues[locale.languageCode]!['trusted_experts_desc1']!;
  String get trustedExpertsDesc2 =>
      _localizedValues[locale.languageCode]!['trusted_experts_desc2']!;
  String get trustedExpertsDesc3 =>
      _localizedValues[locale.languageCode]!['trusted_experts_desc3']!;
  String get yearsExperience =>
      _localizedValues[locale.languageCode]!['years_experience']!;
  String get projectsCompleted =>
      _localizedValues[locale.languageCode]!['projects_completed']!;
  String get customerSatisfaction =>
      _localizedValues[locale.languageCode]!['customer_satisfaction']!;
  String get emergencyService =>
      _localizedValues[locale.languageCode]!['emergency_service']!;
  String get whatWeCanHelp =>
      _localizedValues[locale.languageCode]!['what_we_can_help']!;
  String get whatWeCanHelpSubtitle =>
      _localizedValues[locale.languageCode]!['what_we_can_help_subtitle']!;
  String get readyToRepair =>
      _localizedValues[locale.languageCode]!['ready_to_repair']!;
  String get readyToRepairSubtitle =>
      _localizedValues[locale.languageCode]!['ready_to_repair_subtitle']!;
  String get callUsNow =>
      _localizedValues[locale.languageCode]!['call_us_now']!;
  String get needFix => _localizedValues[locale.languageCode]!['need_fix']!;
  String get needFixSubtitle =>
      _localizedValues[locale.languageCode]!['need_fix_subtitle']!;
  String get fullName => _localizedValues[locale.languageCode]!['full_name']!;
  String get enterFullName =>
      _localizedValues[locale.languageCode]!['enter_full_name']!;
  String get phoneNumber =>
      _localizedValues[locale.languageCode]!['phone_number']!;
  String get enterPhone =>
      _localizedValues[locale.languageCode]!['enter_phone']!;
  String get address => _localizedValues[locale.languageCode]!['address']!;
  String get enterAddress =>
      _localizedValues[locale.languageCode]!['enter_address']!;
  String get typeOfNeed =>
      _localizedValues[locale.languageCode]!['type_of_need']!;
  String get selectServiceType =>
      _localizedValues[locale.languageCode]!['select_service_type']!;
  String get additionalNotes =>
      _localizedValues[locale.languageCode]!['additional_notes']!;
  String get describeNeeds =>
      _localizedValues[locale.languageCode]!['describe_needs']!;
  String get submitRequest =>
      _localizedValues[locale.languageCode]!['submit_request']!;
  String get whatsappChat =>
      _localizedValues[locale.languageCode]!['whatsapp_chat']!;
  String get whatCustomersSay =>
      _localizedValues[locale.languageCode]!['what_customers_say']!;
  String get customersSaySubtitle =>
      _localizedValues[locale.languageCode]!['customers_say_subtitle']!;
  String get doorsWindows =>
      _localizedValues[locale.languageCode]!['doors_windows']!;
  String get gardenExterior =>
      _localizedValues[locale.languageCode]!['garden_exterior']!;
  String get other => _localizedValues[locale.languageCode]!['other']!;
  String get bathroomRenovation =>
      _localizedValues[locale.languageCode]!['bathroom_renovation']!;
  String get kitchenRenovation =>
      _localizedValues[locale.languageCode]!['kitchen_renovation']!;
  String get waterLeakage =>
      _localizedValues[locale.languageCode]!['water_leakage']!;
  String get waterLeakageRepair =>
      _localizedValues[locale.languageCode]!['water_leakage_repair']!;
  String get review1Name =>
      _localizedValues[locale.languageCode]!['review1_name']!;
  String get review1Initials =>
      _localizedValues[locale.languageCode]!['review1_initials']!;
  String get review1Text =>
      _localizedValues[locale.languageCode]!['review1_text']!;
  String get review2Name =>
      _localizedValues[locale.languageCode]!['review2_name']!;
  String get review2Initials =>
      _localizedValues[locale.languageCode]!['review2_initials']!;
  String get review2Text =>
      _localizedValues[locale.languageCode]!['review2_text']!;
  String get review3Name =>
      _localizedValues[locale.languageCode]!['review3_name']!;
  String get review3Initials =>
      _localizedValues[locale.languageCode]!['review3_initials']!;
  String get review3Text =>
      _localizedValues[locale.languageCode]!['review3_text']!;
  String get review4Name =>
      _localizedValues[locale.languageCode]!['review4_name']!;
  String get review4Initials =>
      _localizedValues[locale.languageCode]!['review4_initials']!;
  String get review4Text =>
      _localizedValues[locale.languageCode]!['review4_text']!;
  String get review5Name =>
      _localizedValues[locale.languageCode]!['review5_name']!;
  String get review5Initials =>
      _localizedValues[locale.languageCode]!['review5_initials']!;
  String get review5Text =>
      _localizedValues[locale.languageCode]!['review5_text']!;
  String get review6Name =>
      _localizedValues[locale.languageCode]!['review6_name']!;
  String get review6Initials =>
      _localizedValues[locale.languageCode]!['review6_initials']!;
  String get review6Text =>
      _localizedValues[locale.languageCode]!['review6_text']!;
  String get service1Title =>
      _localizedValues[locale.languageCode]!['service1_title']!;
  String get service1Desc =>
      _localizedValues[locale.languageCode]!['service1_desc']!;
  String get service2Title =>
      _localizedValues[locale.languageCode]!['service2_title']!;
  String get service2Desc =>
      _localizedValues[locale.languageCode]!['service2_desc']!;
  String get service3Title =>
      _localizedValues[locale.languageCode]!['service3_title']!;
  String get service3Desc =>
      _localizedValues[locale.languageCode]!['service3_desc']!;
  String get service4Title =>
      _localizedValues[locale.languageCode]!['service4_title']!;
  String get service4Desc =>
      _localizedValues[locale.languageCode]!['service4_desc']!;
  String get service5Title =>
      _localizedValues[locale.languageCode]!['service5_title']!;
  String get service5Desc =>
      _localizedValues[locale.languageCode]!['service5_desc']!;
  String get service6Title =>
      _localizedValues[locale.languageCode]!['service6_title']!;
  String get service6Desc =>
      _localizedValues[locale.languageCode]!['service6_desc']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
