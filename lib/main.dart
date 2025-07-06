import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'providers/locale_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LocaleProvider(),
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
          title: 'HandyFix - Reliable Local Repair & Renovation Services',
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
            textTheme: GoogleFonts.interTextTheme(),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  String _selectedService = '';

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
    // Implementation for smooth scrolling to sections
    double offset = 0;
    switch (sectionId) {
      case 'services':
        offset = 1000;
        break;
      case 'request':
        offset = 2000;
        break;
      case 'reviews':
        offset = 3000;
        break;
    }
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SingleChildScrollView(
        controller: _scrollController,
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: ResponsiveRowColumn(
        layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            child: Text(
              'HandyFix',
              style: GoogleFonts.pacifico(
                fontSize: 28,
                color: const Color(0xFF2B4B80),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ResponsiveRowColumnItem(
            child: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                ? const SizedBox()
                : Row(
                    children: [
                      _buildNavItem(AppLocalizations.of(context).home,
                          () => _scrollToSection('home')),
                      _buildNavItem(AppLocalizations.of(context).services,
                          () => _scrollToSection('services')),
                      _buildNavItem(AppLocalizations.of(context).requestService,
                          () => _scrollToSection('request')),
                      _buildNavItem(AppLocalizations.of(context).reviews,
                          () => _scrollToSection('reviews')),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () => _scrollToSection('request'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7A3D),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context).requestTechnician,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {
                          context.read<LocaleProvider>().toggleLocale();
                        },
                        icon: Text(
                          context
                              .watch<LocaleProvider>()
                              .locale
                              .languageCode
                              .toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B4B80),
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

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F2937),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://readdy.ai/api/search-image?query=A%20professional%20handyman%20in%20work%20clothes%20fixing%20a%20sink%20in%20a%20modern%20kitchen.%20The%20image%20shows%20the%20handyman%20from%20the%20side%2C%20focused%20on%20his%20work.%20The%20left%20side%20of%20the%20image%20has%20a%20clean%2C%20simple%20background%20that%20gradually%20transitions%20to%20the%20detailed%20scene%20on%20the%20right.%20The%20lighting%20is%20bright%20and%20natural%2C%20creating%20a%20friendly%20and%20trustworthy%20atmosphere.%20The%20color%20palette%20is%20professional%20with%20blues%20and%20whites.&width=1600&height=800&seq=hero1&orientation=landscape',
          ),
          fit: BoxFit.cover,
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).heroTitle,
                  style: TextStyle(
                    fontSize:
                        ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                            ? 32
                            : 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).heroSubtitle,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => _scrollToSection('request'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7A3D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: Text(
                    AppLocalizations.of(context).requestTechnician,
                    style: const TextStyle(fontWeight: FontWeight.w600),
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
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
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
                  Text(
                    AppLocalizations.of(context).trustedExpertsTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppLocalizations.of(context).trustedExpertsDesc1,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context).trustedExpertsDesc2,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context).trustedExpertsDesc3,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 1,
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatItem('15+',
                              AppLocalizations.of(context).yearsExperience),
                        ),
                        Expanded(
                          child: _buildStatItem('5,000+',
                              AppLocalizations.of(context).projectsCompleted),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatItem(
                              '98%',
                              AppLocalizations.of(context)
                                  .customerSatisfaction),
                        ),
                        Expanded(
                          child: _buildStatItem('24/7',
                              AppLocalizations.of(context).emergencyService),
                        ),
                      ],
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

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B4B80),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF6B7280),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildServicesPreview() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
      color: const Color(0xFFF9FAFB),
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).ourServices,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).servicesSubtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ResponsiveRowColumn(
              layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowSpacing: 24,
              columnSpacing: 16,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.brush,
                    'Painting',
                    'Interior and exterior painting services with premium finishes and colors.',
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.plumbing,
                    'Plumbing',
                    'Fix leaky faucets, clogged drains, toilet repairs, and more.',
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.electrical_services,
                    'Electrical',
                    'Outlet installation, lighting fixtures, wiring repairs and upgrades.',
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: _buildServiceCard(
                    Icons.grid_view,
                    'Tiling',
                    'Tile installation and repair for floors, walls, backsplashes and more.',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => _scrollToSection('services'),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'View all services',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B4B80),
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
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

  Widget _buildServiceCard(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
      color: Colors.white,
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).whatWeCanHelp,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).whatWeCanHelpSubtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
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
                        child: _buildDetailedServiceCard(
                          'https://readdy.ai/api/search-image?query=Interior%20painting%20of%20a%20modern%20living%20room%20with%20bright%20natural%20light.%20A%20professional%20painter%20carefully%20applying%20paint%20to%20a%20wall%20with%20a%20roller.%20The%20scene%20shows%20clean%20drop%20cloths%20protecting%20the%20floor%2C%20and%20a%20neat%20paint%20tray%20setup.%20The%20image%20has%20a%20bright%2C%20clean%20aesthetic%20with%20soft%20neutral%20colors.&width=600&height=400&seq=service1&orientation=landscape',
                          'Interior & Exterior Painting',
                          'Professional painting services for walls, ceilings, trim, and exteriors with premium paints and finishes.',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'https://readdy.ai/api/search-image?query=Close-up%20of%20a%20professional%20tile%20installer%20laying%20ceramic%20floor%20tiles%20in%20a%20modern%20bathroom.%20The%20image%20shows%20precise%20tile%20placement%20with%20spacers%2C%20a%20level%2C%20and%20tile%20cutting%20tools%20nearby.%20The%20scene%20depicts%20a%20clean%20work%20environment%20with%20organized%20materials.%20The%20lighting%20is%20bright%20and%20natural%2C%20highlighting%20the%20quality%20of%20workmanship.&width=600&height=400&seq=service2&orientation=landscape',
                          'Tiling and Ceramic Flooring',
                          'Expert installation and repair of ceramic, porcelain, and natural stone tiles for floors, walls, and backsplashes.',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'https://readdy.ai/api/search-image?query=A%20professional%20plumber%20fixing%20a%20bathroom%20sink%20faucet.%20The%20image%20shows%20the%20plumbers%20hands%20working%20with%20tools%20under%20the%20sink%20cabinet.%20Plumbing%20tools%20are%20neatly%20arranged%20nearby.%20The%20bathroom%20has%20modern%20fixtures%20and%20good%20lighting.%20The%20scene%20conveys%20professional%20expertise%20and%20attention%20to%20detail.&width=600&height=400&seq=service3&orientation=landscape',
                          'Minor Plumbing',
                          'Repair and replacement of faucets, toilets, sinks, and drains. We fix leaks, clogs, and other common plumbing issues.',
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
                          'https://readdy.ai/api/search-image?query=A%20close-up%20view%20of%20a%20handyman%20repairing%20a%20wooden%20door%20frame%20in%20a%20residential%20home.%20The%20image%20shows%20detailed%20carpentry%20work%20with%20wood%20repair%20tools%20visible.%20The%20lighting%20is%20bright%20and%20natural%2C%20highlighting%20the%20craftsmanship.%20The%20scene%20depicts%20a%20professional%20working%20environment%20with%20attention%20to%20detail.&width=600&height=400&seq=service4&orientation=landscape',
                          'Door and Window Repair',
                          'Fix sticking doors, broken windows, damaged frames, hardware replacement, and weatherstripping installation.',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'https://readdy.ai/api/search-image?query=An%20electrician%20installing%20a%20new%20light%20fixture%20in%20a%20modern%20home%20ceiling.%20The%20image%20shows%20the%20electrician%20on%20a%20ladder%2C%20carefully%20connecting%20wires.%20Safety%20equipment%20and%20electrical%20tools%20are%20visible%20nearby.%20The%20room%20is%20well-lit%20with%20natural%20light%2C%20showing%20a%20professional%20work%20environment%20with%20attention%20to%20safety%20protocols.&width=600&height=400&seq=service5&orientation=landscape',
                          'Electrical Fixes',
                          'Installation and repair of outlets, switches, light fixtures, ceiling fans, and minor electrical troubleshooting.',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildDetailedServiceCard(
                          'https://readdy.ai/api/search-image?query=A%20landscaper%20repairing%20a%20garden%20pathway%20in%20a%20well-maintained%20backyard.%20The%20image%20shows%20the%20professional%20laying%20pavers%20or%20stones%20to%20create%20a%20beautiful%20walkway.%20Garden%20tools%20and%20materials%20are%20neatly%20organized%20nearby.%20The%20scene%20is%20bright%20with%20natural%20sunlight%2C%20showing%20lush%20greenery%20and%20flowers%20surrounding%20the%20work%20area.&width=600&height=400&seq=service6&orientation=landscape',
                          'Garden and Exterior Repairs',
                          'Fence repair, deck maintenance, garden structures, pathway installation, and general exterior improvements.',
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image,
                      size: 64,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F2937),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Special pricing available if materials are purchased from us.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9CA3AF),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCTASection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
      color: const Color(0xFF2B4B80).withOpacity(0.05),
      child: MaxWidthBox(
        maxWidth: 1000,
        child: Container(
          padding: const EdgeInsets.all(48),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
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
                    Text(
                      AppLocalizations.of(context).readyToRepair,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context).readyToRepairSubtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6B7280),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ResponsiveRowColumn(
                      layout:
                          ResponsiveBreakpoints.of(context).smallerThan(MOBILE)
                              ? ResponsiveRowColumnType.COLUMN
                              : ResponsiveRowColumnType.ROW,
                      rowSpacing: 16,
                      columnSpacing: 16,
                      children: [
                        ResponsiveRowColumnItem(
                          child: ElevatedButton(
                            onPressed: () => _scrollToSection('request'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF7A3D),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Request a Technician',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        ResponsiveRowColumnItem(
                          child: OutlinedButton.icon(
                            onPressed: () => _launchPhone(),
                            icon: const Icon(Icons.phone),
                            label: Text(AppLocalizations.of(context).callUsNow),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF2B4B80),
                              side: const BorderSide(color: Color(0xFF2B4B80)),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
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
    );
  }

  void _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '+15551234567');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Widget _buildRequestSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
      color: Colors.white,
      child: MaxWidthBox(
        maxWidth: 800,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).needFix,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).needFixSubtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(32),
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
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).typeOfNeed,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: _selectedService.isEmpty
                              ? null
                              : _selectedService,
                          hint: Text(
                              AppLocalizations.of(context).selectServiceType),
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
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                                value: 'painting',
                                child: Text(
                                    AppLocalizations.of(context).painting)),
                            DropdownMenuItem(
                                value: 'plumbing',
                                child: Text(
                                    AppLocalizations.of(context).plumbing)),
                            DropdownMenuItem(
                                value: 'electrical',
                                child: Text(
                                    AppLocalizations.of(context).electrical)),
                            DropdownMenuItem(
                                value: 'tiling',
                                child:
                                    Text(AppLocalizations.of(context).tiling)),
                            DropdownMenuItem(
                                value: 'doors-windows',
                                child: Text(
                                    AppLocalizations.of(context).doorsWindows)),
                            DropdownMenuItem(
                                value: 'garden',
                                child: Text(AppLocalizations.of(context)
                                    .gardenExterior)),
                            DropdownMenuItem(
                                value: 'other',
                                child:
                                    Text(AppLocalizations.of(context).other)),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedService = value ?? '';
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a service type';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildFormField(
                      controller: _notesController,
                      label: AppLocalizations.of(context).additionalNotes,
                      hintText: AppLocalizations.of(context).describeNeeds,
                      maxLines: 4,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7A3D),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context).submitRequest,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => _launchWhatsApp(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.chat,
                    color: Color(0xFF25D366),
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalizations.of(context).whatsappChat,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2B4B80),
                    ),
                  ),
                ],
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
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF2B4B80), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Thank you for your request! We will contact you shortly to schedule your service.'),
          backgroundColor: Color(0xFF10B981),
        ),
      );

      // Reset form
      _formKey.currentState!.reset();
      _nameController.clear();
      _phoneController.clear();
      _addressController.clear();
      _notesController.clear();
      setState(() {
        _selectedService = '';
      });
    }
  }

  void _launchWhatsApp() async {
    final Uri whatsAppUri = Uri.parse('https://wa.me/15551234567');
    if (await canLaunchUrl(whatsAppUri)) {
      await launchUrl(whatsAppUri);
    }
  }

  Widget _buildReviewsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 20),
      color: const Color(0xFFF9FAFB),
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).whatCustomersSay,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context).customersSaySubtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
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
                          'JD',
                          'James Davidson',
                          5,
                          'We had our bathroom tiles redone by the HandyFix team – amazing job, fast and clean! The technician was professional and completed the work ahead of schedule. Will definitely use them again.',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          'SL',
                          'Sarah Livingston',
                          4,
                          'Great service, very responsive and affordable. I had several electrical issues in my home that needed fixing, and the technician was knowledgeable and efficient. Everything works perfectly now!',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          'MR',
                          'Michael Rodriguez',
                          5,
                          'I needed my living room and kitchen painted on short notice. HandyFix came through with excellent service. The painters were meticulous, and the finish looks fantastic. Highly recommend!',
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
                          'ET',
                          'Emily Thompson',
                          4,
                          'Had a persistent plumbing issue that two other companies couldn\'t fix. The HandyFix technician identified the problem immediately and fixed it in under an hour. Fair pricing and excellent communication throughout.',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          'RB',
                          'Robert Bennett',
                          4,
                          'The garden repair work HandyFix did for us exceeded our expectations. They fixed our damaged fence, repaired the garden pathway, and even helped with some landscaping. Professional service from start to finish.',
                        ),
                      ),
                      ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: _buildReviewCard(
                          'AK',
                          'Amanda Keller',
                          5,
                          'I\'ve used HandyFix for multiple projects in my home over the past year. Their team is always punctual, professional, and does quality work. The pricing is transparent with no surprises. They\'re now my go-to for all home repairs.',
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
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
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
                  child: Text(
                    initials,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B4B80),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
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
          Text(
            '"$review"',
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      color: const Color(0xFF1F2937),
      child: MaxWidthBox(
        maxWidth: 1200,
        child: Column(
          children: [
            ResponsiveRowColumn(
              layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowSpacing: 32,
              columnSpacing: 32,
              children: [
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HandyFix',
                        style: GoogleFonts.pacifico(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Your trusted local repair and renovation service since 2010. Quality workmanship guaranteed.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF9CA3AF),
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          _buildSocialButton(Icons.facebook, () {}),
                          const SizedBox(width: 12),
                          _buildSocialButton(Icons.camera_alt, () {}),
                          const SizedBox(width: 12),
                          _buildSocialButton(Icons.alternate_email, () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Quick Links',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildFooterLink('Home', () => _scrollToSection('home')),
                      _buildFooterLink(
                          'Services', () => _scrollToSection('services')),
                      _buildFooterLink(
                          'Request Service', () => _scrollToSection('request')),
                      _buildFooterLink(
                          'Reviews', () => _scrollToSection('reviews')),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Services',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildFooterLink(
                          AppLocalizations.of(context).plumbing, () {}),
                      _buildFooterLink(
                          AppLocalizations.of(context).bathroomRenovation,
                          () {}),
                      _buildFooterLink(
                          AppLocalizations.of(context).kitchenRenovation,
                          () {}),
                      _buildFooterLink(
                          AppLocalizations.of(context).waterLeakage, () {}),
                      _buildFooterLink(
                          AppLocalizations.of(context).waterLeakageRepair,
                          () {}),
                    ],
                  ),
                ),
                ResponsiveRowColumnItem(
                  rowFlex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact Us',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildContactInfo(Icons.location_on,
                          'Namık Kemal Mah. 10.Sokak No:4/A Esenler/İstanbul'),
                      _buildContactInfo(Icons.phone, '(532) 453 38 02'),
                      _buildContactInfo(Icons.email, 'info@handyfix.com'),
                      _buildContactInfo(
                          Icons.access_time, 'Mon-Sat: 8.30AM - 8PM'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
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
                const ResponsiveRowColumnItem(
                  child: Text(
                    '© 2025 Özinan Yapı Malzemeleri. All rights reserved.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ),
                ResponsiveRowColumnItem(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildFooterLink('Privacy Policy', () {}),
                      const SizedBox(width: 16),
                      _buildFooterLink('Terms of Service', () {}),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF9CA3AF),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
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
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF9CA3AF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
