import 'package:flutter/material.dart';

void main() {
  runApp(const InvestimentoApp());
}

class InvestimentoApp extends StatelessWidget {
  const InvestimentoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Investimento',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    DashboardPage(),
    AddInvestmentPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Início'),
          NavigationDestination(icon: Icon(Icons.add_circle_outline), selectedIcon: Icon(Icons.add_circle), label: 'Investir'),
          NavigationDestination(icon: Icon(Icons.history), label: 'Histórico'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Meu Investimento', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text('Acompanhe seus investimentos em um só lugar.',
              style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(height: 24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Saldo investido', style: TextStyle(fontSize: 15)),
                  SizedBox(height: 8),
                  Text('MZN 0,00', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Ainda não há investimentos registrados.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              Expanded(child: SummaryCard(title: 'Lucro', value: 'MZN 0,00', icon: Icons.trending_up)),
              SizedBox(width: 12),
              Expanded(child: SummaryCard(title: 'Investimentos', value: '0', icon: Icons.account_balance_wallet)),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Aviso', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Este aplicativo serve para acompanhar e organizar investimentos. '
                'Ele não garante lucros nem prevê resultados futuros.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const SummaryCard({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: 10),
            Text(title),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class AddInvestmentPage extends StatelessWidget {
  const AddInvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Adicionar investimento', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          TextField(decoration: const InputDecoration(labelText: 'Nome do investimento', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Valor (MZN)', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'Tipo', border: OutlineInputBorder()),
            items: const [
              DropdownMenuItem(value: 'Poupança', child: Text('Poupança')),
              DropdownMenuItem(value: 'Ações', child: Text('Ações')),
              DropdownMenuItem(value: 'Cripto', child: Text('Cripto')),
              DropdownMenuItem(value: 'Outro', child: Text('Outro')),
            ],
            onChanged: (_) {},
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('Guardar investimento'),
          ),
        ],
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Histórico', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Nenhum registro ainda'),
              subtitle: const Text('Os investimentos adicionados aparecerão aqui.'),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Meu perfil', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          const CircleAvatar(radius: 42, child: Icon(Icons.person, size: 42)),
          const SizedBox(height: 16),
          const Center(child: Text('Meu perfil', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          const SizedBox(height: 24),
          const ListTile(leading: Icon(Icons.lock_outline), title: Text('Segurança'), subtitle: Text('Proteção do aplicativo')),
          const ListTile(leading: Icon(Icons.settings_outlined), title: Text('Configurações')),
          const ListTile(leading: Icon(Icons.help_outline), title: Text('Ajuda')),
        ],
      ),
    );
  }
}
