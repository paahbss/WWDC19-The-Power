//
//  Page4ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 21/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

class Page4ViewController: UIViewController {
    
    var skviewPage4: SKView!
    var scene: SKScene!

    override func viewDidLoad() {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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


