import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key, Key? keys});

  @override
  // ignore: library_private_types_in_public_api
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeValues _selectedRange = const RangeValues(0, 1000);
  final TextEditingController _minAmountController = TextEditingController();
  final TextEditingController _maxAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _minAmountController.text = _selectedRange.start.toString();
    _maxAmountController.text = _selectedRange.end.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Existing filter categories
            _buildFilterCategory('Brand', ['All', 'Apple', 'Google', 'Samsung']),
            _buildFilterCategory('Ram', ['All', '64 GB', '128 GB', '256 GB']),
            _buildFilterCategory('Storage', ['All', 'Like New', 'Excellent', 'Good']),
            _buildFilterCategory('Conditions', ['All', 'Seller Warranty']),
            _buildFilterCategory('Warranty', ['All', 'Brand Warranty', 'Seller Warranty']),
            _buildFilterCategory('Verification', ['All','Verified']),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            const Text(
              'Price Range',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RangeSlider(
              activeColor: const Color.fromARGB(255, 44, 46, 67),
              inactiveColor: Colors.grey[300],
              values: _selectedRange,
              min: 0,
              max: 1000,
              divisions: 100,
              labels: RangeLabels(
                _selectedRange.start.toStringAsFixed(0),
                _selectedRange.end.toStringAsFixed(0),
              ),
              onChanged: (values) {
                setState(() {
                  _selectedRange = values;
                  _minAmountController.text = values.start.toString();
                  _maxAmountController.text = values.end.toString();
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _minAmountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Min Amount'),
                    onChanged: (value) {
                      double parsedValue = double.tryParse(value) ?? 0;
                      setState(() {
                        _selectedRange = RangeValues(parsedValue, _selectedRange.end);
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _maxAmountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Max Amount'),
                    onChanged: (value) {
                      double parsedValue = double.tryParse(value) ?? 0;
                      setState(() {
                        _selectedRange = RangeValues(_selectedRange.start, parsedValue);
                      });
                    },
                  ),
                ),
              ],
            ),
             ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 44, 46, 67)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Apply Filters', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
   Widget _buildFilterCategory(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) => _buildFilterOption(option)).toList(),
        ),
        const Divider(),
      ],
    );
  }

  Widget _buildFilterOption(String option) {
    return FilterChip(
      label: Text(option),
      onSelected: (selected) {
      },
    );
  }
}

void showFilterPage(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return Container(
            color: Colors.transparent,
            child: const FilterPage(),
          );
        },
      );
    },
  );
}
