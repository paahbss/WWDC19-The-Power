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
    let marginUp: CGFloat = 20
    let marginSide: CGFloat = 20
    let spacingBetween: CGFloat = 30
    var delegatePresenting: PresentingProtocol!
    var isFirstClicked = true
    
    
    override public func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0, y: 1)
        peopleSetup()
    }
    
    
    func updatePosition(){
        guard let widthView = self.view?.frame.width, let heightView = self.view?.frame.height else {return}
        
        let widthNode = (widthView - (marginUp + marginSide) - (spacingBetween * CGFloat(numPeopleCol-1)))/CGFloat(numPeopleCol)
        let heightNode = (heightView - (marginUp + marginSide) - (spacingBetween * CGFloat(numPeopleRow-1)))/CGFloat(numPeopleRow)
        
        let nodeSize = CGSize(width: widthNode, height: heightNode)
        var texture = SKTexture()
        var textureCount = 0
        for i in 0..<numPeopleCol{
            for j in 0..<numPeopleRow{
                let nodeRemoved = peopleNodes[i][j]
                nodeRemoved.removeFromParent()
                let textureName = isFirstClicked ? "people\(textureCount)b" : "people\(textureCount)"
                texture = SKTexture(imageNamed: textureName)
                let node = SKSpriteNode(texture: texture, size: nodeSize)
                //let node = SKSpriteNode(color: .blue, size: nodeSize)
                let x = marginSide + nodeSize.width * CGFloat(i) + spacingBetween * CGFloat(i)
                let y = -(marginUp + nodeSize.height * CGFloat(j) + spacingBetween * CGFloat(j))
                node.position = CGPoint(x: x, y: y)
                node.anchorPoint = CGPoint(x: 0, y: 1)
                peopleNodes[i][j] = node
                node.name = "\(textureCount)"
                textureCount += 1
                addChild(node)
            }
        }
    }
    
    private func peopleSetup(){
        
        guard let widthView = self.view?.frame.width, let heightView = self.view?.frame.height else {return}
        
        let widthNode = (widthView - (marginUp + marginSide) - (spacingBetween * CGFloat(numPeopleCol-1)))/CGFloat(numPeopleCol)
        let heightNode = (heightView - (marginUp + marginSide) - (spacingBetween * CGFloat(numPeopleRow-1)))/CGFloat(numPeopleRow)
        
        let frameSize = CGSize(width: widthNode, height: heightNode)
        
        var texture = SKTexture()
        var textureCount = 0
        
        for i in 0..<numPeopleCol{
            peopleNodes.append([])
            for j in 0..<numPeopleRow{
                peopleNodes[i].append(SKSpriteNode())
                let textureName = isFirstClicked ? "people\(textureCount)b" : "people\(textureCount)"
                texture = SKTexture(imageNamed: textureName)
                let node = SKSpriteNode(texture: texture, size: frameSize)
                let x = marginSide + frameSize.width * CGFloat(i) + spacingBetween * CGFloat(i)
                let y = -(marginUp + frameSize.height * CGFloat(j) + spacingBetween * CGFloat(j))
                node.position = CGPoint(x: x, y: y)
                node.anchorPoint = CGPoint(x: 0, y: 1)
                addChild(node)
                peopleNodes[i][j] = node
                node.name = "\(textureCount)"
                textureCount += 1
            }
        }
    }
    
    private func handle(touch: UITouch, inNode node: SKSpriteNode){
        guard let nodeName = node.name else {return}
        let textureName = "people" + nodeName
        let texture = SKTexture(imageNamed: textureName)
        node.texture = texture
        if isFirstClicked{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let information = InformationViewController()
                information.modalPresentationStyle = .custom
                self.configure(controller: information, basedInNode: node)
                self.delegatePresenting.present(viewController: information)
            }
        }else{
            let information = InformationViewController()
            information.modalPresentationStyle = .custom
            self.configure(controller: information, basedInNode: node)
            self.delegatePresenting.present(viewController: information)
        }  
    }
    
    private func configure(controller: UIViewController, basedInNode node: SKSpriteNode){
        guard let cgImageTouched = node.texture?.cgImage(), let vc = controller as? InformationViewController, let nodeName = node.name, let index = Int(nodeName) else {return}
        vc.image.image = UIImage(cgImage: cgImageTouched)
        vc.informationHug.text = vc.information[index]
        vc.titleHug.text = vc.hugsName[index]
        
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let possition = touch.location(in: self)
            guard let nodeTouched = self.nodes(at: possition).first as? SKSpriteNode else {return}
            peopleNodes.forEach { (nodeRow) in
                nodeRow.forEach({ (node) in
                    if node == nodeTouched{
                        handle(touch: touch, inNode: node)
                    }
                })
            }
        }
    }
}
