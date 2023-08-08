import 'package:intl/intl.dart';

class MessageItem {
  final String MessageTitle;
  final String MessageDescription;

  MessageItem({
    required this.MessageDescription,
    required this.MessageTitle,
  });
}

List<MessageItem> MessageList = [
  MessageItem(
    MessageDescription: '  We are looking for enthusiastic volunteers to join our tree planting drive next weekend. ',
    MessageTitle: 'Call for Volunteers:',
  ),
  MessageItem(
    MessageDescription: ' Please join us for the orientation session this Friday at 4 PM in the auditorium',
    MessageTitle: 'New Volunteer Orientation:',
  ),
  MessageItem(
    MessageDescription: 'Dear volunteers, a reminder about the upcoming community cleanup event this Saturday at 9 AM.',
    MessageTitle: 'Event Reminder:',
  ),
  MessageItem(
    MessageDescription: 'Attention Volunteers, due to unforeseen circumstances, workshop scheduled for tomorrow has been rescheduled to next week.',
    MessageTitle: 'Important Announcement:',
  ),
];
