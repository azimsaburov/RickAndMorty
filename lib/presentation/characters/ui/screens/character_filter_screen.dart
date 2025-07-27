import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty/constants/icon_paths.dart';
import 'package:rick_and_morty/domain/extensions/character_status_extension.dart';
import 'package:rick_and_morty/domain/extensions/gender_extension.dart';
import 'package:rick_and_morty/domain/models/character_entity.dart';
import 'package:rick_and_morty/presentation/characters/ui/bloc/filter_cubit/filter_cubit.dart';

class CharacterFilterScreen extends StatefulWidget {
  const CharacterFilterScreen({super.key});

  @override
  State<CharacterFilterScreen> createState() => _CharacterFilterScreenState();
}

class _CharacterFilterScreenState extends State<CharacterFilterScreen> {
  CharacterStatus? selectStatus;
  Gender? selectGender;
  FilterCubit get filterCubit => context.read<FilterCubit>();

  @override
  void initState() {
    selectGender = filterCubit.state.selectGender;
    selectStatus = filterCubit.state.selectStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        filterCubit.updateFilters(
          selectGender: selectGender,
          selectStatus: selectStatus,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Фильтры"),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  selectGender = null;
                  selectStatus = null;
                });
              },
              icon: SvgPicture.asset(IconPaths.clearFilter),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Статус',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              ...List.generate(CharacterStatus.values.length, (index) {
                final CharacterStatus status = CharacterStatus.values[index];
                return ListTile(
                  onTap: () => _onStatusChanged(status),
                  contentPadding: EdgeInsets.zero,
                  leading: Radio<CharacterStatus>(
                    value: status,
                    onChanged: _onStatusChanged,
                    groupValue: selectStatus,
                  ),
                  title: Text(
                    status.text,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }),
              Divider(height: 40),
              Text(
                "ПОЛ",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              ...List.generate(Gender.values.length, (index) {
                final Gender gender = Gender.values[index];
                return ListTile(
                  onTap: () => _onGenderChanged(gender),
                  contentPadding: EdgeInsets.zero,
                  leading: Radio<Gender>(
                    value: gender,
                    onChanged: _onGenderChanged,
                    groupValue: selectGender,
                  ),
                  title: Text(
                    gender.text,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _onStatusChanged(value) {
    setState(() {
      selectStatus = value;
    });
  }

  void _onGenderChanged(value) {
    setState(() {
      selectGender = value;
    });
  }
}
