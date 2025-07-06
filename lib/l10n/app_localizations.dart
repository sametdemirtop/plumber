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
      'app_title': 'HandyFix - Reliable Local Repair & Renovation Services',
      'hero_title': 'Reliable Local Repair & Renovation Services',
      'hero_subtitle':
          'Quick, affordable help for your home or business – from painting to plumbing.',
      'request_technician': 'Request a Technician',
      'home': 'Home',
      'services': 'Services',
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
      'trusted_experts_title': 'Your Trusted Local Repair Experts',
      'trusted_experts_desc1':
          'Since 2010, HandyFix has been providing top-quality repair and renovation services to homeowners and businesses across the region. Our team of skilled technicians brings expertise and dedication to every project, no matter how big or small.',
      'trusted_experts_desc2':
          'We understand that home repairs can be stressful, which is why we focus on providing reliable, transparent, and affordable services. Our technicians arrive on time, work efficiently, and always clean up after the job is done.',
      'trusted_experts_desc3':
          'Whether you need a quick fix for a leaky faucet or a complete room renovation, we\'re here to help with the skill and care your home deserves.',
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
    },
    'tr': {
      'app_title': 'HandyFix - Güvenilir Yerel Tamir ve Yenileme Hizmetleri',
      'hero_title': 'Güvenilir Yerel Tamir ve Yenileme Hizmetleri',
      'hero_subtitle':
          'Eviniz veya işyeriniz için hızlı, uygun fiyatlı yardım – boyamadan tesisata.',
      'request_technician': 'Teknisyen Talep Et',
      'home': 'Ana Sayfa',
      'services': 'Hizmetler',
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
      'trusted_experts_title': 'Güvenilir Yerel Tamir Uzmanlarınız',
      'trusted_experts_desc1':
          '2010 yılından beri HandyFix, ev sahiplerine ve işletmelere bölge genelinde yüksek kaliteli tamir ve yenileme hizmetleri sunmaktadır. Uzman teknisyen ekibimiz, büyük küçük her projeye uzmanlık ve özveriyle yaklaşmaktadır.',
      'trusted_experts_desc2':
          'Ev tamirlerinin stresli olabileceğini biliyoruz, bu yüzden güvenilir, şeffaf ve uygun fiyatlı hizmetler sunmaya odaklanıyoruz. Teknisyenlerimiz zamanında gelir, verimli çalışır ve iş bittikten sonra her zaman temizlik yapar.',
      'trusted_experts_desc3':
          'İster damlayan bir musluk için hızlı bir onarım, ister komple bir oda yenilemesi ihtiyacınız olsun, evinize hak ettiği beceri ve özenle yardımcı olmak için buradayız.',
      'years_experience': 'Yıllık Deneyim',
      'projects_completed': 'Tamamlanan Proje',
      'customer_satisfaction': 'Müşteri Memnuniyeti',
      'emergency_service': 'Acil Servis',
      'what_we_can_help': 'Size Nasıl Yardımcı Olabiliriz',
      'what_we_can_help_subtitle':
          'Küçük tamirlerden komple yenilemelere kadar, uzman teknisyenlerimiz tüm ev geliştirme ihtiyaçlarınızı karşılayabilir.',
      'ready_to_repair': 'Tamir projenize başlamaya hazır mısınız?',
      'ready_to_repair_subtitle':
          'Uzman teknisyen ekibimiz, ev veya işyeri tamir ihtiyaçlarınız için yardıma hazır. Hemen hizmet talep edin ve hızlı yanıt alın.',
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
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]!['app_title']!;
  String get heroTitle => _localizedValues[locale.languageCode]!['hero_title']!;
  String get heroSubtitle =>
      _localizedValues[locale.languageCode]!['hero_subtitle']!;
  String get requestTechnician =>
      _localizedValues[locale.languageCode]!['request_technician']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
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
