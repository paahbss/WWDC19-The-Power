//
//  PresentingProtocol.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 19/03/19.
//

import Foundation
import SpriteKit
import UIKit

public protocol PresentingProtocol {
    func present(viewController: UIViewController)
    func dismiss(viewController: UIViewController)
    func changeTo(scene: SKScene)
}
