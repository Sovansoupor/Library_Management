import 'package:booking_management/models/appTheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class BorrowScreen extends StatefulWidget {
  final String bookTitle;
  final Function onSuccess;
  final bool isReservation;

  const BorrowScreen({
    super.key,
    required this.bookTitle,
    required this.onSuccess,
    required this.isReservation,
  });

  @override
  State<BorrowScreen> createState() => _BorrowScreenState();
}

class _BorrowScreenState extends State<BorrowScreen> {
  DateTime? _pickupDate;
  int _borrowDays = 1;
  bool _isLoading = false; // For loading indicator

  // Calendar
  void _pickDate() async {
    if (!widget.isReservation) {
      DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)),
      );

      if (selectedDate != null) {
        setState(() {
          _pickupDate = selectedDate;
        });
      }
    } else {
      // Automatically set the pickup date to today for reservations
      setState(() {
        _pickupDate = DateTime.now();
      });
    }
  }

  // Confirmation and Successful Messages
  void _confirmAction() async {
    if (!widget.isReservation && _pickupDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a pickup date.")),
      );
      return;
    }

    // Show confirmation dialog
    final bool? confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Borrow"),
          content: Text(
            "Title: ${widget.bookTitle}\n\nBorrow for: $_borrowDays day(s)",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Cancel
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // Confirm
              child: const Text(
                "Confirm",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );

    if (confirm != true) return; // Exit if not confirmed

    // Show loading indicator
    setState(() {
      _isLoading = true;
    });

    // Handle the action (reservation or borrowing)
    bool success;
    if (widget.isReservation) {
      success = await createReservation(widget.bookTitle);
    } else {
      success =
          await createBorrowing(widget.bookTitle, _pickupDate!, _borrowDays);
    }

    // Hide loading indicator
    setState(() {
      _isLoading = false;
    });

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.isReservation
                ? "Successfully reserved '${widget.bookTitle}'."
                : "Successfully borrowed '${widget.bookTitle}' for $_borrowDays day(s) starting from ${DateFormat('dd/MM/yyyy').format(_pickupDate!)}.",
          ),
        ),
      );
      widget.onSuccess(); // Notify parent widget
      Navigator.of(context).popUntil((route) => route.isFirst); 
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Failed to complete the action. Please try again.")),
      );
    }
  }

  // Return Date Display
 DateTime? get returnDate {
  if (_pickupDate != null) {
    return _pickupDate!.add(Duration(days: _borrowDays));
  }
  return null;
}

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: TColors.primary,
      appBar: AppBar(
        title: Text(widget.isReservation ? "Reserve Book" : "Borrow Book",
            style: TColors.titleStyle),
        backgroundColor: TColors.secondary,
      ),
      body: Stack(
        children: [
          Align(
        alignment: Alignment.topCenter,
            child: Container(
              width: media.width,
              height: media.width * 0.8,
              decoration: BoxDecoration(
                color: TColors.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(media.width * 0.079),
                  bottomRight: Radius.circular(media.width * 0.079),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.bookTitle,
                   style: TColors.titleStyle.copyWith(
                letterSpacing: -0.7, // Reduce space between letters
                height: 1.2, // Adjust line height (line spacing)
              ),),
                const SizedBox(height: 20),
                if (!widget.isReservation)
                  ListTile(
                    title: const Text("Pickup Date:"),
                    subtitle: Text(
                      _pickupDate != null
                          ? DateFormat('dd/MM/yyyy').format(_pickupDate!)
                          : "No date selected",
                    ),
                    trailing: OutlinedButton.icon(
                      onPressed: _pickDate,
                      icon: const Icon(Icons.calendar_month_outlined, color: Colors.black,),
                      label: Text("Select Date", style: TColors.captionStyle),
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text("Borrow Days:",style: TColors.captionStyle),
                    const SizedBox(width: 10),
                    DropdownButton<int>(
                      value: _borrowDays,
                      items: List.generate(14, (index) => index + 1)
                          .map((days) => DropdownMenuItem(
                              value: days, child: Text("$days day(s)")))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _borrowDays = value!;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 5),
                if (returnDate != null)
                  Text(
                    "Return Date: ${DateFormat('dd/MM/yyyy').format(returnDate!)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                const SizedBox(height: 20),
                Center(
                  child: OutlinedButton(
                    onPressed: _confirmAction,
                    child: Text(widget.isReservation
                        ? "Confirm Reservation"
                        : "Confirm Borrow" , style: TColors.captionStyle),
                  ),
                ),
              ],
            ),
          ),
          
          if (_isLoading)
            Container(
              color: Colors.black45,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

// DateTime Formatter using intl package
extension DateTimeFormatter on DateTime {
  String toShortDateString() {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}

// Simulated createReservation function
Future<bool> createReservation(String bookTitle) async {
  await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
  return true; // Indicate success
}

// Simulated createBorrowing function
Future<bool> createBorrowing(
    String bookTitle, DateTime pickupDate, int borrowDays) async {
  await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
  return true; // Indicate success
}
