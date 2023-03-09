import 'common.dart';

void main() {
  patrol('drags to widget (notch)', ($) async {
    await $.pumpWidgetAndSettle(ExampleApp());
    await $('Open scrolling screen').scrollTo().tap();
    await $('toggle app bar').scrollTo().tap();

    // this works, but the widget is obscured by the notch safe area
    await $('Some text in the middle').scrollTo(alignment: 0.1);

    // verify state
    expect($('Some text in the middle').hitTestable(), findsOneWidget);

    // this fails, because the widget never becomes hitTestable
    await $('Some text in the middle').tap();
  });
}
