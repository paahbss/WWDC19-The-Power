//
//  Page4ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 21/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class Page4ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    var skviewPage4: SKView!
    var scene: SKScene!

    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.skviewPage4 = SKView(frame: view.frame)
        view.addSubview(skviewPage4)
        self.scene = Page4.init(size: view.frame.size)
        guard let scene4 = self.scene as? Page4 else {return}
        scene4.delegatePresenting = self
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        skviewPage4.ignoresSiblingOrder = true
        skviewPage4.showsFPS = false
        skviewPage4.showsNodeCount = false
        skviewPage4.showsPhysics = false
        skviewPage4.presentScene(self.scene)
    }

    override public func viewDidLayoutSubviews() {
        skviewPage4.center = PlaygroundCenterHelper.getPlaygroundViewCenterPoint()
        skviewPage4.frame = self.liveViewSafeAreaGuide.layoutFrame
        if self.view.frame != CGRect.zero{
            if let scene = self.scene as? Page4 {
                scene.updatePosition()
            }
        }
    }
}

extension Page4ViewController: PlaygroundLiveViewMessageHandler{
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(seeSkin) = message else { return }
        
        if seeSkin == "seeSkin" {
            guard let scene = self.scene as? Page4 else {return}
            scene.seeSkin()
        }
    }
}

extension Page4ViewController: PresentingProtocol {
    public func present(viewController: UIViewController) {
        
    }
    
    public func dismiss(viewController: UIViewController) {
        
    }
    
    public func changeTo(scene: SKScene) {
        skviewPage4.presentScene(scene)
    }
}


