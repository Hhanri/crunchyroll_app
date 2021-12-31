import 'package:crunchyroll_app/resources/strings.dart';
import 'package:crunchyroll_app/resources/theme.dart';
import 'package:crunchyroll_app/utils/format_utils.dart';
import 'package:crunchyroll_app/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {

  final ValueChanged<String> valueChanged;
  final TextFieldParamaters textFieldParameters;
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;


  const TextFieldWidget({
    Key? key,
    required this.textFieldParameters,
    required this.valueChanged,
    this.focusNode,
    this.textEditingController,

  }) :  super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  late final TextFieldParamaters _textFieldParamaters;
  TextEditingController? _textEditingController;
  FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _textFieldParamaters = widget.textFieldParameters;
    _focusNode = widget.focusNode ?? FocusNode();
    _textEditingController = widget.textEditingController ?? TextEditingController();
    if (_textFieldParamaters is PasswordTextFieldParameters) {
      _textFieldParamaters.iconTap = _revealObscureText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: _textFieldParamaters.textInputFormatters,
      controller: _textEditingController,
      focusNode: _focusNode,
      style: MyTextStyles.body1,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          hintText: _textFieldParamaters.hintText,
          hintStyle: _textFieldParamaters.textStyle ?? MyTextStyles.hintText,
          suffixIcon: GestureDetector(
            onTap: _textFieldParamaters.iconTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 21.0),
              child:
              (_textFieldParamaters is PasswordTextFieldParameters)
                  ?  (_textFieldParamaters.obscureText)
                  ? IconWidget(icon: Icons.visibility)
                  : IconWidget(icon: Icons.visibility_off)
                  :_textFieldParamaters.iconWidget,
            ),
          )
      ),
      obscureText: _textFieldParamaters.obscureText,
      autocorrect: _textFieldParamaters.autoCorrect,
      onChanged: (String? value) {
        widget.valueChanged(value ?? "");
      },
      onFieldSubmitted: (String? value) {
        widget.valueChanged(value ?? "");
      },
      validator: (String? value) {
        return _validateForm(value ?? "");
      },
    );
  }


  void _revealObscureText() {
    setState(() {
      _textFieldParamaters.obscureText = !_textFieldParamaters.obscureText;
    });
  }

  String? _validateForm(String value) {
    if (_textFieldParamaters != SearchTextFieldParameters) {
      if (value == "" || value.replaceAll(" ", "") == "") {
        return Strings.errorEmptyField;
      } else {
        if (_textFieldParamaters is PasswordTextFieldParameters && value.length < 8) {
          return Strings.errorPasswordLength;
        }
      }
    }
    if (_textFieldParamaters is EmailTextFieldParameters) {
      if(!value.isValidEmail()) {
        return Strings.errorIsNotEmail;
      }
    }
    widget.valueChanged(value);
    return null;
  }
}




class TextFieldParamaters {
  final String? hintText;
  IconWidget? iconWidget;
  VoidCallback? iconTap;
  final TextStyle? textStyle;
  bool obscureText;
  final bool autoCorrect;
  List<TextInputFormatter>? textInputFormatters;
  TextInputType? keyboardType;
  bool? readOnly;

  TextFieldParamaters({
    required this.hintText,
    this.iconWidget,
    this.iconTap,
    this.textStyle,
    this.obscureText = false,
    this.autoCorrect = true ,
    this.textInputFormatters,
    this.keyboardType,
    this.readOnly,
  });
}

class usernameTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  usernameTextFieldParameters({
    this.hintText = Strings.username
  }) : super(
    hintText: hintText,
    textInputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-1]"))],
    keyboardType: TextInputType.name
  );
}

class EmailTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  EmailTextFieldParameters({
    this.hintText = Strings.email
  }) : super(
      hintText: hintText,
      keyboardType: TextInputType.emailAddress
  );
}

class PasswordTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  final IconWidget? iconWidget;
  PasswordTextFieldParameters({
    this.hintText = Strings.password,
    this.iconWidget = const IconWidget(
        icon: Icons.visibility
    )
  }) : super(
      hintText: hintText,
      obscureText: true,
      autoCorrect: false,
      iconWidget: iconWidget
  );
}

class SearchTextFieldParameters extends TextFieldParamaters {
  final String? hintText;
  final IconWidget? iconWidget;
  SearchTextFieldParameters({
    this.hintText = Strings.search,
    this.iconWidget = const IconWidget(
        icon: Icons.search
    )
  }) : super(
      hintText: hintText,
      iconWidget: iconWidget
  );
}