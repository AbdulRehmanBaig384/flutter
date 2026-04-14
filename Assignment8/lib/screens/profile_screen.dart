import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: mockUser.name);
  final _idController = TextEditingController(text: mockUser.studentId);
  String _department = mockUser.department;
  String _gender = 'Male';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _idController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile updated successfully')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Student Account', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6),
          const Text('Alex Harrison', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          const Text('Computer Science & Engineering · Class of 2025', style: TextStyle(color: Color(0xFF94A3B8))),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(color: const Color(0xFF111827), borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: const [
                Icon(Icons.verified, color: Color(0xFF60A5FA)),
                SizedBox(width: 10),
                Text('Verified Student', style: TextStyle(color: Color(0xFF60A5FA), fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF1D4ED8),
            labelColor: Colors.white,
            unselectedLabelColor: const Color(0xFF94A3B8),
            tabs: const [Tab(text: 'Personal Info'), Tab(text: 'Settings')],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProfileForm(),
                _buildSettingsPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(controller: _nameController, label: 'Full Name'),
            const SizedBox(height: 14),
            _buildTextField(controller: _idController, label: 'Student ID'),
            const SizedBox(height: 14),
            DropdownButtonFormField<String>(
              value: _department,
              decoration: const InputDecoration(
                labelText: 'Department Selection',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
              ),
              items: const [
                DropdownMenuItem(value: 'Computer Science & Engineering', child: Text('Computer Science & Engineering')),
                DropdownMenuItem(value: 'Business Administration', child: Text('Business Administration')),
                DropdownMenuItem(value: 'Design & Media', child: Text('Design & Media')),
              ],
              onChanged: (value) {
                if (value != null) setState(() => _department = value);
              },
            ),
            const SizedBox(height: 16),
            const Text('Gender Selection', style: TextStyle(color: Color(0xFF94A3B8), fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value ?? _gender),
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value ?? _gender),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('Non-binary'),
                    value: 'Non-binary',
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value ?? _gender),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 18),
            const Text('Profile Strength', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: 0.85, color: const Color(0xFF1D4ED8), backgroundColor: const Color(0xFF334155), minHeight: 10),
            const SizedBox(height: 10),
            const Text('85% complete your profile to unlock premium marketplace features and campus discounts.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D4ED8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Save Changes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsPanel() {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        ListTile(
          title: Text('Notifications'),
          subtitle: Text('Manage your notifications preferences'),
          trailing: Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ),
        ListTile(
          title: Text('Privacy'),
          subtitle: Text('Review privacy settings'),
          trailing: Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ),
        ListTile(
          title: Text('Security'),
          subtitle: Text('Change password & verify account'),
          trailing: Icon(Icons.chevron_right, color: Color(0xFF94A3B8)),
        ),
      ],
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String label}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      ),
      validator: (value) => value == null || value.isEmpty ? 'Enter $label' : null,
    );
  }
}
