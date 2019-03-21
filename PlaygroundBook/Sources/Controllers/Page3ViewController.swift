//
//  Page2ViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 21/03/19.
//

import UIKit
import SpriteKit
import PlaygroundSupport

public class Page3ViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {

    
    private lazy var pulse: Pulsing = {
        let pulse = Pulsing(numberOfPulses: .infinity, radius: 80, position: CGPoint.zero)
        pulse.animationDuration = 1
        pulse.backgroundColor = UIColor.blue.cgColor
        return pulse
    }()
    
    private lazy var imageHugging: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "people3")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 255/255, green: 248/255, blue: 248/255, alpha: 1.0)
        self.contentView.addSubview(imageHugging)
        view.addSubview(contentView)
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        contentView.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: liveViewSafeAreaGuide.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: liveViewSafeAreaGuide.trailingAnchor).isActive = true
        imageHugging.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        imageHugging.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        imageHugging.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.5).isActive = true
        imageHugging.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.5).isActive = true
        
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
