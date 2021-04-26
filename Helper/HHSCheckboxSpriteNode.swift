//
//  HHSCheckboxSpriteNode.swift
//  SwiftBricks
//
//  Created by Holger Hinzberg on 18.06.16.
//  Copyright © 2016 Holger Hinzberg. All rights reserved.
//

import Foundation

import Foundation
import SpriteKit

class HHSCheckboxSpriteNode: SKSpriteNode
{
    private let checkedImageName:String = "checkOn"
    private let uncheckedImageName:String = "checkOff"
    private var isChecked:Bool = false;
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }

    override init(texture: SKTexture!, color: UIColor, size: CGSize)
    {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(isChecked:Bool)
    {
        let texture = SKTexture(imageNamed: "checkOn")
        let size = texture.size()
        let color = UIColor()
        
        self.init(texture: texture, color: color, size: size)
        
        self.isChecked = isChecked;
        self.setTexture()
    }
 
    func toggle()
    {
        self.isChecked = !self.isChecked
        self.setTexture()
    }
        
    func setCheck(isChecked:Bool)
    {
        self.isChecked = isChecked
        self.setTexture()
    }
    
    func getCheck() -> Bool
    {
        return self.isChecked
    }
    
    private func setTexture()
    {
        var texture = SKTexture(imageNamed: checkedImageName)
        if self.isChecked == false
        {
            texture = SKTexture(imageNamed: uncheckedImageName)
        }
        self.texture = texture
    }
}
