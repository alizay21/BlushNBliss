import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/app_colors.dart';
import '../../widgets/organic_blob_background.dart';
import '../../providers/auth_provider.dart';
import '../main_wrapper.dart';
import 'forgot_password_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final auth = Provider.of<AppAuthProvider>(context, listen: false);
      if (isLogin) {
        await auth.login(_emailCtrl.text, _passCtrl.text);
      } else {
        await auth.signup('User', _phoneCtrl.text, _emailCtrl.text, _passCtrl.text);
      }
      
      if (mounted && auth.isAuthenticated) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainWrapper()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final auth = Provider.of<AppAuthProvider>(context);

    return Scaffold(
      body: OrganicBlobBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: AppColors.mutedMauve),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 40),
              // Main Card
              Card(
                color: AppColors.dustyRose.withOpacity(0.4),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Toggle Tabs
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isLogin = true),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: isLogin ? Colors.white : AppColors.mutedMauve.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: theme.titleLarge?.copyWith(
                                        color: isLogin ? AppColors.textPrimary : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() => isLogin = false),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  decoration: BoxDecoration(
                                    color: !isLogin ? Colors.white : AppColors.mutedMauve.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Sign-up',
                                      style: theme.titleLarge?.copyWith(
                                        color: !isLogin ? AppColors.textPrimary : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        
                        if (!isLogin) ...[
                          TextFormField(
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(hintText: 'Phone Number', filled: true, fillColor: Colors.white),
                            validator: (v) => v!.isEmpty ? 'Enter phone number' : null,
                          ),
                          const SizedBox(height: 16),
                        ],

                        TextFormField(
                          controller: _emailCtrl,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(hintText: 'Email', filled: true, fillColor: Colors.white),
                          validator: (v) => v!.isEmpty ? 'Enter email' : (!v.contains('@') ? 'Invalid email' : null),
                        ),
                        const SizedBox(height: 16),
                        
                        TextFormField(
                          controller: _passCtrl,
                          obscureText: true,
                          decoration: const InputDecoration(hintText: 'Password', filled: true, fillColor: Colors.white),
                          validator: (v) => v!.isEmpty ? 'Enter password' : null,
                        ),
                        
                        if (!isLogin) ...[
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _confirmPassCtrl,
                            obscureText: true,
                            decoration: const InputDecoration(hintText: 'Confirm Password', filled: true, fillColor: Colors.white),
                            validator: (v) => v != _passCtrl.text ? 'Passwords do not match' : null,
                          ),
                        ],
                        
                        if (isLogin) ...[
                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: theme.bodyMedium?.copyWith(
                                  color: AppColors.mutedMauve,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ] else ...[
                          const SizedBox(height: 24),
                        ],
                        
                        const SizedBox(height: 8),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: auth.isLoading ? null : _submit,
                            child: auth.isLoading 
                              ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white))
                              : Text(isLogin ? 'Login' : 'Sign-up'),
                          ),
                        ),
                      ],
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
}
