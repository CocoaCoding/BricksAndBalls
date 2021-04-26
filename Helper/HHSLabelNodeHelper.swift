//
//  HHSLabelNodeHelper.swift
//  SwiftBricks
//
//  Created by Holger Hinzberg on 08.03.15.
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.
//

import Foundation
import SpriteKit

public class HHSLabelNodeHelper
{
    private var fontName:String
    
    init()
    {
        self.fontName = "EuphemiaUCAS-Bold"
    }
    
    public func GetLabelNode(text:String, fontSize:Double, color:SKColor) -> SKLabelNode
    {
        let label:SKLabelNode = SKLabelNode(fontNamed: self.fontName)
        label.text = text
        label.fontSize = CGFloat(fontSize)
        label.fontColor = color
        return label
    }
    
    public func SetFontName(font:String) -> ()
    {
        self.fontName = font
    }
}