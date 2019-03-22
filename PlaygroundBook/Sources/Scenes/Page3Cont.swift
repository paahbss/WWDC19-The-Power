//
//  Page3Cont.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit

class Page3Cont: SKScene {

    var nodeImage: SKSpriteNode!
    let cameraNode = SKCameraNode()
    var delegatePresenting: PresentingProtocol!
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        initalSetup()
    }
    
    
    private func initalSetup(){
        let textute = SKTexture(imageNamed: "brain")
        guard let viewWidth = view?.frame.width, let viewHeight = view?.frame.height else {return}
        var size = CGSize.zero
        size = CGSize(width: (viewWidth * 0.6)/3, height: (viewHeight * 0.5)/3)
//        if viewHeight > viewHeight {
//            size = CGSize(width: viewWidth * 0.6, height: viewHeight * 0.45)
//        }else{
//            size = CGSize(width: viewWidth * 0.4, height: viewHeight * 0.3)
//        }
        size = CGSize(width: viewWidth * 0.4, height: viewHeight * 0.45)
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.nodeImage.run(SKAction.scale(by: 3, duration: 1))
        self.addChild(nodeImage)
        //configuring camera
        cameraNode.position = self.position
        self.addChild(cameraNode)
        self.camera = cameraNode
    }
    
}
