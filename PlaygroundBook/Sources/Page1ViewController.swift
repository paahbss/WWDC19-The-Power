//
//  GameViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 19/03/19.
//

import UIKit
import SpriteKit

class Page1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = SKView(frame: view.frame)
        guard let skview = self.view as? SKView else { return }
        let sizeScene = UIScreen.main.bounds.size
        let gameScene = GameScene.init(size: sizeScene)
        gameScene.presentingProtocol = self
        gameScene.scaleMode = .resizeFill
        skview.presentScene(gameScene)
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
