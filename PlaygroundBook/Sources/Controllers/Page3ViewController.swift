//
//  Page2ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 21/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class Page3ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {

    var skviewPage3: SKView!
    var scene: SKScene!

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.skviewPage3 = SKView(frame: view.frame)
        view.addSubview(skviewPage3)
        self.scene = Page3.init(size: view.frame.size)
        guard let scene3 = self.scene as? Page3 else {return}
        scene3.delegatePresenting = self
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        skviewPage3.ignoresSiblingOrder = true
        skviewPage3.showsFPS = false
        skviewPage3.showsNodeCount = false
        skviewPage3.showsPhysics = false
        skviewPage3.presentScene(self.scene)
    }
    
    override public func viewDidLayoutSubviews() {
        skviewPage3.center = PlaygroundCenterHelper.getPlaygroundViewCenterPoint()
        skviewPage3.frame = self.liveViewSafeAreaGuide.layoutFrame
        if self.view.frame != CGRect.zero{
            if let scene = self.scene as? Page3 {
                scene.updatePosition()
            }
        }
    }
    
//    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let scene = self.scene as? Page3 {
//            scene.visitBrain()
//        }
//        if let scene = self.scene as? Page3Cont{
//            scene.activateHypothalamus()
//            scene.releaseOxytocin()
//        }
//        
//    }
}

extension Page3ViewController: PlaygroundLiveViewMessageHandler{
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(command) = message else { return }
        
        
        switch command {
        case "visitBrain":
            guard let scene = self.scene as? Page3 else {return}
            scene.visitBrain()
            break
        case "releaseOxytocin":
            guard let sceneCont = self.scene as? Page3Cont else {return}

            sceneCont.releaseOxytocin()
            break
        case "decreaseAnxiety":
            guard let sceneCont = self.scene as? Page3Cont else {return}

            sceneCont.decreaseAnxiety()
            break
        case "activateHypothalamus":
            guard let sceneCont = self.scene as? Page3Cont else {return}

            sceneCont.activateHypothalamus()
            break
        default:
            break
        }
        
    }
}

extension Page3ViewController: PresentingProtocol {
    public func present(viewController: UIViewController) {
        
    }
    
    public func dismiss(viewController: UIViewController) {
        
    }
    
    public func changeTo(scene: SKScene) {
        skviewPage3.presentScene(scene)
        self.scene = scene
    }
}
