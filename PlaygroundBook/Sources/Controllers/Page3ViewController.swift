//
//  Page2ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 21/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

class Page3ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {

    
    private lazy var pulse: Pulsing = {
        let pulse = Pulsing(numberOfPulses: .infinity, radius: 80, position: CGPoint.zero)
        pulse.animationDuration = 1
        pulse.backgroundColor = UIColor.blue.cgColor
        return pulse
    }()
    
    private lazy var imageHugging: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = true
        image.contentMode = .scaleAspectFit
        return image
    }()

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageHugging)
        setupConstraints()
        
    }
    
    
    override public func viewDidLayoutSubviews() {
      
    }
    
    private func setupConstraints(){
        imageHugging.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageHugging.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        imageHugging.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.4).isActive = true
        
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

extension Page3ViewController: PresentingProtocol{
    
    public func present(viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    public func dismiss(viewController: UIViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
}
