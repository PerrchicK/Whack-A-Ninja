# iOS-memory-leaks-example
Originally taken from a game called "Whack-A-Ninja", an iPhone app written in Swift by one of my students.

I took this project as a good example for issues and their solutions.

Here you can find:
- Memory leaks ([retain cycle](https://github.com/PerrchicK/iOS-memory-leaks-example/blob/039d9ca05e507d94c2b136a98c8bb524fa8697e1/Whack-A-Ninja/GameViewController.swift#L25), [unclosed UIViewController objects](https://github.com/PerrchicK/iOS-memory-leaks-example/blob/039d9ca05e507d94c2b136a98c8bb524fa8697e1/Whack-A-Ninja/EndGameViewController.swift#L32))
- [A wrong usage of an *unowned* reference](https://github.com/PerrchicK/iOS-memory-leaks-example/blob/039d9ca05e507d94c2b136a98c8bb524fa8697e1/Whack-A-Ninja/GameScene.swift#L66) (a good example of [why using *weak* instead](https://stackoverflow.com/questions/24011575/what-is-the-difference-between-a-weak-reference-and-an-unowned-reference/26025176#26025176
))
- [A good example for delegate usage](https://github.com/PerrchicK/iOS-memory-leaks-example/blob/039d9ca05e507d94c2b136a98c8bb524fa8697e1/Whack-A-Ninja/GameScene.swift#L16)

Enjoy,
Perry
