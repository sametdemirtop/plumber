# HandyFix - Flutter Web Application

A modern, responsive Flutter web application for HandyFix, a local repair and renovation service company. This project is a complete conversion of an HTML/CSS/JavaScript website into a fully functional Flutter web application.

## Features

- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Modern UI**: Clean, professional design with smooth animations and transitions
- **Interactive Navigation**: Smooth scrolling between sections with animated navigation
- **Service Request Form**: Complete form with validation and submission handling
- **Customer Reviews**: Display of customer testimonials with star ratings
- **Service Showcase**: Detailed service descriptions with images
- **Contact Integration**: Phone and WhatsApp contact options
- **Professional Layout**: Multiple sections including hero, services, testimonials, and footer

## Technologies Used

- **Flutter**: Framework for building the web application
- **Google Fonts**: For typography (Pacifico and Inter fonts)
- **Responsive Framework**: For responsive design across devices
- **URL Launcher**: For phone calls and WhatsApp integration
- **Material Design**: For consistent UI components and styling

## Project Structure

```
handyfix_web/
├── lib/
│   └── main.dart          # Main application file with all widgets
├── assets/
│   ├── images/            # Image assets (currently using external URLs)
│   └── fonts/             # Font files
├── web/                   # Web-specific files
├── pubspec.yaml           # Dependencies and project configuration
└── README.md              # This file
```

## Sections Implemented

### 1. Navigation Bar
- Sticky navigation with brand logo
- Navigation links to different sections
- Call-to-action button
- Responsive mobile menu (planned)

### 2. Hero Section
- Full-screen hero with background image
- Compelling headline and description
- Primary call-to-action button
- Responsive text sizing

### 3. Introduction Section
- Company overview and values
- Statistics display (15+ years, 5000+ projects, etc.)
- Two-column responsive layout

### 4. Services Preview
- Grid of service cards with icons
- Brief service descriptions
- Link to detailed services section

### 5. Detailed Services Section
- Comprehensive service descriptions
- Service images from external API
- Special pricing mentions
- Responsive card layout

### 6. Call-to-Action Section
- Prominent request form promotion
- Contact options (phone and request form)
- Eye-catching design with shadow effects

### 7. Request Form Section
- Complete contact form with validation
- Dropdown for service selection
- Form submission handling
- WhatsApp contact option

### 8. Reviews Section
- Customer testimonials
- Star rating display
- Customer avatars with initials
- Grid layout for reviews

### 9. Footer
- Company information and branding
- Quick links navigation
- Service links
- Contact information
- Social media placeholders
- Copyright and legal links

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  google_fonts: ^6.1.0
  url_launcher: ^6.2.2
  responsive_framework: ^1.1.1
```

## Installation and Setup

1. **Clone the repository** (if applicable):
   ```bash
   git clone <repository-url>
   cd handyfix_web
   ```

2. **Install Flutter dependencies**:
   ```bash
   flutter pub get
   ```

3. **Enable web support** (if not already enabled):
   ```bash
   flutter config --enable-web
   ```

4. **Run the application**:
   ```bash
   flutter run -d chrome
   ```

## Running the Application

### Development Mode
```bash
flutter run -d chrome
```

### Production Build
```bash
flutter build web
```

The built files will be in the `build/web` directory and can be deployed to any web hosting service.

## Customization

### Colors
The app uses a custom color scheme defined in the theme:
- Primary: `#2B4B80` (Blue)
- Secondary: `#FF7A3D` (Orange)

### Fonts
- **Pacifico**: Used for the brand logo
- **Inter**: Used for all body text and headings

### Images
Currently using external image URLs. To use local images:
1. Add images to `assets/images/` folder
2. Update `pubspec.yaml` to include the assets
3. Replace network image URLs with local asset paths

## Key Features Implemented

1. **Responsive Design**: Adapts to different screen sizes using ResponsiveFramework
2. **Form Validation**: Complete form validation with error messages
3. **Navigation**: Smooth scrolling to different sections
4. **External Links**: Phone and WhatsApp integration
5. **Interactive Elements**: Hover effects and button animations
6. **Professional Layout**: Clean, modern design matching the original HTML

## Future Enhancements

1. **Mobile Navigation**: Implement hamburger menu for mobile
2. **Animation**: Add more sophisticated animations and transitions
3. **Backend Integration**: Connect form to actual backend service
4. **SEO Optimization**: Add meta tags and structured data
5. **Performance**: Optimize images and implement caching
6. **Accessibility**: Add ARIA labels and keyboard navigation
7. **Multi-language**: Add internationalization support

## Browser Support

The application is optimized for modern web browsers:
- Chrome (recommended)
- Firefox
- Safari
- Edge

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is created for educational/demonstration purposes. Please ensure you have the right to use any images or content when deploying to production.

## Contact

For questions or support regarding this Flutter implementation, please contact the development team.

---

**Note**: This is a complete Flutter web application conversion of the original HTML HandyFix website, featuring responsive design, interactive elements, and modern Flutter best practices.
