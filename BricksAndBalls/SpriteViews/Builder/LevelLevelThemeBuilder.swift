//  LevelBorderBuilder.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 09.04.16.
//  Copyright © 2016 Holger Hinzberg. All rights reserved.

import Foundation
import SpriteKit

public class LevelThemeBuilder
{
    private var parentScene:SKScene
    // Spielfeld Rand
    private var paddings = EdgePaddings()
   
    public init(scene:SKScene, paddings:EdgePaddings)
    {
        self.paddings = paddings
        self.parentScene = scene
    }
    
    public func buildLevel(currentTheme:LevelTheme)
    {
        self.parentScene.backgroundColor = currentTheme.backgroundColor
        //self.addBorders(currentTheme: currentTheme)
        self.addBottomGap(currentTheme: currentTheme)
    }
    
    // Der Rahmen (unused)
    private func addBorders(currentTheme:LevelTheme)
    {
        let borderColor = currentTheme.borderColor

        let height:CGFloat = self.parentScene.size.height - self.paddings.top
        let width:CGFloat = self.parentScene.size.width
        let horizontalWidth = width - 2
        
        // Top Border
        let sizeTopBorder = CGSize(width: horizontalWidth, height: 2)
        let yPosTopBorder:CGFloat = height
        let xPosTopBorder:CGFloat = width / 2
        let topBorderSprite = SKSpriteNode(color: borderColor , size: sizeTopBorder)
        topBorderSprite.position = CGPoint(x: xPosTopBorder, y: yPosTopBorder)
        topBorderSprite.physicsBody = SKPhysicsBody(rectangleOf: topBorderSprite.frame.size)
        topBorderSprite.physicsBody?.isDynamic = false
        topBorderSprite.physicsBody?.categoryBitMask = UICategory
        topBorderSprite.physicsBody?.contactTestBitMask = BallCategory
        self.parentScene.addChild(topBorderSprite)
                
        // Bottom Border
        let sizeBottomBorder = CGSize(width: horizontalWidth, height: 2)
        let yPosBottomBorder:CGFloat = self.paddings.botton
        let xPosBottomBorder:CGFloat = width / 2
        let bottomBorderSprite = SKSpriteNode(color: borderColor , size: sizeBottomBorder)
        bottomBorderSprite.position = CGPoint(x: xPosBottomBorder, y: yPosBottomBorder)
        bottomBorderSprite.physicsBody = SKPhysicsBody(rectangleOf: bottomBorderSprite.frame.size)
        bottomBorderSprite.physicsBody?.isDynamic = false
        bottomBorderSprite.physicsBody?.categoryBitMask = UICategory
        bottomBorderSprite.physicsBody?.contactTestBitMask = BallCategory
        self.parentScene.addChild(bottomBorderSprite)
        
        // Left Border
        let sizeLeftBorder = CGSize(width: 2, height: height)
        let yPosLeftBorder:CGFloat = height / 2
        let xPosLeftBorder:CGFloat = self.paddings.left
        let leftBorderSprite = SKSpriteNode(color: borderColor , size: sizeLeftBorder)
        leftBorderSprite.position = CGPoint(x: xPosLeftBorder, y: yPosLeftBorder)
        leftBorderSprite.physicsBody = SKPhysicsBody(rectangleOf: leftBorderSprite.frame.size)
        leftBorderSprite.physicsBody?.isDynamic = false
        leftBorderSprite.physicsBody?.categoryBitMask = UICategory
        leftBorderSprite.physicsBody?.contactTestBitMask = BallCategory
        self.parentScene.addChild(leftBorderSprite)
        
        // Right Border
        let sizeRightBorder = CGSize(width: 2, height: height)
        let yPosRightBorder:CGFloat = height / 2
        let xPosRightBorder:CGFloat = width - self.paddings.right
        let rightBorderSprite = SKSpriteNode(color: borderColor , size: sizeRightBorder)
        rightBorderSprite.position = CGPoint(x: xPosRightBorder, y: yPosRightBorder)
        rightBorderSprite.physicsBody = SKPhysicsBody(rectangleOf: rightBorderSprite.frame.size)
        rightBorderSprite.physicsBody?.isDynamic = false
        rightBorderSprite.physicsBody?.categoryBitMask = UICategory
        rightBorderSprite.physicsBody?.contactTestBitMask = BallCategory
        self.parentScene.addChild(rightBorderSprite)
    }
    
    //Die Lücke am unteren Rand
    // Breite und Farbe ist levelspezifisch
    private func addBottomGap(currentTheme:LevelTheme)
    {
        var gapWidth = currentTheme.gapWidth
        
        // Sprite Vergrößerung, abhängig vom Bildschirm
        let spriteScaleMultiplicator = SpriteScaleMultiplicator.shared.getScaleMultiplicator(width: self.parentScene.size.width)
        if spriteScaleMultiplicator > 0 {
            gapWidth = gapWidth * spriteScaleMultiplicator
        }
                
        let size = CGSize(width: gapWidth, height: 3)
        let gap = SKSpriteNode(color: currentTheme.gapColor , size: size)
        gap.position = CGPoint(x: self.parentScene.size.width/2, y:  self.paddings.botton)
        gap.physicsBody = SKPhysicsBody(rectangleOf: gap.frame.size)
        gap.physicsBody?.isDynamic = false
        gap.physicsBody?.categoryBitMask = GapCategory
        gap.physicsBody?.contactTestBitMask = BallCategory
        self.parentScene.addChild(gap)
    }    
}
