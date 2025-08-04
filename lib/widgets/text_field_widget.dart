import 'package:intl/intl.dart';
import 'package:wbid/constents/decoration_constents.dart';
import 'package:wbid/constents/text_style_constents.dart';
import 'package:wbid/widgets/material_widget.dart';
import 'package:flutter/material.dart';
import 'package:wbid/constents/constents.dart';

// -------------------------------------normal Text field widget--------------------------------------------------

class NormalTextFieldWidget extends StatefulWidget {
  const NormalTextFieldWidget(
      {Key? key,
      this.tNameField,
      this.hintText,
      this.validator,
      this.textFieldController})
      : super(key: key);

  final TypeNameOfField? tNameField;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController? textFieldController;

  @override
  State<NormalTextFieldWidget> createState() => _NormalTextFieldWidgetState();
}

class _NormalTextFieldWidgetState extends State<NormalTextFieldWidget> {
  TextInputType _tInputType = TextInputType.text;

  String _hText = 'Enter Your User Name';
  IconData _iconn = Icons.person;

  void check() {
    if (widget.tNameField == TypeNameOfField.email) {
      _tInputType = TextInputType.emailAddress;
      _hText = 'Enter Your Email';
      _iconn = Icons.email;
    } else if (widget.tNameField == TypeNameOfField.phoneNumber) {
      _tInputType = TextInputType.phone;
      _hText = 'Enter Your Phone Number';
      _iconn = Icons.phone;
    } else if (widget.tNameField == TypeNameOfField.bankAccount) {
      _hText = 'Enter Bank Account';
    } else if (widget.tNameField == TypeNameOfField.text) {
      _hText = widget.hintText!;
      _iconn = Icons.text_fields;
    }
  }

  @override
  Widget build(BuildContext context) {
    check();
    return MaterialWidget(
      materialChild: TextFormField(
        controller: widget.textFieldController,
        keyboardType: _tInputType,
        decoration: textFieldDecoration.copyWith(
          hintText: _hText,
          prefixIcon: Icon(_iconn),
        ),
        style: f18BlackTextStyle,
        validator: widget.validator,
      ),
    );
  }
}

//-------------------------------- password text field widget ------------------------------------------

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({
    Key? key,
    this.validator,
    this.textFieldController,
    this.tNameField,
  }) : super(key: key);

  final TypeNameOfField? tNameField;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textFieldController;

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _isPasswordVisible = true;
  String? _hText;

  void _check() {
    if (widget.tNameField == TypeNameOfField.password) {
      _hText = 'Enter Your Password';
    } else if (widget.tNameField == TypeNameOfField.passwordBandkAccount) {
      _hText = 'Enter Bank Account Password';
    }
  }

  @override
  void initState() {
    _check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      materialChild: TextFormField(
        controller: widget.textFieldController,
        obscureText: _isPasswordVisible,
        keyboardType: TextInputType.visiblePassword,
        decoration: passwordFieldDecoration.copyWith(
          hintText: _hText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            icon: _isPasswordVisible
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
        ),
        style: f18BlackTextStyle,
        validator: widget.validator,
      ),
    );
  }
}
//------------------------------------------------------

class DataTimeTextFieldWidget extends StatefulWidget {
  const DataTimeTextFieldWidget(
      {Key? key, this.labelText, this.textFieldController, this.timeOrDate})
      : super(key: key);

  final String? labelText;
  final TextEditingController? textFieldController;
  final TimeOrDate? timeOrDate;

  @override
  State<DataTimeTextFieldWidget> createState() =>
      _DataTimeTextFieldWidgetState();
}

class _DataTimeTextFieldWidgetState extends State<DataTimeTextFieldWidget> {
  void _theDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 2),
      firstDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 30),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        widget.textFieldController!.text = formattedDate;
      });
    }
  }

  void _theTimePicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
      setState(() {
        widget.textFieldController!.text = formattedTime;
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialWidget(
      materialChild: TextFormField(
        controller: widget.textFieldController,
        decoration: dataTimeTextFieldDecoration.copyWith(
          labelText: widget.labelText,
        ),
        style: f18BlackTextStyle,
        readOnly: true,
        onTap: () {
          (widget.timeOrDate == TimeOrDate.date)
              ? _theDatePicker()
              : _theTimePicker();
        },
      ),
    );
  }
}
