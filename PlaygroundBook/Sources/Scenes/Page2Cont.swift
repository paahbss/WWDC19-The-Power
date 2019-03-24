//
//  Page2Cont.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit

public class Page2Cont: SKScene {

    var nodeImage: SKSpriteNode!
    let cameraNode = SKCameraNode()
    var delegatePresenting: PresentingProtocol!
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let action = SKAction.changeColor(startColor: SKColor(red: 188/255, green: 206/255, blue: 115/255, alpha: 1.0), endColor: SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0), duration: 1.5)
        self.run(action)
        initalSetup()
        //createVirus()
    }
    
    func updatePosition(){
        nodeImage.removeFromParent()
        let textute = SKTexture(imageNamed: "heart")
        guard let size = self.getSizeWith(scale: false) else {return}
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        self.addChild(nodeImage)
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
    
    func createVirus(){
        guard let superview = self.view else {return}
//        var rects: [SKSpriteNode] = []
//
//        let upView = SKSpriteNode(color: .gray, size: CGSize(width: superview.frame.width, height: 20))
//        upView.anchorPoint = CGPoint(x: 0, y: 0)
//        upView.position = CGPoint(x: -superview.frame.width/2, y: superview.frame.height/2)
//        self.addChild(upView)
//
//        let downView = SKSpriteNode(color: .blue, size: CGSize(width: superview.frame.width, height: 20))
//        downView.anchorPoint = CGPoint(x: 0, y: 0)
//        downView.position = CGPoint(x: -superview.frame.width/2, y: -superview.frame.height/2)
//        self.addChild(downView)
//
//        let leftView = SKSpriteNode(color: .red, size: CGSize(width: 20, height: superview.frame.height))
//        leftView.anchorPoint = CGPoint(x: 0, y: 0)
//        leftView.position = CGPoint(x: -superview.frame.width/2, y: -superview.frame.height/2)
//        self.addChild(leftView)
//
//        let rightView = SKSpriteNode(color: .green, size: CGSize(width: 20, height: superview.frame.height))
//        rightView.anchorPoint = CGPoint(x: 0, y: 0)
//        rightView.position = CGPoint(x: (superview.frame.width/2), y: -superview.frame.height/2)
//        self.addChild(rightView)
//        rects.append(leftView)
//        rects.append(downView)
//        rects.append(rightView)
//        rects.append(upView)
        var randomEdgeX: CGFloat = 0
        var randomEdgeY: CGFloat = 0
        var randXaux: CGFloat = 0
        var randYaux: CGFloat = 0
        for i in 1..<100 {
            let texture = SKTexture(imageNamed: "virus")
            //guard let nodeRandon = rects.randomElement() else {return}
            let virus = SKSpriteNode(texture: texture, size: CGSize(width: 30, height: 30))
            //let posIni = randomPosition(inFrame: nodeRandon.frame)
            
            if i % 2 == 0 {
                randomEdgeX = Int.random(in: 0..<2) == 0 ? -superview.frame.width/2 : superview.frame.width/2 // left or right
                let randomPropX = 1.0+(CGFloat.random(in: 0.0...1.0))
                let randomPropY = CGFloat.random(in: (-superview.frame.height/2)...(superview.frame.height/2))
                virus.position = CGPoint(x: randomEdgeX*randomPropX, y: randomPropY)
            } else {
                randomEdgeY = Int.random(in: 0..<2) == 0 ? -superview.frame.height/2 : superview.frame.height/2 // top or bottom
                let randomPropY = 1.0+(CGFloat.random(in: 0.0...0.8))
                let randomPropX = CGFloat.random(in: (-superview.frame.width/2)...(superview.frame.width/2))
                virus.position = CGPoint(x: randomPropX, y: randomEdgeY*randomPropY)
            }
            
            
            let center = CGPoint(x: self.frame.midX, y: self.frame.midY)
            
            let destAction = SKAction.move(to: center, duration: TimeInterval(Int.random(in: 30..<40)))
            virus.run(destAction)
            
            self.addChild(virus)
        }
    }
    
    func randomPosition(inFrame frame: CGRect) -> CGPoint{
        let width = frame.width/3.3
        let heigth = frame.height/2
        let x = CGFloat.random(in: -width..<width)
        let y = CGFloat.random(in: -heigth..<heigth)
        
        return CGPoint(x: x, y: y)
        //        let xPosition = CGFloat(arc4random_uniform(UInt32((nodeImage.frame.maxX) + 1)))
        //        let yPosition = CGFloat(arc4random_uniform(UInt32((nodeImage.frame.maxY) + 1)))
        //        return CGPoint(x: xPosition, y: yPosition)
    }
    
    
    private func initalSetup(){
        let textute = SKTexture(imageNamed: "heart")
        guard let size = self.getSizeWith(scale: true) else {return}
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


extension SKAction {
    static func changeColor(startColor:SKColor, endColor:SKColor, duration:TimeInterval) -> SKAction {
        // Extract and store starting and ending colors' RGB components
        let start = ColorComponents(color: startColor)
        let end = ColorComponents(color: endColor)
        // Compute the step size
        let stepSize = CGFloat(1/duration)
        // Define a custom class to gradually change a scene's background color
        let change = SKAction.customAction(withDuration: duration) {
            node, time in
            let fraction = time * stepSize
            let red = start.red * (1.0 - fraction) + end.red * fraction
            let green = start.green * (1.0 - fraction) + end.green * fraction
            let blue = start.blue * (1.0 - fraction) + end.blue * fraction
            if let scene = node as? SKScene {
                scene.backgroundColor = SKColor(red: red, green: green, blue: blue, alpha: 1.0)
            }
        }
        return change
    }
}


