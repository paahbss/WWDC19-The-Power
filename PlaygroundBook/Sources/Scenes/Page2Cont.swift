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
    var informationLabel: SKLabelNode!
    var virusArray: [SKSpriteNode] = []
    var delegatePresenting: PresentingProtocol!
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let action = SKAction.changeColor(startColor: SKColor(red: 188/255, green: 206/255, blue: 115/255, alpha: 1.0), endColor: SKColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0), duration: 1.5)
        self.run(action)
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        swipe.direction = .down
        view.addGestureRecognizer(swipe)
        initalSetup()
        createVirus()
    }
    
    @objc func swipeHandler(){
        guard let superview = self.view?.superview else {return}
        for i in 1..<5 {
            let oxytocin = SKShapeNode(circleOfRadius: 8)
            oxytocin.zPosition = 3
            oxytocin.fillColor = .red
            let randomPropX = CGFloat.random(in: (-superview.frame.width/2)...(superview.frame.width/2))
            oxytocin.position = CGPoint(x: randomPropX, y: superview.frame.height/2)
            let center = CGPoint(x: oxytocin.position.x, y: -superview.frame.height/2)
            let destAction = SKAction.move(to: center, duration: TimeInterval(Int.random(in: 10..<15)))
            oxytocin.run(destAction) {
                oxytocin.removeFromParent()
            }
            self.addChild(oxytocin)
        }
        for _ in 0..<4{
            if !virusArray.isEmpty{
                let virus = virusArray[0]
                let shake = SKAction.shake(duration: 1)
                virus.run(shake) {
                    virus.removeFromParent()
                }
                virusArray.remove(at: 0)
            }else{
                let alert = UIAlertController(title: nil, message: "Congratulation! Due to the level of oxytocin released in the body.", preferredStyle: <#T##UIAlertController.Style#>)
                delegatePresenting.present(viewController: <#T##UIViewController#>)
            }
        }
        let action = nodeImage.action(forKey: "pulse")
        guard let actionSpeed = action?.speed else {return}
        if Double(actionSpeed) <= 0.1 {
            action?.speed -= 0.1
        }
    }
    
    func updatePosition(){
        nodeImage.removeFromParent()
        informationLabel.removeFromParent()
        let textute = SKTexture(imageNamed: "heart")
        guard let size = self.getSizeWith(scale: false) else {return}
        self.nodeImage = SKSpriteNode(texture: textute, size: size)
        self.nodeImage .position = CGPoint(x: 0, y: 0)
        let pulseUp = SKAction.scale(to: 1.2, duration: 0.2)
        let pulseDown = SKAction.scale(to: 0.9, duration: 0.2)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        self.nodeImage.run(repeatPulse, withKey: "pulse")
        self.addChild(nodeImage)
        informationLabel = SKLabelNode(text: "Swipe down until the heart is calmer and free from disease risks")
        informationLabel.fontSize = 16
        informationLabel.fontColor = .black
        informationLabel.fontName = "BalooChettan-Regular"
        informationLabel.verticalAlignmentMode = .center
        informationLabel.horizontalAlignmentMode = .center
        informationLabel.position = CGPoint(x: 0, y: -self.frame.height/3)
        self.addChild(informationLabel)
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
        
        var randomEdgeX: CGFloat = 0
        var randomEdgeY: CGFloat = 0
        for i in 1..<20 {
            let texture = SKTexture(imageNamed: "virus")
            //guard let nodeRandon = rects.randomElement() else {return}
            let virus = SKSpriteNode(texture: texture, size: CGSize(width: 30, height: 30))
            //let posIni = randomPosition(inFrame: nodeRandon.frame)
            virus.name = "virus"
            
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
            virusArray.append(virus)
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
        let pulseUp = SKAction.scale(to: 1.2, duration: 0.2)
        let pulseDown = SKAction.scale(to: 0.9, duration: 0.2)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        self.nodeImage.run(repeatPulse, withKey: "pulse")
        self.addChild(nodeImage)
        //configuring camera
        cameraNode.position = self.position
        self.addChild(cameraNode)
        self.camera = cameraNode
        informationLabel = SKLabelNode(text: "Swipe down until the heart is calmer and free from disease risks")
        informationLabel.fontSize = 16
        informationLabel.fontColor = .black
        informationLabel.fontName = "BalooChettan-Regular"
        informationLabel.verticalAlignmentMode = .center
        informationLabel.horizontalAlignmentMode = .center
        informationLabel.position = CGPoint(x: 0, y: -self.frame.height/3)
        self.addChild(informationLabel)
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
    
    class func shake(duration:CGFloat, amplitudeX:Int = 3, amplitudeY:Int = 3) -> SKAction {
        let numberOfShakes = duration / 0.015 / 2.0
        var actionsArray:[SKAction] = []
        for _ in 1...Int(numberOfShakes) {
            let dx = CGFloat(arc4random_uniform(UInt32(amplitudeX))) - CGFloat(amplitudeX / 2)
            let dy = CGFloat(arc4random_uniform(UInt32(amplitudeY))) - CGFloat(amplitudeY / 2)
            let forward = SKAction.moveBy(x: dx, y:dy, duration: 0.015)
            let reverse = forward.reversed()
            actionsArray.append(forward)
            actionsArray.append(reverse)
        }
        return SKAction.sequence(actionsArray)
    }
}


