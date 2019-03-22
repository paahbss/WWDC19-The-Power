//
//  Page5ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

class Page5ViewController: UIViewController {
    
    var skviewPage5: SKView!
    var scene: SKScene!

    override func viewDidLoad() {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Page5ViewController: PlaygroundLiveViewMessageHandler{
    
    public func receive(_ message: PlaygroundValue) {
        guard case let .string(seeLung) = message else { return }
        
        if seeLung == "seeLung" {
            guard let scene = self.scene as? Page5 else {return}
            scene.seeLung()
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
    }
}

