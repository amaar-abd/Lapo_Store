import 'package:equatable/equatable.dart';

class ProductSpecsEntity extends Equatable {
  final String cpu;
  final String gpu;
  final String ram;
  final String storage;
  final String screen;
  final String battery;

  const ProductSpecsEntity({
    required this.cpu,
    required this.gpu,
    required this.ram,
    required this.storage,
    required this.screen,
    required this.battery,
  });

  @override
  List<Object?> get props => [cpu, gpu, ram, storage, screen, battery];
}
