//
//  Page5Cont.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit

class Page5Cont: SKScene {
    
    var nodeImage: SKSpriteNode!
    let cameraNode = SKCameraNode()
    var delegatePresenting: PresentingProtocol!
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let action = SKAction.changeColor(startColor: SKColor(red: 222/255, green: 96/255, blue: 126/255, alpha: 1.0), endColor: SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0), duration: 1.5)
        self.run(action)
        initalSetup()
    }
    
    func updatePosition(){
        nodeImage.removeFromParent()
        let textute = SKTexture(imageNamed: "lung")
        guard let size = self.getSizeWith(scale: false) else {return}
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.addChild(nodeImage)
    }
    
    private func initalSetup(){
        let textute = SKTexture(imageNamed: "lung")
        guard let size = self.getSizeWith(scale: true) else {return}
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.addChild(nodeImage)
        //configuring camera
        cameraNode.position = self.position
        self.addChild(cameraNode)
        self.camera = cameraNode
        self.nodeImage.run(SKAction.scale(by: 3, duration: 1))
    }
    
    private func getSizeWith(scale: Bool) -> CGSize? {
        guard let viewWidth = view?.frame.width, let viewHeight = view?.frame.height else {return nil}
        var size = CGSize.zero
        let aux: CGFloat = scale ? 3: 1
        if viewHeight > viewWidth {
            size = CGSize(width: (viewWidth * 0.6)/aux, height: (viewHeight * 0.5)/aux)
        }else{
            size = CGSize(width: (viewWidth * 0.2)/aux, height: (viewHeight * 0.7)/aux)
        }
        return size
    }
    
    func activateThymus(){
        self.nodeImage.run(SKAction.setTexture(SKTexture(imageNamed: "lungTimo")))
    }
    
    func produceWhiteBloodCells(){
        for _ in 0...45 {
            let blood = SKSpriteNode(texture: SKTexture(imageNamed: "blood"), size: CGSize(width: 20, height: 20))
            blood.zPosition = 3
            blood.position =  CGPoint(x: self.nodeImage.frame.midX, y: self.nodeImage.frame.midY + CGFloat(30))
            let pos = randomPosition(inFrame: self.nodeImage.frame)
            let move = SKAction.move(to:pos,duration:10)
            let fadeOut = SKAction.fadeOut(withDuration: 10)
            let group = SKAction.group([move, fadeOut])
            let removed = SKAction.run {
                blood.removeFromParent()
            }
            blood.run(SKAction.sequence([group, removed]), withKey:"moving")
            self.addChild(blood)
        }
    }
    
    func addEmojis(){
        
        let texture = SKTexture(imageNamed: "strength\(Int.random(in: 0...5))")
        let emoji = SKSpriteNode(texture: texture, size: CGSize(width: 30, height: 30))
        
        let actualX = random(min: -size.width/2, max: size.width/2)
    
        emoji.position = CGPoint(x: actualX, y: size.width + emoji.size.width/2)
        emoji.zPosition = 3
        
        // Add the monster to the scene
        addChild(emoji)
        
        // Determine speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: actualX , y: -size.height/2), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        emoji.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func randomPosition(inFrame frame: CGRect) -> CGPoint{
        let width = frame.width/3.3
        let heigth = frame.height/2
        let x = CGFloat.random(in: -width..<width)
        let y = CGFloat.random(in: -heigth..<heigth)
        
        return CGPoint(x: x, y: y)
    }
    
    func strengthenImmuneSystem(){
        self.run(SKAction.repeat(SKAction.sequence([
            SKAction.run(addEmojis),
            SKAction.wait(forDuration: 0.01)
            ]), count: 100))
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
}
