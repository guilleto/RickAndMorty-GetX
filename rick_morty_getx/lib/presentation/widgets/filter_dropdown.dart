import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/translation_utils.dart';
import '../../domain/entities/translation_types.dart';

class FilterDropdown extends StatelessWidget {
  final String label;
  final RxString selectedValue;
  final TranslationTypes type;
  final Function(String?) onChanged;

  const FilterDropdown({super.key, 
    required this.label,
    required this.selectedValue,
    required this.type,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, String> valueMap = TranslationUtils.getMap(type);

    return Obx(() => InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: selectedValue.value.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => onChanged(null), // Reinicia el filtro
                  )
                : null,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              itemHeight: 48,
              value: valueMap[selectedValue.value],
              items: valueMap.values.map((displayText) {
                return DropdownMenuItem(
                  value: displayText,
                  child: Text(displayText),
                );
              }).toList(),
              onChanged: (selectedEsValue) {
                final reverseMap = valueMap.map((key, value) => MapEntry(value, key));
                onChanged(reverseMap[selectedEsValue]);
              },
            ),
          ),
        ));
  }
}

