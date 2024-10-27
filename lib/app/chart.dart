import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ModelMetrics {
  final String name;
  final double accuracy;
  final double precision;
  final double recall;
  final double f1Score;

  ModelMetrics(this.name, this.accuracy, this.precision, this.recall, this.f1Score);
}

class ChartScreen extends StatelessWidget {
  final List<ModelMetrics> models = [
    ModelMetrics('Model 1', 0.85, 0.80, 0.75, 0.77),
    ModelMetrics('Model 2', 0.90, 0.85, 0.80, 0.82),
    ModelMetrics('Model 3', 0.88, 0.82, 0.78, 0.80),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        title: const ChartTitle(text: 'Model Performance Metrics'),
        legend: const Legend(isVisible: true, position: LegendPosition.bottom),
        primaryXAxis: const CategoryAxis(
          title: AxisTitle(text: 'Models'),
        ),
        primaryYAxis: const NumericAxis(
          title: AxisTitle(text: 'Percentage'),
          minimum: 0,
          maximum: 100,
          interval: 10,
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          // Accuracy Bar Series
          BarSeries<ModelMetrics, String>(
            dataSource: models,
            xValueMapper: (ModelMetrics model, _) => model.name,
            yValueMapper: (ModelMetrics model, _) => model.accuracy * 100,
            name: 'Accuracy',
            color: const Color.fromARGB(255, 189, 92, 140),
          ),
          // Precision Bar Series
          BarSeries<ModelMetrics, String>(
            dataSource: models,
            xValueMapper: (ModelMetrics model, _) => model.name,
            yValueMapper: (ModelMetrics model, _) => model.precision * 100,
            name: 'Precision',
            color: const Color.fromARGB(255, 139, 209, 109),
          ),
          // Recall Bar Series
          BarSeries<ModelMetrics, String>(
            dataSource: models,
            xValueMapper: (ModelMetrics model, _) => model.name,
            yValueMapper: (ModelMetrics model, _) => model.recall * 100,
            name: 'Recall',
            color: const Color.fromARGB(255, 220, 94, 21),
          ),
          // F1 Score Bar Series
          BarSeries<ModelMetrics, String>(
            dataSource: models,
            xValueMapper: (ModelMetrics model, _) => model.name,
            yValueMapper: (ModelMetrics model, _) => model.f1Score * 100,
            name: 'F1 Score',
            color: const Color.fromARGB(255, 70, 140, 205),
          ),
        ],
      ),
    );
  }
}
