//
//  SpriteActions.swift
//  SwiftBricks
//
//  Created by Holger Hinzberg on 31.10.20.
//  Copyright © 2020 Holger Hinzberg. All rights reserved.
//

import SpriteKit

class SpriteActions
{
    static func getRotateAction(sprite:HHSSpriteNode, time:Double) -> SKAction
    {
        let radians = CGFloat(360.0 * 0.0174532925)
        let m1 = SKAction.rotate(byAngle: radians, duration: time)
        let move = SKAction.repeatForever(m1)
        return move
    }
    
    static func getWiggleAction(sprite:HHSSpriteNode, time:Double) -> SKAction
    {
        let m1 = SKAction.rotate(toAngle: 0.3, duration: time)
        let m2 = SKAction.rotate(toAngle: -0.3, duration: time)
        let group = SKAction.sequence([m1 , m2])
        let move = SKAction.repeatForever(group)
        return move
    }
    
    static func getLittleWiggleAction(sprite:HHSSpriteNode, time:Double) -> SKAction
    {
        let m1 = SKAction.rotate(toAngle: 0.1, duration: time)
        let m2 = SKAction.rotate(toAngle: -0.1, duration: time)
        let group = SKAction.sequence([m1 , m2])
        let move = SKAction.repeatForever(group)
        return move
    }
    
    
    static func getMoveAction(sprite:HHSSpriteNode, time:Double, direction:SpriteMoveDirection, parentScene:SKScene) -> SKAction
    {
        let sceneWidth : CGFloat = parentScene.size.width
        var widthOffset : CGFloat = 0
        
        if parentScene.size.width > 320
        {
            widthOffset = (parentScene.size.width - 320) / 2
        }
        
        let maxRightPosition = sceneWidth - ( sprite.size.width / 2.0) - 1 - widthOffset
        let minLeftPosition = ( sprite.size.width / 2.0) + 2 + widthOffset
        
        let moveAction1 = SKAction.moveTo(x: maxRightPosition, duration: time)
        let moveAction2 = SKAction.moveTo(x: minLeftPosition , duration: time)
        
        var actionGroup = SKAction()
        if direction == .Left
        {
            actionGroup = SKAction.sequence([moveAction2 , moveAction1])
        }
        else
        {
            actionGroup = SKAction.sequence([moveAction1 , moveAction2])
        }
        
        let move = SKAction.repeatForever(actionGroup)
        return move
    }
    
    
    static func getBlinkAction(firstColor:SKColor, secondColor:SKColor) -> SKAction
    {
        let timeToRun = 0.5
        
        let action1 = SKAction.customAction(withDuration: timeToRun, actionBlock: { (node:SKNode!, elapsedTime: CGFloat) -> Void in
            let n = node as! SKSpriteNode
            n.color = firstColor
            n.colorBlendFactor = 1.0
            n.texture = nil
        })
        
        let action2 = SKAction.customAction(withDuration: timeToRun, actionBlock: { (node:SKNode!, elapsedTime: CGFloat) -> Void in
            let n = node as! SKSpriteNode
            n.color = secondColor
            n.colorBlendFactor = 1.0
            n.texture = nil
        })
    
        let group = SKAction.sequence([action2, action1])
        let pulse = SKAction.repeatForever(group)
        return pulse
     }
    
}
