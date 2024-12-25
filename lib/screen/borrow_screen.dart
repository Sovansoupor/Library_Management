import 'package:booking_management/models/app_theme.dart';
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
  bool _isLoading = false;

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
      setState(() {
        _pickupDate = DateTime.now();
      });
    }
  }

  void _confirmAction() async {
    if (!widget.isReservation && _pickupDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a pickup date.")),
      );
      return;
    }

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
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                "Confirm",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    setState(() {
      _isLoading = true;
    });

    bool success;
    if (widget.isReservation) {
      success = await createReservation(widget.bookTitle);
    } else {
      success = await createBorrowing(widget.bookTitle, _pickupDate!, _borrowDays);
    }

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
      widget.onSuccess();
      Navigator.of(context).pop(); 
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to complete the action. Please try again.")),
      );
    }
  }

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
      appBar: AppBar(
        title: Text(widget.isReservation ? "Reserve Book" : "Borrow Book", style: TColors.titleStyle),
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
                    letterSpacing: -0.7, 
                    height: 1.2, 
                  ),
                ),
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
                      icon: const Icon(Icons.calendar_month_outlined, color: Colors.black),
                      label: Text("Select Date", style: TColors.captionStyle),
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text("Borrow Days:", style: TColors.captionStyle),
                    const SizedBox(width: 10),
                    DropdownButton<int>(
                      value: _borrowDays,
                      items: List.generate(14, (index) => index + 1)
                          .map((days) => DropdownMenuItem(value: days, child: Text("$days day(s)")))
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
                    child: Text(
                        widget.isReservation
                            ? "Confirm Reservation"
                            : "Confirm Borrow",
                        style: TColors.captionStyle),
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


Future<bool> createReservation(String bookTitle) async {
  await Future.delayed(const Duration(seconds: 1)); 
  return true; 
}


Future<bool> createBorrowing(String bookTitle, DateTime pickupDate, int borrowDays) async {
  await Future.delayed(const Duration(seconds: 1)); 
  return true; 
}