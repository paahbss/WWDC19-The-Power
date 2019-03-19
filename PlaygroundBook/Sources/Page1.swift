//
//  Page1.swift
//  ThePower
//
//  Created by Paloma Bispo on 19/03/19.
//

import UIKit
import SpriteKit

public class Page1: SKScene {
    
    var peopleNodes: [[SKSpriteNode]] = []
    let numPeopleCol = 2
    let numPeopleRow = 2
    let margin: CGFloat = 20
    let spacingBetween: CGFloat = 40
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0, y: 1)
        peopleSetup()
    }
    
    
    func updatePosition(){
        guard let widthView = self.view?.frame.width, let heightView = self.view?.frame.height else {return}
        
        let widthNode = (widthView - (2*margin) - (spacingBetween * CGFloat(numPeopleCol-1)))/CGFloat(numPeopleCol)
        let heightNode = (heightView - (2*margin) - (spacingBetween * CGFloat(numPeopleRow-1)))/CGFloat(numPeopleRow)
        
        let nodeSize = CGSize(width: widthNode, height: heightNode)
        
        for i in 0..<numPeopleCol{
            for j in 0..<numPeopleRow{
                let nodeRemoved = peopleNodes[i][j]
                nodeRemoved.removeFromParent()
                let node = SKSpriteNode(color: .blue, size: nodeSize)
                let x = margin + nodeSize.width * CGFloat(i) + spacingBetween * CGFloat(i)
                let y = -(margin + nodeSize.height * CGFloat(j) + spacingBetween * CGFloat(j))
                node.position = CGPoint(x: x, y: y)
                node.anchorPoint = CGPoint(x: 0, y: 1)
                peopleNodes[i][j] = node
                addChild(node)
            }
        }
    }
    
    private func peopleSetup(){
        //        let numPeopleCol = 2
        //        let numPeopleRow = 2
        //        let margin: CGFloat = 20
        //        let spacingBetween: CGFloat = 40
        
        guard let widthView = self.view?.frame.width, let heightView = self.view?.frame.height else {return}
        
        let widthNode = (widthView - (2*margin) - (spacingBetween * CGFloat(numPeopleCol-1)))/CGFloat(numPeopleCol)
        let heightNode = (heightView - (2*margin) - (spacingBetween * CGFloat(numPeopleRow-1)))/CGFloat(numPeopleRow)
        
        let frameSize = CGSize(width: widthNode, height: heightNode)
        
        for i in 0..<numPeopleCol{
            peopleNodes.append([])
            for j in 0..<numPeopleRow{
                peopleNodes[i].append(SKSpriteNode())
                let node = SKSpriteNode(color: .blue, size: frameSize)
                let x = margin + frameSize.width * CGFloat(i) + spacingBetween * CGFloat(i)
                let y = -(margin + frameSize.height * CGFloat(j) + spacingBetween * CGFloat(j))
                node.position = CGPoint(x: x, y: y)
                node.anchorPoint = CGPoint(x: 0, y: 1)
                addChild(node)
                peopleNodes[i][j] = node
            }
            //let texture = SKTexture(imageNamed: "people\(i)")
            //let node = SKSpriteNode(texture: texture)
            //            let node = SKSpriteNode(color: .blue, size: frameSize)
            //            let x = margin + frameSize.width * CGFloat(i)
            //            let y = margin + frameSize.height * CGFloat(i)
            //            node.position = CGPoint(x: x, y: y)
            //            node.anchorPoint = CGPoint(x: 0, y: 1)
            //            addChild(node)
            //            peopleNodes.append(node)
            //node.size = frameSize
            
        }
    }
    
    private func handle(touch: UITouch){
        
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let possition = touch.location(in: self)
            guard let nodeTouched = self.nodes(at: possition).first as? SKSpriteNode else {return}
            peopleNodes.forEach { (nodeRow) in
                nodeRow.forEach({ (node) in
                    if node == nodeTouched{
                        handle(touch: touch)
                    }
                })
            }
        }
    }
}
