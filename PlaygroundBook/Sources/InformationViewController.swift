//
//  InformationViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 19/03/19.
//

import UIKit
import PlaygroundSupport

public class InformationViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let informationLabel: UILabel = {
        let label = UILabel()
        label.text = "Swipe down to close"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let informationHug: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let arrowDown: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(named: "arrow")
        arrow.contentMode = .scaleAspectFit
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeDismiss))
        swipe.direction = .down
        self.view.addGestureRecognizer(swipe)
        view.addSubview(informationLabel)
        view.addSubview(image)
        view.addSubview(arrowDown)
        view.backgroundColor = .clear
        constraintsSetup()
        blurSetup()
    }
    
    private func blurSetup(){
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
    }
    
    private func constraintsSetup(){
        if let superview = image.superview{
            //print(liveViewSafeAreaGuide.)
            image.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            image.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: -100).isActive = true
            image.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 0.4).isActive = true
            image.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.35).isActive = true
            arrowDown.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            arrowDown.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor).isActive = true
            informationLabel.centerXAnchor.constraint(equalTo: liveViewSafeAreaGuide.centerXAnchor).isActive = true
            informationLabel.bottomAnchor.constraint(equalTo: arrowDown.topAnchor, constant: 10).isActive = true
        }
    }
    
    
    @objc func swipeDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    //    override func viewDidLoad() {
    //        view.backgroundColor = .clear
    //        let blurEffect = UIBlurEffect(style: .light)
    //        let blurView = UIVisualEffectView(effect: blurEffect)
    //        blurView.translatesAutoresizingMaskIntoConstraints = false
    //        view.insertSubview(blurView, at: 0)
    //        NSLayoutConstraint.activate([
    //            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
    //            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
    //            ])
    //    }
    
}


extension InformationViewController: ImageProtocol {
    
    public func imageTouched(cgImage: CGImage) {
        self.image.image = UIImage(cgImage: cgImage)
        self.informationLabel.text = "paloma"
    }
    
    
}
