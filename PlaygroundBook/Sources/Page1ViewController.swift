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
        view = skviewPage1
        view.backgroundColor = .clear
        self.scene = Page1.init(size: view.frame.size)
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor.clear
        skviewPage1.ignoresSiblingOrder = true
        skviewPage1.showsFPS = false
        skviewPage1.showsNodeCount = false
        skviewPage1.showsPhysics = false
        skviewPage1.presentScene(self.scene)
    }
    
//    private func skviewConstraints(){
//        skviewPage1.translatesAutoresizingMaskIntoConstraints = false
//        if let superview = skviewPage1.superview{
//            skviewPage1.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
//            skviewPage1.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
//            skviewPage1.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
//            skviewPage1.rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
//        }
//    }
    
    override public func viewDidLayoutSubviews() {
        skviewPage1.center = self.view.center
        skviewPage1.frame = self.view.frame
        if self.view.frame != CGRect.zero{
            if let scene = self.scene as? Page1 {
                scene.updatePosition()
            }
        }
        
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
