import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

///
enum LikeCounterPosition {
  ///
  top,

  ///
  right,

  ///
  bottom,

  ///
  left,
}

///
class LikeToggleButtonState extends Equatable {
  ///
  const LikeToggleButtonState({
    required this.action,
    required this.count,
    this.ignoreReason,
  });

  ///
  bool get ignore => ignoreReason != null && ignoreReason != '';

  ///
  final String? ignoreReason;

  ///
  final bool action;

  ///
  final int count;

  @override
  List<Object?> get props => [ignore, action];

  @override
  String toString() => '-> $action ${ignore ? '$ignoreReason' : 'do'} ';
}

///
class LikeToggleButton extends StatefulWidget {
  ///
  const LikeToggleButton({
    required this.initialState,
    required this.likeBuilder,
    required this.onTap,
    this.counterPosition = LikeCounterPosition.right,
    this.initialCount,
    this.onChange,
    this.counterBuilder,
    Key? key,
  }) : super(key: key);

  ///
  final Function(LikeToggleButtonState state)? onChange;

  ///
  final bool initialState;

  ///
  final Widget Function(bool isLiked, int count) likeBuilder;

  ///
  final Function(bool isLiked, int count) onTap;

  ///
  final int? initialCount;

  ///
  final Widget Function(int count, bool isLiked)? counterBuilder;

  ///
  final LikeCounterPosition counterPosition;

  @override
  State<LikeToggleButton> createState() => _LikeToggleButtonState();
}

class _LikeToggleButtonState extends State<LikeToggleButton> {
  late BehaviorSubject<bool> _lastActionSubject;
  late BehaviorSubject<bool> _lastProcessedActionSubject;
  late BehaviorSubject<bool> _isBusySubject;

  @override
  void initState() {
    super.initState();
    _lastActionSubject = BehaviorSubject();
    _lastProcessedActionSubject = BehaviorSubject.seeded(widget.initialState);
    _isBusySubject = BehaviorSubject.seeded(false);

    CombineLatestStream.combine3<bool, bool, bool, LikeToggleButtonState>(
        _lastProcessedActionSubject, _lastActionSubject, _isBusySubject,
        (lastProcessed, lastAction, isBusy) {
      final state = LikeToggleButtonState(
        ignoreReason: isBusy
            ? 'still busy'
            : lastProcessed == lastAction
                ? 'no changes'
                : null,
        action: lastAction,
        count: _getNewCount(lastAction),
      );

      widget.onChange?.call(state);
      return state;
    }).listen((state) async {
      if (state.ignore) {
        return;
      }

      _isBusySubject.add(true);
      await widget.onTap(state.action, state.count);
      _lastProcessedActionSubject.add(state.action);
      _isBusySubject.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.counterPosition == LikeCounterPosition.top ||
        widget.counterPosition == LikeCounterPosition.bottom) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.counterPosition == LikeCounterPosition.top
            ? [
                _counterView(),
                _likeIcon(),
              ]
            : [
                _likeIcon(),
                _counterView(),
              ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.counterPosition == LikeCounterPosition.right
          ? [
              _likeIcon(),
              _counterView(),
            ]
          : [
              _counterView(),
              _likeIcon(),
            ],
    );
  }

  Widget _counterView() {
    if (widget.initialCount != null && widget.counterBuilder != null) {
      return StreamBuilder<bool>(
        stream: _lastActionSubject,
        builder: (_, snap) {
          if (!snap.hasData) {
            return widget.counterBuilder!
                .call(widget.initialCount!, widget.initialState);
          }
          final newCount = _getNewCount(snap.data!);
          return widget.counterBuilder!.call(newCount, snap.data!);
        },
      );
    }

    return const SizedBox.shrink();
  }

  int _getNewCount(bool isLiked) {
    var count = -9999;
    final initCount = widget.initialCount!;
    if (widget.initialState) {
      if (!isLiked) {
        count = initCount - 1;
      } else {
        count = initCount;
      }
    } else {
      if (!isLiked) {
        count = initCount;
      } else {
        count = initCount + 1;
      }
    }
    return count;
  }

  GestureDetector _likeIcon() {
    return GestureDetector(
      onTap: _onButtonPressed,
      child: StreamBuilder<bool>(
        stream: _lastActionSubject,
        builder: (_, snap) {
          final isLiked = !snap.hasData ? widget.initialState : snap.data!;
          final newCount = _getNewCount(isLiked);
          return widget.likeBuilder(isLiked, newCount);
        },
      ),
    );
  }

  Future _onButtonPressed() async {
    final lastAction = _lastActionSubject.valueOrNull ?? widget.initialState;
    final nextAction = !lastAction;
    _lastActionSubject.add(nextAction);
  }

  @override
  void dispose() {
    _lastActionSubject.close();
    _lastProcessedActionSubject.close();
    _isBusySubject.close();
    super.dispose();
  }
}
