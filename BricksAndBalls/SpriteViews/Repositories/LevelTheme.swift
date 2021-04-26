//  Level.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 08.04.17.
//  Copyright © 2017 Holger Hinzberg. All rights reserved.

import SpriteKit

public class LevelTheme
{
    // Hintergrundfarbe des Spielfelder
    var backgroundColor:SKColor
    // Spielfeldrahmenfarbe
    var borderColor:SKColor
    // Hintergrund ausserhalb des Rahmens
    var fillingColor: SKColor
    // Breite der Lücke unten
    var gapWidth:CGFloat
    // Farbe der Lücke
    var gapColor:SKColor
    // Größe des Paddle
    var paddleSize:CGSize
    // Abstand des Paddle von unten
    var paddleBottomOffset:CGFloat
    
    var primaryThemeColor:SKColor
    var secondaryThemeColor:SKColor
    var ballRadius:CGFloat
        
    init()
    {
        self.backgroundColor = SKColor.black
        self.borderColor = SKColor.red
        self.fillingColor = SKColor.black
        self.gapWidth = CGFloat(100)
        self.gapColor = SKColor.white
        self.paddleSize = CGSize(width: 80, height: 10)
        self.ballRadius = 6
        self.paddleBottomOffset = 80
        self.primaryThemeColor = SKColor.blue
        self.secondaryThemeColor = SKColor.yellow
    }
}
