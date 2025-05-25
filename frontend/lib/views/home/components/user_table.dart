import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../controllers/home_controller.dart';

class UserTable extends ConsumerWidget {
  const UserTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final usersAsync = ref.watch(usersProvider);

    return usersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text(
          'Failed to load users ${error}',
          style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.error),
        ),
      ),
      data: (users) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: DataTable(
              decoration: BoxDecoration(
                border: Border.all(
                  color: theme.colorScheme.outline.withOpacity(0.1),
                  width: 1,
                ),
              ),
              headingRowColor: WidgetStateProperty.resolveWith<Color>(
                    (states) => theme.colorScheme.primary.withOpacity(0.05),
              ),
              columns: [
                DataColumn(
                  label: Text(
                    'ID',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'NAME',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'EMAIL',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ACTIONS',
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
              rows: users.map((user) {
                return DataRow(
                  cells: [
                    DataCell(
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          user.id.substring(0, 8),
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        user.name,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DataCell(
                      Text(
                        user.email,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.edit_outlined,
                              size: 20,
                              color: theme.colorScheme.primary,
                            ),
                            onPressed: () {
                              // Edit action
                            },
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: theme.colorScheme.error,
                            ),
                            onPressed: () {
                              // Delete action
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
              dataRowMinHeight: 60,
              dataRowMaxHeight: 60,
              dividerThickness: 0.5,
              headingTextStyle: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              horizontalMargin: 24,
              columnSpacing: 24,
            ),
          ),
        ),
      ),
    );
  }
}