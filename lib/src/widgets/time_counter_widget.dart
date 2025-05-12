import 'dart:async';
import 'package:flutter/material.dart';

class TimeCounterWidget extends StatefulWidget {
  final DateTime pastDate;
  const TimeCounterWidget({super.key, required this.pastDate});

  @override
  _TimeCounterWidgetState createState() => _TimeCounterWidgetState();
}

class _TimeCounterWidgetState extends State<TimeCounterWidget> {
  late Timer _timer;
  String _formattedTime = "";

  @override
  void initState() {
    super.initState();
    _updateTime(); // Atualiza imediatamente ao iniciar
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    setState(() {
      _formattedTime = formatTimeDifference(widget.pastDate);
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancela o timer ao sair da tela
    super.dispose();
  }

  String formatTimeDifference(DateTime pastDate) {
    final now = DateTime.now();

    int years = now.year - pastDate.year;
    int months = now.month - pastDate.month;
    int days = now.day - pastDate.day;
    int hours = now.hour - pastDate.hour;
    int minutes = now.minute - pastDate.minute;
    int seconds = now.second - pastDate.second;

    // Ajuste para meses negativos
    if (months < 0) {
      years -= 1;
      months += 12;
    }

    // Ajuste para dias negativos
    if (days < 0) {
      final lastMonth = DateTime(now.year, now.month, 0);
      days += lastMonth.day;
      months -= 1;
    }

    // Ajuste para horas, minutos e segundos negativos
    if (hours < 0) {
      hours += 24;
      days -= 1;
    }
    if (minutes < 0) {
      minutes += 60;
      hours -= 1;
    }
    if (seconds < 0) {
      seconds += 60;
      minutes -= 1;
    }

    return "Contando ($years anos $months meses $days dias)  ($hours hrs $minutes min $seconds seg)";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
    );
  }
}
