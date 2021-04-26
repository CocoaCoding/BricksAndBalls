//  BrickItem.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 13.08.18.
//  Copyright © 2018 Holger Hinzberg. All rights reserved.

// Definition for a single Brick

import Foundation

public struct BrickItem
{
    var color = BrickColor.None
    var behavior = BrickBehavior.None
    var gameEvent = GameEvent.None

    // Convenience
    init( color : BrickColor)
    {
        self.init(color: color, behavior: .None)
    }
    
    // Convenience
    init( color : BrickColor , behavior : BrickBehavior)
    {
        self.init(color: color, behavior: behavior, event: .None)
    }
        
    // Designated
    init( color : BrickColor , behavior : BrickBehavior, event : GameEvent)
    {
        self.behavior = behavior
        self.gameEvent = event
        self.color = color
    }
    
    static func ConvertColorCode(colorCode: String) -> BrickColor
    {
        var color = BrickColor.None
        
        if colorCode == "-"
        {
            color = .None
        }
        else if colorCode == "r"
        {
            color = .Red
        }
        else if colorCode == "o"
        {
            color = .Orange
        }
        else if colorCode == "y"
        {
            color = .Yellow
        }
        else if colorCode == "b"
        {
            color = .Blue
        }
        else if colorCode == "g"
        {
            color = .Green
        }
        else if colorCode == "p"
        {
            color = .Pink
        }
        else if colorCode == "u"
        {
            color = .Purple
        }
        else if colorCode == "l"
        {
            color = .Lime
        }
        else if colorCode == "c"
        {
            color = .Cyan
        }
        else if colorCode == "u"
        {
            color = .Citrus
        }
        else if colorCode == "k"
        {
            color = .Sky
        }
        else if colorCode == "rb"
        {
            color = .Rainbow
        }
        else if colorCode == "v"
        {
            color = .Silver
        }
        else if colorCode == "e"
        {
            color = .Blueberry
        }
        else if colorCode == "a"
        {
            color = .Strawberry
        }
        return color
    }
    
}


