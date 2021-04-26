//  Level.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 01.11.20.
//  Copyright © 2020 Holger Hinzberg. All rights reserved.

// Ein Level setzt sich zusammen aus den Bricks und dem Theme

import UIKit

public class Level
{
    var levelNumber = 0
    var bricks = LevelBricks()
    var theme = LevelTheme()
    
    init(levelNumber : Int) {
        self.levelNumber = levelNumber
    }
}
