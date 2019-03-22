//
//  Page1ViewController.swift
//  ThePower
//
//  Created by Paloma Bispo on 19/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class Page1ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    var skviewPage1: SKView!
    var scene: SKScene!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.skviewPage1 = SKView(frame: view.frame)
        view.addSubview(skviewPage1)
        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.scene = Page1.init(size: view.frame.size)
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        guard let scene = self.scene as? Page1 else {return}
        scene.delegatePresenting = self
        skviewPage1.ignoresSiblingOrder = true
        skviewPage1.showsFPS = false
        skviewPage1.showsNodeCount = false
        skviewPage1.showsPhysics = false
        skviewPage1.presentScene(self.scene)
    }

    
    override public func viewDidLayoutSubviews() {
        skviewPage1.center = PlaygroundCenterHelper.getPlaygroundViewCenterPoint()
        skviewPage1.frame = self.liveViewSafeAreaGuide.layoutFrame
        if self.view.frame != CGRect.zero{
            if let scene = self.scene as? Page1 {
                scene.updatePosition()
            }
        }
    }
}

extension Page1ViewController: PresentingProtocol{
    public func changeTo(scene: SKScene) {}
    
    public func present(viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    public func dismiss(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
