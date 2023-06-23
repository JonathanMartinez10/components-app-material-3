import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String name = 'counter';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final clickCounter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }, 
            icon: Icon(isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined)          
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickCounter',style: const TextStyle(fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}