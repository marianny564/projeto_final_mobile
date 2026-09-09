import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lêBrasil',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFDFF6FF),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '../assets/images/Logo_Principal.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            // Nome do aplicativo
            const Text(
              'lêBrasil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'FredokaOne',
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppInfo {
  final String nome;
  final String descricao;
  final IconData icone;

  const AppInfo({
    required this.nome,
    required this.descricao,
    required this.icone,
  });
}

final List<AppInfo> meusApps=[
  AppInfo(
    nome: 'Calculadora de Gasolina',
    descricao: 'Calcula litros e custo de uma viagem',
    icone: Icons.local_gas_station,
  ),
  AppInfo(
    nome: 'Calculadora de Churrasco',
    descricao: 'Calcula carne, bebida e carvão',
    icone: Icons.outdoor_grill,
  ),
];


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "lêBrasil",
          style: TextStyle(
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:BoxDecoration(
                color: Theme.of(context).colorScheme.primary, 
              ),
              child: const Align(
                alignment: AlignmentGeometry.bottomLeft,
                child: Text(
                  'Central de Apps',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () => Navigator.pop(context),
            ), 
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => Navigator.pop(context),
            ), 
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Sair'),
              onTap: () => Navigator.pop(context),
            ), 
          ]
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDDF4FF),
              Color(0xFFA1E5FF),
            ],
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.95,
          ),
          itemCount: meusApps.length,
          itemBuilder: (context, indice){
            final app = meusApps[indice];
            return Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      app.icone,
                      size: 36,
                      color: Theme.of(context).colorScheme.primary,
                    
                    ),
                    SizedBox(height: 16),
                    Text(
                      app.nome,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      app.descricao,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11,
                      )
                      ),
                  ],
                ), 
              )
            );
          },
        ),
      ),
    );
  }
}
