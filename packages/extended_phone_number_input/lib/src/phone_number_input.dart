import 'package:extended_phone_number_input/src/consts/enums.dart';
import 'package:extended_phone_number_input/src/consts/strings_consts.dart';
import 'package:extended_phone_number_input/src/models/country.dart';
import 'package:extended_phone_number_input/src/phone_number_controller.dart';
import 'package:extended_phone_number_input/src/widgets/country_code_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberInput extends StatefulWidget {
  final PhoneNumberInputController? controller;
  final String? initialValue;
  final String? initialCountry;
  final List<String>? excludedCountries;
  final List<String>? includedCountries;
  final bool allowPickFromContacts;
  final Widget? pickContactIcon;
  final void Function(String)? onChanged;
  final String? hint;
  final TextStyle? hintStyle;
  final bool showSelectedFlag;
  final InputBorder? border;
  final String locale;
  final String? searchHint;
  final bool allowSearch;
  final CountryListMode countryListMode;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final ContactsPickerPosition contactsPickerPosition;
  final String? errorText;
  final String? Function(String?)? validator;

  const PhoneNumberInput({
    Key? key,
    this.controller,
    this.onChanged,
    this.initialValue,
    this.initialCountry,
    this.excludedCountries,
    this.allowPickFromContacts = true,
    this.pickContactIcon,
    this.includedCountries,
    this.hint,
    this.showSelectedFlag = true,
    this.border,
    this.locale = 'en',
    this.searchHint,
    this.allowSearch = true,
    this.countryListMode = CountryListMode.bottomSheet,
    this.enabledBorder,
    this.focusedBorder,
    this.contactsPickerPosition = ContactsPickerPosition.suffix,
    this.errorText,
    this.hintStyle,
    this.validator,
    this.errorBorder,
  }) : super(key: key);

  @override
  State<PhoneNumberInput> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<PhoneNumberInput> {
  late PhoneNumberInputController _phoneNumberInputController;
  late TextEditingController _phoneNumberTextFieldController;
  late Future _initFuture;
  Country? _selectedCountry;

  @override
  void initState() {
    if (widget.controller == null) {
      _phoneNumberInputController = PhoneNumberInputController(
        context,
      );
    } else {
      _phoneNumberInputController = widget.controller!;
    }
    _initFuture = _init();
    _phoneNumberInputController.addListener(_refresh);
    _phoneNumberTextFieldController = TextEditingController();
    super.initState();
  }

  Future _init() async {
    await _phoneNumberInputController.init(
        initialCountryCode: widget.initialCountry,
        excludeCountries: widget.excludedCountries,
        includeCountries: widget.includedCountries,
        initialPhoneNumber: widget.initialValue,
        errorText: widget.errorText,
        locale: widget.locale);
  }

  void _refresh() {
    _phoneNumberTextFieldController.value = TextEditingValue(
        text: _phoneNumberInputController.phoneNumber,
        selection: TextSelection(
            baseOffset: _phoneNumberInputController.phoneNumber.length,
            extentOffset: _phoneNumberInputController.phoneNumber.length));

    setState(() {
      _selectedCountry = _phoneNumberInputController.selectedCountry;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(_phoneNumberInputController.fullPhoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initFuture,
        builder: (context, snapshot) {
          return Column(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: TextFormField(
                  validator: widget.validator,
                  controller: _phoneNumberTextFieldController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                    FilteringTextInputFormatter.allow(kNumberRegex),
                  ],
                  onChanged: (v) {
                    _phoneNumberInputController.innerPhoneNumber = v;
                  },
                  keyboardType: TextInputType.phone,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: widget.hint,
                    border: widget.border,
                    hintStyle: widget.hintStyle ??
                        const TextStyle(color: Color(0xFFB6B6B6)),
                    enabledBorder: widget.enabledBorder,
                    focusedBorder: widget.focusedBorder,
                    errorBorder: widget.errorBorder,
                    errorStyle: const TextStyle(color: Colors.red),
                    suffixIcon: Visibility(
                      visible: widget.allowPickFromContacts &&
                          widget.contactsPickerPosition ==
                              ContactsPickerPosition.suffix,
                      child: widget.pickContactIcon == null
                          ? IconButton(
                              onPressed:
                                  _phoneNumberInputController.pickFromContacts,
                              icon: Icon(
                                Icons.contact_phone,
                                color: Theme.of(context).primaryColor,
                              ))
                          : InkWell(
                              onTap:
                                  _phoneNumberInputController.pickFromContacts,
                              child: widget.pickContactIcon,
                            ),
                    ),
                    prefixIcon: InkWell(
                      onTap: _openCountryList,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            if (_selectedCountry != null &&
                                widget.showSelectedFlag)
                              Image.asset(
                                _selectedCountry!.flagPath,
                                height: 20,
                              ),
                            const SizedBox(
                              width: 8,
                            ),
                            if (_selectedCountry != null)
                              Text(_selectedCountry!.dialCode,
                                  style: const TextStyle(
                                      color: Color(0xFF2A3E4E),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(Icons.expand_more,
                                color: Color(0xFF2A3E4E)),
                            Container(
                              height: 40,
                              width: 1,
                              color: const Color(0xFFEDF1F4),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                  visible: widget.allowPickFromContacts &&
                      widget.contactsPickerPosition ==
                          ContactsPickerPosition.bottom,
                  child: widget.pickContactIcon == null
                      ? IconButton(
                          onPressed:
                              _phoneNumberInputController.pickFromContacts,
                          icon: Icon(
                            Icons.contact_phone,
                            color: Theme.of(context).primaryColor,
                          ))
                      : InkWell(
                          onTap: _phoneNumberInputController.pickFromContacts,
                          child: widget.pickContactIcon,
                        )),
            ],
          );
        });
  }

  void _openCountryList() {
    switch (widget.countryListMode) {
      case CountryListMode.bottomSheet:
        showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            enableDrag: true,
            context: context,
            builder: (_) => SizedBox(
                  height: 500,
                  child: CountryCodeList(
                      searchHint: widget.searchHint,
                      allowSearch: widget.allowSearch,
                      phoneNumberInputController: _phoneNumberInputController),
                ));
        break;
      case CountryListMode.dialog:
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: SizedBox(
                    width: double.maxFinite,
                    child: CountryCodeList(
                        searchHint: widget.searchHint,
                        allowSearch: widget.allowSearch,
                        phoneNumberInputController:
                            _phoneNumberInputController),
                  ),
                ));
        break;
    }
  }
}
