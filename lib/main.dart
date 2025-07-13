import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'providers/locale_provider.dart';
import 'providers/menu_state.dart';
import 'providers/hover_state.dart';
import 'providers/service_state.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => MenuState()),
        ChangeNotifierProvider(create: (_) => HoverState()),
        ChangeNotifierProvider(create: (_) => ServiceState()),
      ],
      child: const HandyFixApp(),
    ),
  );
}

class HandyFixApp extends StatelessWidget {
  const HandyFixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: localeProvider.locale.languageCode == 'tr'
              ? 'Özinan Yapı Malzemeleri - Tamir ve Tadilat Hizmetleri'
              : 'Özinan Yapı Malzemeleri - Repair and Renovation Services',
          locale: localeProvider.locale,
          supportedLocales: const [
            Locale('en'),
            Locale('tr'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF2B4B80),
              primary: const Color(0xFF2B4B80),
              secondary: const Color(0xFFFF7A3D),
            ),
            useMaterial3: true,
            textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold),
              displayMedium:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold),
              displaySmall:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold),
              headlineLarge:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
              headlineMedium:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
              headlineSmall:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
              titleLarge:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600),
              titleMedium:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500),
              titleSmall:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500),
              bodyLarge:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.normal),
              bodyMedium:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.normal),
              bodySmall:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.normal),
              labelLarge:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500),
              labelMedium:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500),
              labelSmall:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w500),
            ),
          ),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          home: const HandyFixHomePage(),
        );
      },
    );
  }
}

class HandyFixHomePage extends StatefulWidget {
  const HandyFixHomePage({super.key});

  @override
  State<HandyFixHomePage> createState() => _HandyFixHomePageState();
}

class _HandyFixHomePageState extends State<HandyFixHomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _requestKey = GlobalKey();
  final GlobalKey _reviewsKey = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final GlobalKey _heroKey = GlobalKey();

  // Reusable Text Component
  Widget customText(String text,
      {double? fontSize,
      FontWeight? fontWeight,
      Color? color,
      TextAlign? textAlign,
      FontStyle? fontStyle,
      double? height,
      TextDecoration? decoration}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontStyle,
        height: height,
        decoration: decoration,
      ),
      textAlign: textAlign,
    );
  }

  // Reusable Image Component with caching
  Widget customImage(String assetPath,
      {double? width,
      double? height,
      BoxFit fit = BoxFit.cover,
      ImageErrorWidgetBuilder? errorBuilder}) {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: errorBuilder,
      cacheWidth: width?.toInt(),
      cacheHeight: height?.toInt(),
    );
  }

  // Reusable TextField Component
  Widget customTextField(
      {required String hintText,
      required TextEditingController controller,
      bool obscureText = false,
      TextInputType? keyboardType,
      int maxLines = 1,
      String? Function(String?)? validator,
      TextStyle? style,
      InputDecoration? decoration}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      style: style,
      decoration: decoration ??
          InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _scrollToSection(String sectionId) {
    GlobalKey? targetKey;
    switch (sectionId) {
      case 'home':
        targetKey = _heroKey;
        break;
      case 'services':
        targetKey = _servicesKey;
        break;
      case 'request':
        targetKey = _requestKey;
        break;
      case 'reviews':
        targetKey = _reviewsKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildNavigation(),
            _buildHeroSection(),
            _buildIntroSection(),
            _buildServicesPreview(),
            _buildServicesSection(),
            _buildCTASection(),
            _buildRequestSection(),
            _buildReviewsSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigation() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 16
                  : 20,
              vertical: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 12
                  : 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    height:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? 60
                            : 100,
                    child: customImage(
                      'assets/images/logo1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                if (ResponsiveBreakpoints.of(context).smallerThan(TABLET))
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      context.watch<MenuState>().isMobileMenuOpen
                          ? Icons.close
                          : Icons.menu,
                      size: 28,
                      color: const Color(0xFF2B4B80),
                    ),
                    onPressed: () {
                      context.read<MenuState>().toggleMobileMenu();
                    },
                  )
                else
                  Flexible(
                    flex: 2,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _buildNavItem(AppLocalizations.of(context).home,
                              () => _scrollToSection('home')),
                          _buildNavItem(AppLocalizations.of(context).services,
                              () => _scrollToSection('services')),
                          _buildNavItem(
                              AppLocalizations.of(context).requestService,
                              () => _scrollToSection('request')),
                          _buildNavItem(AppLocalizations.of(context).reviews,
                              () => _scrollToSection('reviews')),
                          const SizedBox(width: 20),
                          _buildHoverButton(
                            onPressed: () => _scrollToSection('request'),
                            buttonId: 'nav_request',
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: customText(
                              AppLocalizations.of(context).requestTechnician,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            onPressed: () {
                              context.read<LocaleProvider>().toggleLocale();
                            },
                            icon: customText(
                              context
                                  .watch<LocaleProvider>()
                                  .locale
                                  .languageCode
                                  .toUpperCase(),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2B4B80),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (ResponsiveBreakpoints.of(context).smallerThan(TABLET) &&
              context.watch<MenuState>().isMobileMenuOpen)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildMobileNavItem(AppLocalizations.of(context).home,
                      () => _scrollToSection('home')),
                  _buildMobileNavItem(AppLocalizations.of(context).services,
                      () => _scrollToSection('services')),
                  _buildMobileNavItem(
                      AppLocalizations.of(context).requestService,
                      () => _scrollToSection('request')),
                  _buildMobileNavItem(AppLocalizations.of(context).reviews,
                      () => _scrollToSection('reviews')),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: _buildHoverButton(
                      onPressed: () => _scrollToSection('request'),
                      buttonId: 'mobile_request',
                      child: customText(
                        AppLocalizations.of(context).requestTechnician,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: IconButton(
                      onPressed: () {
                        context.read<LocaleProvider>().toggleLocale();
                      },
                      icon: customText(
                        context
                            .watch<LocaleProvider>()
                            .locale
                            .languageCode
                            .toUpperCase(),
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2B4B80),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMobileNavItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: () {
        onTap();
        context.read<MenuState>().closeMobileMenu();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: customText(
          title,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1F2937),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) =>
              context.read<HoverState>().setHoveredButton('nav_$title', true),
          onExit: (_) =>
              context.read<HoverState>().setHoveredButton('nav_$title', false),
          child: GestureDetector(
            onTap: onTap,
            child: HoverAnimatedWidget(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color:
                      context.watch<HoverState>().isHoveredButton('nav_$title')
                          ? const Color(0xFF2B4B80).withOpacity(0.1)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: customText(
                  title,
                  fontSize: 16,
                  fontWeight:
                      context.watch<HoverState>().isHoveredButton('nav_$title')
                          ? FontWeight.w600
                          : FontWeight.w500,
                  color: const Color(0xFF1F2937),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHoverButton({
    required VoidCallback onPressed,
    required Widget child,
    required String buttonId,
    Color backgroundColor = const Color(0xFFFF7A3D),
    Color hoverBackgroundColor = const Color(0xFFFF6B2B),
    EdgeInsetsGeometry? padding,
  }) {
    return HoverAnimatedWidget(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, String description) {
    final isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    return HoverAnimatedWidget(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 20 : 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B4B80).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Icon(
                    icon,
                    size: 28,
                    color: const Color(0xFF2B4B80),
                  ),
                ),
                const SizedBox(width: 16),
                customText(
                  title,
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2937),
                ),
              ],
            ),
            const SizedBox(height: 8),
            customText(
              description,
              fontSize: 14,
              color: const Color(0xFF6B7280),
              height: 1.6,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesSection() {
    return Container(
      key: _servicesKey,
      padding: EdgeInsets.symmetric(
        vertical:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 40 : 64,
        horizontal:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 20,
      ),
      color: Colors.white,
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            customText(
              AppLocalizations.of(context).whatWeCanHelp,
              fontSize: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 24
                  : 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
            const SizedBox(height: 16),
            customText(
              AppLocalizations.of(context).whatWeCanHelpSubtitle,
              fontSize: 16,
              color: const Color(0xFF6B7280),
              height: 1.6,
            ),
            SizedBox(
              height: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 32
                  : 48,
            ),
            ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              columnSpacing:
                  ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                      ? 16
                      : 24,
              children: [
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowSpacing: 24,
                    columnSpacing: 16,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'assets/images/gider.png',
                          AppLocalizations.of(context).service1Title,
                          AppLocalizations.of(context).service1Desc,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'assets/images/banyo.png',
                          AppLocalizations.of(context).service2Title,
                          AppLocalizations.of(context).service2Desc,
                        ),
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowSpacing: 24,
                    columnSpacing: 16,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'assets/images/mutfak.png',
                          AppLocalizations.of(context).service3Title,
                          AppLocalizations.of(context).service3Desc,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'assets/images/acil.png',
                          AppLocalizations.of(context).service4Title,
                          AppLocalizations.of(context).service4Desc,
                        ),
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowSpacing: 24,
                    columnSpacing: 16,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'assets/images/banyoyenileme.png',
                          AppLocalizations.of(context).service5Title,
                          AppLocalizations.of(context).service5Desc,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'assets/images/bakım.png',
                          AppLocalizations.of(context).service6Title,
                          AppLocalizations.of(context).service6Desc,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailedServiceCard(
      String imageUrl, String title, String description) {
    return HoverAnimatedWidget(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                height: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                    ? 200
                    : 300,
                width: double.infinity,
                child: customImage(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade200,
                      child: const Icon(
                        Icons.plumbing,
                        size: 64,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                        ? 16
                        : 24,
                vertical: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                    ? 16
                    : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    title,
                    fontSize:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? 18
                            : 20,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2937),
                  ),
                  const SizedBox(height: 8),
                  customText(
                    description,
                    fontSize: 14,
                    color: const Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCTASection() {
    return RepaintBoundary(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
        color: const Color(0xFF2B4B80).withOpacity(0.05),
        child: MaxWidthBox(
          maxWidth: 1000,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ResponsiveRowColumn(
              layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowSpacing: 32,
              columnSpacing: 32,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        AppLocalizations.of(context).readyToRepair,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1F2937),
                      ),
                      const SizedBox(height: 16),
                      customText(
                        AppLocalizations.of(context).readyToRepairSubtitle,
                        fontSize: 16,
                        color: const Color(0xFF6B7280),
                        height: 1.6,
                      ),
                      const SizedBox(height: 24),
                      ResponsiveRowColumn(
                        layout: ResponsiveRowColumnType.ROW,
                        rowSpacing: 16,
                        columnSpacing: 16,
                        children: [
                          ResponsiveRowColumnItem(
                            child: _buildHoverButton(
                              onPressed: () => _scrollToSection('request'),
                              buttonId: 'cta_request',
                              child: customText(
                                AppLocalizations.of(context).requestTechnician,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          ResponsiveRowColumnItem(
                            child: _buildHoverButton(
                              onPressed: () => _launchPhone(),
                              buttonId: 'cta_call',
                              backgroundColor: Colors.white,
                              hoverBackgroundColor: const Color(0xFFF8FAFC),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.phone,
                                      size: 19, color: Color(0xFF2B4B80)),
                                  const SizedBox(width: 8),
                                  customText(
                                    AppLocalizations.of(context).callUsNow,
                                    textAlign: TextAlign.center,
                                    color: const Color(0xFF2B4B80),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Center(
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B4B80).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: const Icon(
                        Icons.build,
                        size: 64,
                        color: Color(0xFF2B4B80),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+905324533802');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  void _launchMail() async {
    final Uri mailUri = Uri(scheme: 'mailto', path: 'demirtopdavut@gmail.com');
    if (await canLaunchUrl(mailUri)) {
      await launchUrl(mailUri);
    }
  }

  void _launchMap() async {
    final Uri googleMapsUri = Uri.parse(
        'https://www.google.com/maps/place/%C3%96z+%C4%B1nan+Yap%C4%B1+Dekorasyon/@41.03001,28.896853,20.89z/data=!4m12!1m5!3m4!2zNDHCsDAxJzQ4LjIiTiAyOMKwNTMnNDguOCJF!8m2!3d41.030057!4d28.896884!3m5!1s0x14cabaf185395f1b:0xea8540998f9db1a3!8m2!3d41.0300617!4d28.8969458!16s%2Fg%2F11c72k6z6b?entry=ttu&g_ep=EgoyMDI1MDcwOS4wIKXMDSoASAFQAw%3D%3D');
    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri);
    }
  }

  Widget _buildRequestSection() {
    return Container(
      key: _requestKey,
      padding: EdgeInsets.symmetric(
        vertical:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 40 : 64,
        horizontal:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 20,
      ),
      color: Colors.white,
      child: MaxWidthBox(
        maxWidth: 800,
        child: Column(
          children: [
            customText(
              AppLocalizations.of(context).needFix,
              fontSize: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 24
                  : 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
            const SizedBox(height: 16),
            customText(
              AppLocalizations.of(context).needFixSubtitle,
              fontSize: 16,
              color: const Color(0xFF6B7280),
              height: 1.6,
            ),
            SizedBox(
              height: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 32
                  : 48,
            ),
            Container(
              padding: EdgeInsets.all(
                ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 20 : 32,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildFormField(
                      controller: _nameController,
                      label: AppLocalizations.of(context).fullName,
                      hintText: AppLocalizations.of(context).enterFullName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 16
                              : 24,
                    ),
                    _buildFormField(
                      controller: _phoneController,
                      label: AppLocalizations.of(context).phoneNumber,
                      hintText: AppLocalizations.of(context).enterPhone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 16
                              : 24,
                    ),
                    _buildFormField(
                      controller: _addressController,
                      label: AppLocalizations.of(context).address,
                      hintText: AppLocalizations.of(context).enterAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 16
                              : 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          AppLocalizations.of(context).typeOfNeed,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1F2937),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: context
                                  .watch<ServiceState>()
                                  .selectedService
                                  .isEmpty
                              ? null
                              : context.watch<ServiceState>().selectedService,
                          hint: customText(
                            AppLocalizations.of(context).selectServiceType,
                            fontSize: 14,
                            color: const Color(0xFF6B7280),
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Color(0xFFD1D5DB)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: Color(0xFF2B4B80), width: 2),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: ResponsiveBreakpoints.of(context)
                                      .smallerThan(TABLET)
                                  ? 12
                                  : 16,
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                                value: 'drain_cleaning',
                                child: customText(AppLocalizations.of(context)
                                    .drainCleaning)),
                            DropdownMenuItem(
                                value: 'bathroom_repair',
                                child: customText(AppLocalizations.of(context)
                                    .bathroomRepair)),
                            DropdownMenuItem(
                                value: 'kitchen_plumbing',
                                child: customText(AppLocalizations.of(context)
                                    .kitchenPlumbing)),
                            DropdownMenuItem(
                                value: 'emergency_service',
                                child: customText(AppLocalizations.of(context)
                                    .emergencyService)),
                            DropdownMenuItem(
                                value: 'bathroom_renovation',
                                child: customText(AppLocalizations.of(context)
                                    .bathroomRenovation)),
                            DropdownMenuItem(
                                value: 'maintenance_service',
                                child: customText(AppLocalizations.of(context)
                                    .maintenanceService)),
                          ],
                          onChanged: (value) {
                            context
                                .read<ServiceState>()
                                .setSelectedService(value ?? '');
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(context)
                                  .selectServiceType;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 16
                              : 24,
                    ),
                    _buildFormField(
                      controller: _notesController,
                      label: AppLocalizations.of(context).additionalNotes,
                      hintText: AppLocalizations.of(context).describeNeeds,
                      maxLines: 4,
                    ),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 24
                              : 32,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: _buildHoverButton(
                        onPressed: _submitForm,
                        buttonId: 'submit_form',
                        child: customText(
                          AppLocalizations.of(context).submitRequest,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
          label,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF1F2937),
        ),
        const SizedBox(height: 8),
        customTextField(
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF1F2937),
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF2B4B80), width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 12
                  : 16,
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Prepare WhatsApp message with form data
      final String message = '''
Ad Soyad: ${_nameController.text}
Telefon: ${_phoneController.text}
Adres: ${_addressController.text}
Hizmet: ${context.watch<ServiceState>().getServiceName(context.watch<ServiceState>().selectedService)}
${_notesController.text.isNotEmpty ? 'Notlar: ${_notesController.text}' : ''}''';

      // Encode message for URL
      final encodedMessage = Uri.encodeComponent(message);

      // Create WhatsApp URL with Turkish phone number
      final whatsappUrl =
          Uri.parse('https://wa.me/905324533802?text=$encodedMessage');

      // Launch WhatsApp
      launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: customText(
            AppLocalizations.of(context).requestSubmitted,
            color: Colors.white,
          ),
          backgroundColor: const Color(0xFF10B981),
        ),
      );

      // Reset form
      _formKey.currentState!.reset();
      _nameController.clear();
      _phoneController.clear();
      _addressController.clear();
      _notesController.clear();
      context.read<ServiceState>().setSelectedService('');
    }
  }

  Widget _buildReviewsSection() {
    return Container(
      key: _reviewsKey,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
      color: const Color(0xFFF9FAFB),
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            customText(
              AppLocalizations.of(context).whatCustomersSay,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
            const SizedBox(height: 16),
            customText(
              AppLocalizations.of(context).customersSaySubtitle,
              fontSize: 16,
              color: const Color(0xFF6B7280),
              height: 1.6,
            ),
            const SizedBox(height: 48),
            ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              columnSpacing: 24,
              children: [
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowSpacing: 24,
                    columnSpacing: 16,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          AppLocalizations.of(context).review1Initials,
                          AppLocalizations.of(context).review1Name,
                          5,
                          AppLocalizations.of(context).review1Text,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          AppLocalizations.of(context).review2Initials,
                          AppLocalizations.of(context).review2Name,
                          4,
                          AppLocalizations.of(context).review2Text,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          AppLocalizations.of(context).review3Initials,
                          AppLocalizations.of(context).review3Name,
                          5,
                          AppLocalizations.of(context).review3Text,
                        ),
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: ResponsiveRowColumn(
                    layout:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? ResponsiveRowColumnType.COLUMN
                            : ResponsiveRowColumnType.ROW,
                    rowSpacing: 24,
                    columnSpacing: 16,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          AppLocalizations.of(context).review4Initials,
                          AppLocalizations.of(context).review4Name,
                          4,
                          AppLocalizations.of(context).review4Text,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          AppLocalizations.of(context).review5Initials,
                          AppLocalizations.of(context).review5Name,
                          4,
                          AppLocalizations.of(context).review5Text,
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          AppLocalizations.of(context).review6Initials,
                          AppLocalizations.of(context).review6Name,
                          5,
                          AppLocalizations.of(context).review6Text,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewCard(
      String initials, String name, int rating, String review) {
    return HoverAnimatedWidget(
      child: RepaintBoundary(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B4B80).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: customText(
                        initials,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF2B4B80),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                          name,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2937),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: List.generate(5, (index) {
                            if (index < rating) {
                              return const Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFFBBF24),
                              );
                            } else {
                              return const Icon(
                                Icons.star_border,
                                size: 16,
                                color: Color(0xFFFBBF24),
                              );
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              customText(
                '"$review"',
                fontSize: 14,
                color: const Color(0xFF6B7280),
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 32 : 48,
        horizontal:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 20,
      ),
      color: const Color(0xFF1F2937),
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              rowSpacing: 32,
              columnSpacing: 32,
              children: [
                ResponsiveRowColumnItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: customImage(
                                'assets/images/logo1.png',
                                height: ResponsiveBreakpoints.of(context)
                                        .smallerThan(TABLET)
                                    ? 80
                                    : 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 16),
                            customText(
                              AppLocalizations.of(context).workingHours,
                              fontSize: 14,
                              color: const Color(0xFF9CA3AF),
                              height: 1.6,
                            ),
                            const SizedBox(height: 12),
                            Wrap(
                              spacing: ResponsiveBreakpoints.of(context)
                                      .smallerThan(TABLET)
                                  ? 3
                                  : 12,
                              runSpacing: 12,
                              children: [
                                _buildSocialButton(Icons.facebook, () {
                                  launchUrl(
                                      mode: LaunchMode.externalApplication,
                                      Uri.parse(
                                          'https://www.facebook.com/ozinanyapi/?locale=tr_TR'));
                                }),
                                _buildSocialButton(Icons.alternate_email, () {
                                  _launchMail();
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customText(
                              AppLocalizations.of(context).quickLinks,
                              textAlign: TextAlign.center,
                              fontSize: ResponsiveBreakpoints.of(context)
                                      .smallerThan(TABLET)
                                  ? 16
                                  : 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 12),
                            _buildFooterLink(AppLocalizations.of(context).home,
                                () => _scrollToSection('home')),
                            _buildFooterLink(
                                AppLocalizations.of(context).services,
                                () => _scrollToSection('services')),
                            _buildFooterLink(
                                AppLocalizations.of(context).requestService,
                                () => _scrollToSection('request')),
                            _buildFooterLink(
                                AppLocalizations.of(context).reviews,
                                () => _scrollToSection('reviews')),
                          ],
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            customText(
                              AppLocalizations.of(context).services,
                              textAlign: TextAlign.center,
                              fontSize: ResponsiveBreakpoints.of(context)
                                      .smallerThan(TABLET)
                                  ? 16
                                  : 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 12),
                            _buildFooterLink(
                                AppLocalizations.of(context).plumbing, () {}),
                            _buildFooterLink(
                                AppLocalizations.of(context).bathroomRenovation,
                                () {}),
                            _buildFooterLink(
                                AppLocalizations.of(context).kitchenRenovation,
                                () {}),
                            _buildFooterLink(
                                AppLocalizations.of(context).waterLeakage,
                                () {}),
                            _buildFooterLink(
                                AppLocalizations.of(context).waterLeakageRepair,
                                () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                        AppLocalizations.of(context).contactUs,
                        fontSize: ResponsiveBreakpoints.of(context)
                                .smallerThan(TABLET)
                            ? 16
                            : 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      _buildContactInfo(Icons.location_on,
                          'Namık Kemal Mah. 10.Sokak No:4/A Esenler/İstanbul'),
                      _buildContactInfo(Icons.phone, '+90 532 453 38 02'),
                      _buildContactInfo(Icons.email, 'demirtopdavut@gmail.com'),
                      _buildContactInfo(Icons.access_time,
                          AppLocalizations.of(context).workingHours),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 24
                  : 32,
            ),
            Container(
              height: 1,
              color: const Color(0xFF374151),
            ),
            const SizedBox(height: 24),
            ResponsiveRowColumn(
              layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
              rowCrossAxisAlignment: CrossAxisAlignment.center,
              columnSpacing: 16,
              children: [
                ResponsiveRowColumnItem(
                  child: customText(
                    AppLocalizations.of(context).allRightsReserved,
                    fontSize: 14,
                    color: const Color(0xFF9CA3AF),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: Wrap(
                    alignment:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? WrapAlignment.center
                            : WrapAlignment.start,
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      _buildFooterLink(
                          AppLocalizations.of(context).privacyPolicy, () {}),
                      _buildFooterLink(
                          AppLocalizations.of(context).termsOfService, () {}),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFF374151),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildFooterLink(String title, VoidCallback onTap) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => context
              .read<HoverState>()
              .setHoveredButton('footer_$title', true)),
          onExit: (_) => setState(() => context
              .read<HoverState>()
              .setHoveredButton('footer_$title', false)),
          child: GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color:
                    context.watch<HoverState>().isHoveredButton('footer_$title')
                        ? Colors.white.withOpacity(0.1)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: customText(
                title,
                textAlign: TextAlign.center,
                fontSize: 14,
                color:
                    context.watch<HoverState>().isHoveredButton('footer_$title')
                        ? Colors.white.withOpacity(0.9)
                        : const Color(0xFF9CA3AF),
                decoration: TextDecoration.none,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.email) {
          _launchMail();
        }
        if (icon == Icons.phone) {
          _launchPhone();
        }
        if (icon == Icons.location_on) {
          _launchMap();
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFFFF7A3D),
              size: 16,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: customText(
                text,
                fontSize: 14,
                color: const Color(0xFF9CA3AF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      key: _heroKey,
      height: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 400 : 850,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://readdy.ai/api/search-image?query=A%20professional%20handyman%20in%20work%20clothes%20fixing%20a%20sink%20in%20a%20modern%20kitchen.%20The%20image%20shows%20the%20handyman%20from%20the%20side%2C%20focused%20on%20his%20work.%20The%20left%20side%20of%20the%20image%20has%20a%20clean%2C%20simple%20background%20that%20gradually%20transitions%20to%20the%20detailed%20scene%20on%20the%20right.%20The%20lighting%20is%20bright%20and%20natural%2C%20creating%20a%20friendly%20and%20trustworthy%20atmosphere.%20The%20color%20palette%20is%20professional%20with%20blues%20and%20whites.&width=1600&height=800&seq=hero1&orientation=landscape',
          ),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF2B4B80),
            Color(0xFF1E3A5F),
            Color(0xFF0F1F2F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(43, 75, 128, 0.85),
              Color.fromRGBO(43, 75, 128, 0.6),
              Color.fromRGBO(43, 75, 128, 0),
            ],
            stops: [0.0, 0.5, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal:
              ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 12,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  AppLocalizations.of(context).heroTitle,
                  fontSize:
                      ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                          ? 28
                          : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
                const SizedBox(height: 16),
                customText(
                  AppLocalizations.of(context).heroSubtitle,
                  fontSize:
                      ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                          ? 16
                          : 20,
                  color: Colors.white,
                  height: 1.5,
                ),
                const SizedBox(height: 32),
                _buildHoverButton(
                  onPressed: () => _scrollToSection('request'),
                  buttonId: 'hero_request',
                  child: customText(
                    AppLocalizations.of(context).requestTechnician,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 40 : 64,
        horizontal:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 20,
      ),
      color: Colors.white,
      child: MaxWidthBox(
        maxWidth: 1200,
        child: ResponsiveRowColumn(
          layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowSpacing: 48,
          columnSpacing: 32,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                    AppLocalizations.of(context).trustedExpertsTitle,
                    fontSize:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? 24
                            : 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                  const SizedBox(height: 24),
                  customText(
                    AppLocalizations.of(context).trustedExpertsDesc1,
                    fontSize: 16,
                    color: const Color(0xFF6B7280),
                    height: 1.6,
                  ),
                  const SizedBox(height: 16),
                  customText(
                    AppLocalizations.of(context).trustedExpertsDesc2,
                    fontSize: 16,
                    color: const Color(0xFF6B7280),
                    height: 1.6,
                  ),
                  const SizedBox(height: 16),
                  customText(
                    AppLocalizations.of(context).trustedExpertsDesc3,
                    fontSize: 16,
                    color: const Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                padding: EdgeInsets.all(
                  ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                      ? 24
                      : 32,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    _buildStatItem(
                        '30+', AppLocalizations.of(context).yearsExperience),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 16
                              : 24,
                    ),
                    _buildStatItem('5,000+',
                        AppLocalizations.of(context).projectsCompleted),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 16
                              : 24,
                    ),
                    _buildStatItem('98%',
                        AppLocalizations.of(context).customerSatisfaction),
                    SizedBox(
                      height:
                          ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                              ? 16
                              : 24,
                    ),
                    _buildStatItem('8.30-20.00',
                        AppLocalizations.of(context).emergencyService),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServicesPreview() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 40 : 64,
        horizontal:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 20,
      ),
      color: const Color(0xFFF9FAFB),
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            customText(
              AppLocalizations.of(context).ourServices,
              fontSize: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 24
                  : 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
            ),
            const SizedBox(height: 16),
            customText(
              AppLocalizations.of(context).servicesSubtitle,
              fontSize: 16,
              color: const Color(0xFF6B7280),
              height: 1.6,
            ),
            SizedBox(
              height: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? 32
                  : 48,
            ),
            ResponsiveRowColumn(
              layout: ResponsiveRowColumnType.COLUMN,
              rowSpacing: 24,
              columnSpacing: 24,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.plumbing,
                    AppLocalizations.of(context).service1Title,
                    AppLocalizations.of(context).service1Desc,
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.bathroom,
                    AppLocalizations.of(context).service2Title,
                    AppLocalizations.of(context).service2Desc,
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.kitchen,
                    AppLocalizations.of(context).service3Title,
                    AppLocalizations.of(context).service3Desc,
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.emergency,
                    AppLocalizations.of(context).service4Title,
                    AppLocalizations.of(context).service4Desc,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => _scrollToSection('services'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                    AppLocalizations.of(context).viewAllServices,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2B4B80),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Color(0xFF2B4B80),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 20,
        horizontal:
            ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 16 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customText(
            value,
            fontSize:
                ResponsiveBreakpoints.of(context).smallerThan(TABLET) ? 28 : 36,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2B4B80),
          ),
          const SizedBox(height: 8),
          customText(
            label,
            fontSize: 14,
            color: const Color(0xFF6B7280),
          ),
        ],
      ),
    );
  }
}

class HoverAnimatedWidget extends StatefulWidget {
  final Widget child;
  final double scale;
  final Duration duration;

  const HoverAnimatedWidget({
    super.key,
    required this.child,
    this.scale = 1.05,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverAnimatedWidget> createState() => _HoverAnimatedWidgetState();
}

class _HoverAnimatedWidgetState extends State<HoverAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _scale = Tween<double>(begin: 1.0, end: widget.scale).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
