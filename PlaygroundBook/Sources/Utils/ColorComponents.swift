//
//  ColorComponents.swift
//  Book_Sources
//
//  Created by Paloma Bispo on 22/03/19.
//

import Foundation
import UIKit
import SpriteKit


struct ColorComponents {
    var red:CGFloat
    var green:CGFloat
    var blue:CGFloat
    
    init(color:SKColor) {
        self.init()
        var alpha:CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    }
    
    init() {
        red = 0
        green = 0
        blue = 0
    }
}
