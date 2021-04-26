//  MessageLayerFactory.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 11.02.15.
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.

import Foundation
import SpriteKit

public class MessageLayerFactory
{
    private var theme : LevelTheme
    
    init(theme : LevelTheme) {
        self.theme = theme
    }
        
    public func createStartMessage(scene:SKScene, level:Level) -> SKNode
    {
        let messageLayer = SKNode()
        let labelNodeHelper = HHSLabelNodeHelper()
        
        let currentLevelLabel = labelNodeHelper.GetLabelNode(text: "Level \(level.levelNumber)", fontSize: 30, color: self.theme.primaryThemeColor)
        currentLevelLabel.physicsBody?.categoryBitMask = UICategory
        currentLevelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        currentLevelLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2 + 45);
        messageLayer.addChild(currentLevelLabel)
        
        let areYouReadyLabel = labelNodeHelper.GetLabelNode(text: "Are you ready?", fontSize: 30, color: self.theme.primaryThemeColor)
        areYouReadyLabel.physicsBody?.categoryBitMask = UICategory;
        areYouReadyLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        areYouReadyLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        messageLayer.addChild(areYouReadyLabel)

        let tapToStartLabel = labelNodeHelper.GetLabelNode(text: "Tap to start", fontSize: 30, color: self.theme.secondaryThemeColor)
        tapToStartLabel.physicsBody?.categoryBitMask = UICategory;
        tapToStartLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        tapToStartLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2 - 45)
        messageLayer.addChild(tapToStartLabel)
        
        messageLayer.zPosition = 100;
        return messageLayer;
    }
    
    public func createRestartMessage(scene:SKScene, level:Level) -> SKNode
    {
        let messageLayer = SKNode()
        let labelNodeHelper = HHSLabelNodeHelper()
        
        let currentLevelLabel = labelNodeHelper.GetLabelNode(text: "Oops!", fontSize: 30, color: self.theme.primaryThemeColor)
        currentLevelLabel.physicsBody?.categoryBitMask = UICategory
        currentLevelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        currentLevelLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2 + 45);
        messageLayer.addChild(currentLevelLabel)
        
        let areYouReadyLabel = labelNodeHelper.GetLabelNode(text: "You lost the ball!", fontSize: 30, color: self.theme.primaryThemeColor)
        areYouReadyLabel.physicsBody?.categoryBitMask = UICategory;
        areYouReadyLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        areYouReadyLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        messageLayer.addChild(areYouReadyLabel)
        
        let tapToStartLabel = labelNodeHelper.GetLabelNode(text: "Tap to go on", fontSize: 30, color: self.theme.secondaryThemeColor)
        tapToStartLabel.physicsBody?.categoryBitMask = UICategory;
        tapToStartLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        tapToStartLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2 - 45)
        messageLayer.addChild(tapToStartLabel)
        
        messageLayer.zPosition = 100;
        return messageLayer;
    }
    
    public func createAlternativeRestartMessage(scene:SKScene, level:Level) -> SKNode
    {
        let messageLayer = SKNode()
        let labelNodeHelper = HHSLabelNodeHelper()
        
        let currentLevelLabel = labelNodeHelper.GetLabelNode(text: "Be careful", fontSize: 30, color: self.theme.primaryThemeColor)
        currentLevelLabel.physicsBody?.categoryBitMask = UICategory
        currentLevelLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        currentLevelLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2 + 45);
        messageLayer.addChild(currentLevelLabel)
        
        let areYouReadyLabel = labelNodeHelper.GetLabelNode(text: "One ball left!", fontSize: 30, color: self.theme.primaryThemeColor)
        areYouReadyLabel.physicsBody?.categoryBitMask = UICategory;
        areYouReadyLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        areYouReadyLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        messageLayer.addChild(areYouReadyLabel)
        
        let tapToStartLabel = labelNodeHelper.GetLabelNode(text: "Tap to go on", fontSize: 30, color: self.theme.secondaryThemeColor)
        tapToStartLabel.physicsBody?.categoryBitMask = UICategory;
        tapToStartLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        tapToStartLabel.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2 - 45)
        messageLayer.addChild(tapToStartLabel)
        
        messageLayer.zPosition = 100;
        return messageLayer;
    }
}
