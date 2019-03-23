//
//  Page3Cont.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit

public class Page3Cont: SKScene {

    var nodeImage: SKSpriteNode!
    var nodeHypo: SKSpriteNode!
    let cameraNode = SKCameraNode()
    var hasEmoji = false
    var delegatePresenting: PresentingProtocol!
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let action = SKAction.changeColor(startColor: SKColor(red: 219/255, green: 165/255, blue: 90/255, alpha: 1.0), endColor: SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0), duration: 1.5)
        self.run(action)
        initalSetup()
    }
    
    public override func update(_ currentTime: TimeInterval) {
        let children = self.children
        var remove: [SKNode] = []
        for child in children {
            if !nodeImage.frame.contains(child.frame) {
                child.run(SKAction.fadeOut(withDuration: 0.5))
                remove.append(child)
            }
        }
        
        self.removeChildren(in: remove)
    }
    
    private func getSizeWith(scale: Bool) -> CGSize? {
        guard let viewWidth = view?.frame.width, let viewHeight = view?.frame.height else {return nil}
        var size = CGSize.zero
        let aux: CGFloat = scale ? 3: 1
        if viewHeight > viewWidth {
            size = CGSize(width: (viewWidth * 0.7)/aux, height: (viewHeight * 0.5)/aux)
        }else{
            size = CGSize(width: (viewWidth * 0.2)/aux, height: (viewHeight * 0.7)/aux)
        }
        return size
    }
    
    func updatePosition(){
        nodeImage.removeFromParent()
        nodeHypo.removeFromParent()
        //setting brain node
        let textute = SKTexture(imageNamed: "brain")
        guard let size = self.getSizeWith(scale: false) else {return}
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.addChild(nodeImage)
        //setting hypo node
        let textuteHypo = SKTexture(imageNamed: "hypo")
        let sizeHypo = CGSize(width: 5, height: 5)
        self.nodeHypo = SKSpriteNode(texture: textuteHypo, size: sizeHypo)
        self.nodeHypo .position = CGPoint(x: 0, y: 0)
        self.nodeHypo.alpha = 0.0
        nodeImage.addChild(nodeHypo)
    }
    
    private func initalSetup(){
        //configuring braing node
        let textute = SKTexture(imageNamed: "brain")
        guard let size = self.getSizeWith(scale: true) else {return}
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.nodeImage.run(SKAction.scale(by: 3, duration: 1))
        nodeImage.alpha = 1.0
        self.addChild(nodeImage)
        //configuring camera
        cameraNode.position = self.position
        self.addChild(cameraNode)
        self.camera = cameraNode
        //configuring hypo node
        let textuteHypo = SKTexture(imageNamed: "hypo")
        let sizeHypo = CGSize(width: 10, height: 10)
        self.nodeHypo = SKSpriteNode(texture: textuteHypo, size: sizeHypo)
        self.nodeHypo .position = CGPoint(x: 5, y: 0)
        self.nodeHypo.alpha = 0.0
        self.nodeHypo.zPosition = 2
        nodeImage.addChild(nodeHypo)
    }
    
    func releaseOxytocin(){
//        let rect = CGRect(origin: nodeImage.frame.origin, size: CGSize(width: self.nodeImage.frame.width - CGFloat(20), height: self.nodeImage.frame.height))
        if !hasEmoji {
            for _ in 0...45{
                let oxytocin = SKShapeNode(circleOfRadius: 4)
                oxytocin.zPosition = 3
                oxytocin.fillColor = .red
                oxytocin.position = nodeHypo.position
                let pos = randomPosition(inFrame: self.nodeImage.frame)
                let move = SKAction.move(to:pos,duration:10)
                let fadeOut = SKAction.fadeOut(withDuration: 5)
                //let score = SKAction.run({score += 1})
                let seq = SKAction.group([move, fadeOut])
                oxytocin.run(seq, withKey:"moving")
                self.addChild(oxytocin)
                
            }
        }
        
    }
    
    func decreaseAnxiety(){
        addEmojis()
    }
    
    func activateHypothalamus(){
        nodeHypo.run(SKAction.fadeIn(withDuration: 2.0))
        let pulseUp = SKAction.scale(to: 1.2, duration: 1.0)
        let pulseDown = SKAction.scale(to: 0.8, duration: 1.0)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        nodeHypo.run(repeatPulse)
    }
    
    func randomPosition(inFrame frame: CGRect) -> CGPoint{
        let x = CGFloat.random(in: frame.minX+30..<frame.maxX-20)
        let y = CGFloat.random(in: frame.minY+30..<frame.maxY-20)
       
        return CGPoint(x: x, y: y)
//        let xPosition = CGFloat(arc4random_uniform(UInt32((nodeImage.frame.maxX) + 1)))
//        let yPosition = CGFloat(arc4random_uniform(UInt32((nodeImage.frame.maxY) + 1)))
//        return CGPoint(x: xPosition, y: yPosition)
    }
    
    private func addEmojis(){
        hasEmoji = true
        for _ in 0...5 {
            let textute = SKTexture(imageNamed: "emoji\(Int.random(in: 3..<6))")
            let emoji = SKSpriteNode(texture: textute, size: CGSize(width: 12, height:12))
            let rect = CGRect(origin: nodeImage.frame.origin, size: CGSize(width: self.nodeImage.frame.width, height: self.nodeImage.frame.height))
            emoji.position = randomPosition(inFrame: rect)
            emoji.zPosition = 2
            nodeImage.addChild(emoji)
        }
    }
    
}
