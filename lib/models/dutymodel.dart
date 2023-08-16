import 'package:intl/intl.dart';

class dutyItem {
  final String dutyTitle;
  final String dutyDescription;
  final String dutyDate;

  dutyItem({
    required this.dutyDescription,
    required this.dutyTitle,
    required this.dutyDate,
  });
}

List<dutyItem> dutyList = [
  dutyItem(
    dutyDate: DateFormat('yyyy-MM-dd').format(DateTime(2024, 4, 21)),
    dutyDescription: ' Plant Tree once in a Year',
    dutyTitle: 'Tree Tag',
  ),
  dutyItem(
    dutyDate: DateFormat('yyyy-MM-dd').format(DateTime(2024, 4, 21)),
    dutyDescription: 'Donate Blood by yourself ,or inspire friends to donate  ',
    dutyTitle: 'Blood Donation',
  ),
  dutyItem(
    dutyDate: DateFormat('yyyy-MM-dd').format(DateTime(2024, 4, 21)),
    dutyDescription: 'Be an help to those who need books to read',
    dutyTitle: 'Book Donation',
  ),
  dutyItem(
    dutyDate: DateFormat('yyyy-MM-dd').format(DateTime(2024, 4, 21)),
    dutyDescription: 'Be a part of Palliative with what you can',
    dutyTitle: 'SIP Fund',
  ),
];
