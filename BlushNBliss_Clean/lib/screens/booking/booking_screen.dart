import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../constants/app_colors.dart';
import '../../models/market_models.dart';
import 'payment_screen.dart'; // To be added

class BookingScreen extends StatefulWidget {
  final StylistModel stylist;

  const BookingScreen({Key? key, required this.stylist}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  String _selectedTime = "10:00 AM";
  bool _isHomeService = true;
  final _addressCtrl = TextEditingController();
  final _instructCtrl = TextEditingController();

  final List<String> _timeSlots = [
    "09:00 AM", "10:00 AM", "11:00 AM", "01:00 PM",
    "02:00 PM", "04:00 PM", "05:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    // For demo purposes, fetch service price by assuming primary service
    final price = 3500; // Mock price

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: theme.titleLarge?.copyWith(color: AppColors.textPrimary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(backgroundColor: AppColors.warmBeige, radius: 24, child: const Icon(Icons.person, color: Colors.white)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.stylist.name, style: theme.titleLarge),
                    Text(widget.stylist.specialty, style: theme.bodyMedium),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Date Picker (TableCalendar)
            Text('Select Date', style: theme.titleLarge),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.dustyRose.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.now().add(const Duration(days: 60)),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
                calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(color: AppColors.mutedMauve, shape: BoxShape.circle),
                  todayDecoration: BoxDecoration(color: AppColors.dustyRose, shape: BoxShape.circle),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Time Slots
            Text('Select Time', style: theme.titleLarge),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: _timeSlots.map((time) {
                final isSelected = time == _selectedTime;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTime = time),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.mutedMauve : Colors.white,
                      border: Border.all(color: isSelected ? AppColors.mutedMauve : AppColors.dustyRose),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      time,
                      style: theme.bodyMedium?.copyWith(
                        color: isSelected ? Colors.white : AppColors.textPrimary,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            // Location Toggle
            Text('Service Location', style: theme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Home'),
                    value: true,
                    groupValue: _isHomeService,
                    activeColor: AppColors.mutedMauve,
                    onChanged: (val) => setState(() => _isHomeService = val!),
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    title: const Text('Salon'),
                    value: false,
                    groupValue: _isHomeService,
                    activeColor: AppColors.mutedMauve,
                    onChanged: (val) => setState(() => _isHomeService = val!),
                  ),
                ),
              ],
            ),
            
            if (_isHomeService) ...[
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressCtrl,
                decoration: const InputDecoration(
                  hintText: 'Enter full address (e.g. DHA Phase 5, Lahore)',
                ),
              ),
            ],
            
            const SizedBox(height: 16),
            TextFormField(
              controller: _instructCtrl,
              decoration: const InputDecoration(hintText: 'Special Instructions (optional)'),
              maxLines: 2,
            ),
            const SizedBox(height: 32),

            // Price Summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColors.warmBeige.withOpacity(0.3), borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price', style: theme.titleLarge),
                  Text('Rs. $price', style: theme.headlineMedium?.copyWith(color: AppColors.mutedMauve)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Proceed Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PaymentScreen(
                      amount: price.toDouble(),
                      stylist: widget.stylist,
                      date: _selectedDay ?? DateTime.now(),
                      time: _selectedTime,
                    )),
                  );
                },
                child: const Text('Proceed to Payment'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
