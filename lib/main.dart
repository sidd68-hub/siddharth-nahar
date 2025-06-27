import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0A0A0A),
      ),
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _skillsController;
  late AnimationController _projectsController;
  late Animation<double> _headerAnimation;
  late Animation<double> _skillsAnimation;
  late Animation<double> _projectsAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _startAnimations();
  }

  void _initAnimations() {
    _headerController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _skillsController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _projectsController = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );

    _headerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _headerController, curve: Curves.easeOutBack),
    );
    _skillsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _skillsController, curve: Curves.elasticOut),
    );
    _projectsAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _projectsController, curve: Curves.bounceOut),
    );
  }

  void _startAnimations() {
    _headerController.forward();
    Future.delayed(Duration(milliseconds: 500), () {
      _skillsController.forward();
    });
    Future.delayed(Duration(milliseconds: 1000), () {
      _projectsController.forward();
    });
  }

  @override
  void dispose() {
    _headerController.dispose();
    _skillsController.dispose();
    _projectsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildAboutSection(),
            _buildExperienceSection(),
            _buildSkillsSection(),
            _buildProjectsSection(),
            _buildContactSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return AnimatedBuilder(
      animation: _headerAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _headerAnimation.value,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1E3A8A),
                  Color(0xFF3B82F6),
                  Color(0xFF06B6D4),
                ],
              ),
            ),
            child: Stack(
              children: [
                // Animated background particles
                ...List.generate(20, (index) => _buildFloatingParticle(index)),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.blue.shade400, Colors.cyan.shade300],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.code,
                          size: 100,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Senior Flutter Developer',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white30),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          '4+ Years Experience',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFloatingParticle(int index) {
    return AnimatedBuilder(
      animation: _headerController,
      builder: (context, child) {
        return Positioned(
          left: (index * 50.0) % MediaQuery.of(context).size.width,
          top: (index * 80.0) % MediaQuery.of(context).size.height,
          child: Transform.translate(
            offset: Offset(
              50 * _headerAnimation.value * (index % 2 == 0 ? 1 : -1),
              30 * _headerAnimation.value,
            ),
            child: Container(
              width: 4 + (index % 8),
              height: 4 + (index % 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: EdgeInsets.all(40),
      color: Color(0xFF111111),
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Passionate Flutter developer with 4+ years of experience building high-quality mobile applications. I specialize in creating beautiful, performant, and user-friendly apps using the latest Flutter technologies and best practices.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection() {
    return Container(
      padding: EdgeInsets.all(40),
      color: Color(0xFF0A0A0A),
      child: Column(
        children: [
          Text(
            'Professional Experience',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 40),
          _buildExperienceCard(
            'Senior Flutter Developer',
            'Tech Solutions Inc.',
            '2022 - Present',
            'Led development of 5+ mobile applications with 100K+ downloads each.',
          ),
          SizedBox(height: 20),
          _buildExperienceCard(
            'Flutter Developer',
            'Mobile Innovations Ltd.',
            '2021 - 2022',
            'Developed and maintained multiple Flutter applications for various clients.',
          ),
          SizedBox(height: 20),
          _buildExperienceCard(
            'Junior Flutter Developer',
            'StartUp Ventures',
            '2020 - 2021',
            'Built my first production Flutter apps and learned advanced development practices.',
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(String title, String company, String period, String description) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E293B), Color(0xFF334155)],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            company,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue.shade300,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Text(
            period,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
            ),
          ),
          SizedBox(height: 15),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return AnimatedBuilder(
      animation: _skillsAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _skillsAnimation.value,
          child: Container(
            padding: EdgeInsets.all(40),
            color: Color(0xFF111111),
            child: Column(
              children: [
                Text(
                  'Flutter Libraries & Skills',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    _buildSkillChip('Flutter SDK'),
                    _buildSkillChip('Dart'),
                    _buildSkillChip('Provider'),
                    _buildSkillChip('Bloc/Cubit'),
                    _buildSkillChip('GetX'),
                    _buildSkillChip('Dio'),
                    _buildSkillChip('Firebase'),
                    _buildSkillChip('Hive'),
                    _buildSkillChip('SQLite'),
                    _buildSkillChip('Shared Preferences'),
                    _buildSkillChip('Google Maps'),
                    _buildSkillChip('Camera'),
                    _buildSkillChip('Push Notifications'),
                    _buildSkillChip('REST APIs'),
                    _buildSkillChip('JSON Serialization'),
                    _buildSkillChip('Flutter Web'),
                    _buildSkillChip('Material Design'),
                    _buildSkillChip('Cupertino'),
                    _buildSkillChip('Custom Animations'),
                    _buildSkillChip('CI/CD'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.cyan.shade400],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return AnimatedBuilder(
      animation: _projectsAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - _projectsAnimation.value)),
          child: Opacity(
            opacity: _projectsAnimation.value,
            child: Container(
              padding: EdgeInsets.all(40),
              color: Color(0xFF0A0A0A),
              child: Column(
                children: [
                  Text(
                    'Featured Projects',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        return Row(
                          children: [
                            Expanded(child: _buildProjectCard(0)),
                            SizedBox(width: 20),
                            Expanded(child: _buildProjectCard(1)),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _buildProjectCard(0),
                            SizedBox(height: 20),
                            _buildProjectCard(1),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        return Row(
                          children: [
                            Expanded(child: _buildProjectCard(2)),
                            SizedBox(width: 20),
                            Expanded(child: _buildProjectCard(3)),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _buildProjectCard(2),
                            SizedBox(height: 20),
                            _buildProjectCard(3),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectCard(int index) {
    final projects = [
      {
        'title': 'E-Commerce Mobile App',
        'description': 'Full-featured shopping app with payment integration, user authentication, and real-time notifications.',
        'tech': 'Flutter, Firebase, Stripe, Provider',
        'link': 'https://github.com/yourname/ecommerce-app',
      },
      {
        'title': 'Social Media Platform',
        'description': 'Instagram-like social media app with photo sharing, stories, and real-time messaging.',
        'tech': 'Flutter, Firebase, GetX, Camera',
        'link': 'https://github.com/yourname/social-app',
      },
      {
        'title': 'Food Delivery App',
        'description': 'Multi-restaurant food ordering app with GPS tracking, payment gateway, and rating system.',
        'tech': 'Flutter, Google Maps, Bloc, Dio',
        'link': 'https://github.com/yourname/food-delivery',
      },
      {
        'title': 'Fitness Tracking App',
        'description': 'Comprehensive fitness app with workout plans, progress tracking, and health metrics.',
        'tech': 'Flutter, Hive, Charts, Health Kit',
        'link': 'https://github.com/yourname/fitness-app',
      },
    ];

    final project = projects[index];

    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1E293B), Color(0xFF334155)],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.mobile_friendly, color: Colors.blue.shade300, size: 30),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  project['title']!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            project['description']!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
              height: 1.4,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Technologies: ${project['tech']}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue.shade300,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () => _launchURL(project['link']!),
            icon: Icon(Icons.open_in_new),
            label: Text('View Project'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF111111), Color(0xFF1E293B)],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Ready to build something amazing together?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildContactButton(
                Icons.email,
                'Email',
                'mailto:your.email@gmail.com',
              ),
              _buildContactButton(
                Icons.code,
                'GitHub',
                'https://github.com/yourusername',
              ),
              _buildContactButton(
                Icons.work,
                'LinkedIn',
                'https://linkedin.com/in/yourprofile',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(IconData icon, String label, String url) {
    return ElevatedButton.icon(
      onPressed: () => _launchURL(url),
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.blue.shade300),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}