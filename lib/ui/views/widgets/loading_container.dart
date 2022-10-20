import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LoadingContainer extends StatefulWidget {
  const LoadingContainer({Key? key, required Widget child, required bool isLoading})
      : _child = child,
        _isLoading = isLoading,
        super(key: key);
  final Widget _child;
  final bool _isLoading;
  @override
  State<LoadingContainer> createState() {
    return _LoadingContainerState();
  }
}

class _LoadingContainerState extends State<LoadingContainer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget._child,
      IgnorePointer(
        ignoring: !widget._isLoading,
        child: AnimatedOpacity(
          opacity: widget._isLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.5),
              ),
              Center(
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.all(64),
                  decoration: BoxDecoration(
                    color: Theme.of(context).dialogBackgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(child: Text("${"loading".tr()}...")),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
    );
  }
}