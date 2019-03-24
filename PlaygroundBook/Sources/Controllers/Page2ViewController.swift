//
//  Page2ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class Page2ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    var skviewPage2: SKView!
    var scene: SKScene!
    var sceneIsPresented = false
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.skviewPage2 = SKView(frame: view.frame)
        view.addSubview(skviewPage2)
        skviewPage2.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.scene = Page2.init(size: view.frame.size)
        guard let scene2 = self.scene as? Page2 else {return}
        scene2.delegatePresenting = self
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        skviewPage2.ignoresSiblingOrder = true
        skviewPage2.showsFPS = false
        skviewPage2.showsNodeCount = true
        skviewPage2.showsPhysics = false
        //skviewPage2.presentScene(self.scene)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
    }
    
    func start(){
        skviewPage2.presentScene(self.scene)
        sceneIsPresented = true
        
    }
    
    override public func viewDidLayoutSubviews() {
        skviewPage2.center = PlaygroundCenterHelper.getPlaygroundViewCenterPoint()
        skviewPage2.frame = self.liveViewSafeAreaGuide.layoutFrame
        if sceneIsPresented {
            if self.view.frame != CGRect.zero{
                if let scene = self.scene as? Page2 {
                    scene.updatePosition()
                }
                if let scene = self.scene as? Page2Cont {
                    scene.updatePosition()
                }
            }
        }
        
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene2 = Page2Cont.init(size: view.frame.size)
        self.scene = scene2
        skviewPage2.presentScene(scene2)
        guard let scene = self.scene as? Page2Cont else {return}
        //self.start()
        scene.createVirus()
    }
}

extension Page2ViewController: PlaygroundLiveViewMessageHandler{
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(visitHeart) = message else { return }
        if visitHeart == "visitHeart" {
            guard let scene = self.scene as? Page2Cont else {return}
            self.start()
            scene.createVirus()
        }
    }
}

extension Page2ViewController: PresentingProtocol {
    public func present(viewController: UIViewController) {
        
    }
    
    public func dismiss(viewController: UIViewController) {
        
    }
    
    public func changeTo(scene: SKScene) {
        skviewPage2.presentScene(scene)
        self.scene = scene
    }
}


