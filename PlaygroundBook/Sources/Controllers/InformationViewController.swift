//
//  InformationViewController.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 19/03/19.
//

import UIKit
import PlaygroundSupport

public class InformationViewController: UIViewController, PlaygroundLiveViewSafeAreaContainer {
    
    let hugsName: [Int: String] = [2: "Bear Hug", 3: "Hug From Behind", 1: "Side Hug", 0: "Hug of Hearts Together"]
    let information = [2: "That hug that shows the affection and closeness of those who started the embrace", 3: "That embrace given on the beloved person to demonstrate that she is safe and protected in our arms", 1: "When we give that hug very quickly in the person who is on the side", 0: "When you lean on the other person's chest asking for support in times of sadness and stress"]
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let swipeDownLabel: UILabel = {
        let label = UILabel()
        label.text = "Swipe down to close"
        label.font = UIFont(name: "BalooChettan-Regular", size: 12)
        label.textColor = UIColor(red: 29/255, green: 38/255, blue: 49/255, alpha: 1.0)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let informationHug: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleHug: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BalooChettan-Regular", size: 20)
        label.text = ""
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let arrowDown: UIImageView = {
        let arrow = UIImageView()
        arrow.image = UIImage(named: "arrow.png")
        arrow.contentMode = .scaleAspectFit
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismissGestutre))
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissGestutre))
        swipe.direction = .down
        self.view.addGestureRecognizer(swipe)
        view.addSubview(swipeDownLabel)
        view.addSubview(titleHug)
        view.addSubview(informationHug)
        view.addSubview(image)
        view.addSubview(arrowDown)
        view.backgroundColor = .clear
        constraintsSetup()
        blurSetup()
    }
    
    public override func viewDidLayoutSubviews() {
        view.layoutIfNeeded()
    }
    
    private func blurSetup(){
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.frame
        self.view.insertSubview(blurEffectView, at: 0)
    }
   
    private func constraintsSetup(){
//        view.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor).isActive = true
//        view.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor).isActive = true
//        view.leadingAnchor.constraint(equalTo: liveViewSafeAreaGuide.leadingAnchor).isActive = true
//        view.trailingAnchor.constraint(equalTo: liveViewSafeAreaGuide.trailingAnchor).isActive = true
        if let superview = image.superview{
            //print(liveViewSafeAreaGuide.)
            image.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            image.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: -100).isActive = true
            image.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: 0.5).isActive = true
            image.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: 0.45).isActive = true
            arrowDown.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            arrowDown.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -53).isActive = true
            arrowDown.heightAnchor.constraint(equalToConstant: 100).isActive = true
            arrowDown.widthAnchor.constraint(equalToConstant: 100).isActive = true
            swipeDownLabel.centerXAnchor.constraint(equalTo: arrowDown.centerXAnchor).isActive = true
            swipeDownLabel.bottomAnchor.constraint(equalTo: arrowDown.topAnchor, constant: -10).isActive = true
            informationHug.centerXAnchor.constraint(equalTo: arrowDown.centerXAnchor).isActive = true
        informationHug.leadingAnchor.constraint(greaterThanOrEqualTo: superview.leadingAnchor, constant: 50).isActive = true
        informationHug.trailingAnchor.constraint(greaterThanOrEqualTo: superview.trailingAnchor, constant: -50).isActive = true
            informationHug.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 40).isActive = true
            titleHug.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -30).isActive = true
            titleHug.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
            titleHug.bottomAnchor.constraint(equalTo: image.topAnchor, constant: 20).isActive = true
            //

        }
    }
    
    
    @objc func dismissGestutre() {
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

