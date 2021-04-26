//  LevelBuilder.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 26.01.15.
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.

import Foundation
import SpriteKit

public class LevelBricksBuilder
{
    private var parentScene:SKScene
    private var brickFactory:BrickSpriteFactory
    // Spielfeld Rand oben
    private var paddings = EdgePaddings()
    
    public init(scene:SKScene, paddings:EdgePaddings)
    {
        self.parentScene = scene
        self.paddings = paddings
        self.brickFactory = BrickSpriteFactory(scene: self.parentScene)
    }
    
    public func buildLevel(currentBricks:LevelBricks) -> Int
    {
        let bricksCount =  self.addBricks(currentBricks: currentBricks)
        return bricksCount
    }
    
    // Erzeugt die Bricks, gibt die Anzahl der Bricks zurück
    private func addBricks(currentBricks:LevelBricks) -> Int
    {
        var bricksCount = 0
        let fadeIn:SKAction = SKAction.fadeIn(withDuration: 0.5)
        
        // Der Abstand von Links
        // kann vermutlich auch bei anderen Geräten unterschiedlich sein
        var offsetLeft:CGFloat = 3
        
        // Sprite Vergrößerung, abhängig vom Bildschirm
        let spriteScaleMultiplicator = SpriteScaleMultiplicator.shared.getScaleMultiplicator(width: self.parentScene.size.width)
                
        // Abstand der Bricks untereinander
        let brickDistance:CGFloat = 2
                
        if spriteScaleMultiplicator > 0
        {
            offsetLeft = offsetLeft * spriteScaleMultiplicator
        }
        
        var row = 0
        for levelRow in currentBricks.Rows
        {
            var columnInRow = 0
            for item:BrickItem in levelRow.BrickItems
            {
                let brick:HHSSpriteNode? = self.brickFactory.getBrickSprite(brickItem: item)
                
                // Habe ich einen Brick? Kann ja auch ein Platzhalter sein!
                if let brick = brick
                {
                    if spriteScaleMultiplicator > 0
                    {
                        // Vergrößern wenn nötig
                        brick.setScale(spriteScaleMultiplicator)
                    }
                    
                    let brickWidth:CGFloat = brick.size.width
                    let brickHeight:CGFloat = brick.size.height
                    
                    let xPos:CGFloat = offsetLeft + brickDistance + (brickWidth / 2) + (brickWidth + 3) * CGFloat(columnInRow)
                    let rowHeightOffset = CGFloat(brickHeight + brickDistance) * CGFloat(row)
                    let distanceOffset:CGFloat = 14 // Nicht ganz klar warum
                    let yPos:CGFloat = self.parentScene.size.height - self.paddings.top -  rowHeightOffset -  distanceOffset
                    
                    brick.position = CGPoint(x: xPos, y: yPos)
                    brick.alpha = 0
                    
                    self.parentScene.addChild(brick)
                    brick.run(fadeIn)
                    bricksCount += 1
                    
                    if brick.spriteAction != nil
                    {
                        brick.run(brick.spriteAction!)
                    }
                }
                columnInRow += 1
            }
            row += 1
        }
        return bricksCount
    }
}
