# hackUIButton

We use Method Swizzling - http://nshipster.com/method-swizzling/ 
to exchance sendAction:to:forEvent: with my_sendAction:to:forEvent:

So if we wanna play "ping" sound whatever action fires, and our project has 100+ UIButton, we don't need to subclass anymore.
Just add my UIButton+Sound.h / .m and implement your code in -implementYourFeatured.

Keep your time to enjoy party than working hard ;)
