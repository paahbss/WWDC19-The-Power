//
//  Page2Cont.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import UIKit
import SpriteKit

class Page2Cont: SKScene {

    var nodeImage: SKSpriteNode!
    let cameraNode = SKCameraNode()
    var delegatePresenting: PresentingProtocol!
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let action = SKAction.changeColor(startColor: SKColor(red: 188/255, green: 206/255, blue: 115/255, alpha: 1.0), endColor: SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0), duration: 1.5)
        self.run(action)
        initalSetup()
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
