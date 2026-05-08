import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfGenerator {
  static Future<void> generateAndPrintReceipt({
    required double amount,
    required String stylistName,
    required DateTime date,
    required String time,
    required String method,
    required String bookingId,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(32),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Text(
                    'Blush & Bliss',
                    style: pw.TextStyle(fontSize: 32, fontWeight: pw.FontWeight.bold, color: PdfColors.pink700),
                  ),
                ),
                pw.SizedBox(height: 24),
                pw.Text('Booking Receipt', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.Divider(),
                pw.SizedBox(height: 16),
                
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Booking ID:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(bookingId),
                  ],
                ),
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Stylist Name:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(stylistName),
                  ],
                ),
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Date & Time:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text('${date.toLocal().toString().split(' ')[0]} at $time'),
                  ],
                ),
                pw.SizedBox(height: 8),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Payment Method:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text(method),
                  ],
                ),
                
                pw.SizedBox(height: 24),
                pw.Divider(),
                pw.SizedBox(height: 8),
                
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Total Amount Paid', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                    pw.Text('Rs. ${amount.toInt()}', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                
                pw.SizedBox(height: 48),
                pw.Center(
                  child: pw.Text('Thank you for choosing Blush & Bliss!', style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
                ),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
      name: 'Receipt_$bookingId',
    );
  }
}
