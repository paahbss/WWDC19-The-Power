//
//  Page3.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit

public class Page3: SKScene {
    
    var nodeImage: SKSpriteNode!
    let cameraNode = SKCameraNode()
    var delegatePresenting: PresentingProtocol!
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        initalSetup()
    }
    
    
    func updatePosition(){
        nodeImage.removeFromParent()
        let textute = SKTexture(imageNamed: "people3")
        guard let viewWidth = view?.frame.width, let viewHeight = view?.frame.height else {return}
        var size = CGSize.zero
        if viewHeight > viewHeight {
            size = CGSize(width: viewWidth * 0.4, height: viewHeight * 0.45)
        }else{
            size = CGSize(width: viewWidth * 0.4, height: viewHeight * 0.3)
        }
        size = CGSize(width: viewWidth * 0.4, height: viewHeight * 0.45)
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.addChild(nodeImage)
    }
    
    private func initalSetup(){
        let textute = SKTexture(imageNamed: "people3")
        guard let viewWidth = view?.frame.width, let viewHeight = view?.frame.height else {return}
        var size = CGSize.zero
        if viewHeight > viewHeight {
            size = CGSize(width: viewWidth * 0.7, height: viewHeight * 0.6)
        }else{
            size = CGSize(width: viewWidth * 0.4, height: viewHeight * 0.3)
        }
        size = CGSize(width: viewWidth * 0.4, height: viewHeight * 0.45)
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.addChild(nodeImage)
        //configuring camera
        cameraNode.position = self.position
        self.addChild(cameraNode)
        self.camera = cameraNode
    }
    
    func gotoBrain(){
        let zoomInAction = SKAction.repeatForever(SKAction.scale(by: 0.4, duration: 1))
        let moveByX = SKAction.moveTo(x: nodeImage.frame.midX, duration: 1)
        let moveByY = SKAction.moveTo(y: nodeImage.frame.maxY - CGFloat(20), duration: 1)
        cameraNode.run(SKAction.group([moveByX, moveByY, zoomInAction ]))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let scene = Page3Cont.init(size: self.size)
            scene.backgroundColor = SKColor(red: 99/255, green: 18/255, blue: 4/255, alpha: 1)
            guard let skview = self.view else {return}
            skview.backgroundColor = SKColor(red: 99/255, green: 18/255, blue: 4/255, alpha: 1)
            self.delegatePresenting.changeTo(scene: scene)
        }
    }

}
