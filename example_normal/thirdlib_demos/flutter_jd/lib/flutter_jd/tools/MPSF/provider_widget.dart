// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final T model;
  final Widget? child;
  final Function(T)? onReady;

  ProviderWidget({
    Key? key,
    required this.model,
    this.child,
    this.onReady,
    required this.builder,
  }) : super(key: key);

  @override
  _ProviderWidgetState<T> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.onReady != null) {
        widget.onReady!(widget.model);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

class MultiProviderWidget extends StatefulWidget {
  List<SingleChildWidget> providers;
  Widget? child;
  TransitionBuilder? builder;
  final Function()? onReady;

  MultiProviderWidget({
    Key? key,
    required this.providers,
    this.onReady,
    this.child,
    this.builder,
  }) : super(key: key);

  @override
  _MultiProviderWidget createState() => _MultiProviderWidget();
}

class _MultiProviderWidget<T extends ChangeNotifier>
    extends State<MultiProviderWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.onReady != null) {
        widget.onReady!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: widget.providers,
      child: widget.child,
      builder: widget.builder,
    );
  }
}
