import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String? _selectedType;

  void _selectType(String type) {
    setState(() {
      _selectedType = type;
    });
  }

  void _onNext() {
    if (_selectedType == null) return;

    // TODO: Store the selected type (e.g. in provider or Supabase)
    // Navigate to next onboarding screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => const Placeholder(), // Replace with next onboarding page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> types = [
      {'label': 'Couple', 'icon': Icons.favorite_border, 'value': 'couple'},
      {
        'label': 'Friend group',
        'icon': Icons.group_outlined,
        'value': 'friends',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              const Text(
                "Who are you\nplanning with?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ...types.map((type) {
                final isSelected = _selectedType == type['value'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: GestureDetector(
                    onTap: () => _selectType(type['value'] as String),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:
                              isSelected ? Colors.blue : Colors.grey.shade300,
                          width: 2,
                        ),
                        color:
                            isSelected
                                ? Colors.blue.withOpacity(0.1)
                                : Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            type['icon'] as IconData,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            type['label'] as String,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedType == null ? null : _onNext,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Next", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
