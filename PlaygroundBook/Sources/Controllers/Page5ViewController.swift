//
//  Page5ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class Page5ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    var skviewPage5: SKView!
    var scene: SKScene!

    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.skviewPage5 = SKView(frame: view.frame)
        view.addSubview(skviewPage5)
        self.scene = Page5.init(size: view.frame.size)
        guard let scene5 = self.scene as? Page5 else {return}
        scene5.delegatePresenting = self
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        skviewPage5.ignoresSiblingOrder = true
        skviewPage5.showsFPS = false
        skviewPage5.showsNodeCount = false
        skviewPage5.showsPhysics = false
        skviewPage5.presentScene(self.scene)

    }
    
    override public func viewDidLayoutSubviews() {
        skviewPage5.center = PlaygroundCenterHelper.getPlaygroundViewCenterPoint()
        skviewPage5.frame = self.liveViewSafeAreaGuide.layoutFrame
        if self.view.frame != CGRect.zero{
            if let scene = self.scene as? Page5 {
                scene.updatePosition()
            }
        }
    }

}

extension Page5ViewController: PlaygroundLiveViewMessageHandler{
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(command) = message else { return }

        switch command {
        case "visitLung":
            guard let scene = self.scene as? Page5 else {return}
            scene.visitLung()
            break
        case "activateThymus":
            guard let sceneCont = self.scene as? Page5Cont else {return}
            sceneCont.activateThymus()
            break
        case "produceWhiteBloodCells":
            guard let sceneCont = self.scene as? Page5Cont else {return}
            sceneCont.produceWhiteBloodCells()
            break
        case "strengthenImmuneSystem":
            guard let sceneCont = self.scene as? Page5Cont else {return}
            sceneCont.strengthenImmuneSystem()
            break
        default:
            break
        }
    }
}

extension Page5ViewController: PresentingProtocol {
    public func present(viewController: UIViewController) {
        
    }
    
    public func dismiss(viewController: UIViewController) {
        
    }
    
    public func changeTo(scene: SKScene) {
        skviewPage5.presentScene(scene)
        self.scene = scene
    }
}

