



import UIKit
import SpriteKit
import PlaygroundSupport


let fontURL = Bundle.main.url(forResource: "BalooChettan-Regular", withExtension: "ttf")
CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
//PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = Page2ViewController()

