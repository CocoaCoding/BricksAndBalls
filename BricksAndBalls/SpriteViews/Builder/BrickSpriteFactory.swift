//  BrickSpriteFactory.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 26.01.15.
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.

import Foundation
import SpriteKit

class BrickSpriteFactory
{
    private var parentScene:SKScene
    
    init(scene:SKScene)
    {
        self.parentScene = scene
    }
    
    func getBrickSprite(brickItem:BrickItem) -> HHSSpriteNode?
    {
        var brick:HHSSpriteNode?
        
        if brickItem.color == .Red
        {
            brick = HHSSpriteNode(imagename: "brick_red")
        }
        else if brickItem.color == .Blue
        {
            brick = HHSSpriteNode(imagename: "brick_blue")
        }
        else if brickItem.color == .Green
        {
            brick = HHSSpriteNode(imagename: "brick_green")
        }
        else if brickItem.color == .Orange
        {
            brick = HHSSpriteNode(imagename: "brick_orange")
        }
        else if brickItem.color == .Yellow
        {
            brick = HHSSpriteNode(imagename: "brick_yellow")
        }
        else if brickItem.color == .Pink
        {
            brick = HHSSpriteNode(imagename: "brick_pink")
        }
        else if brickItem.color == .Purple
        {
            brick = HHSSpriteNode(imagename: "brick_purple")
        }
        else if brickItem.color == .Lime
        {
            brick = HHSSpriteNode(imagename: "brick_lime")
        }
        else if brickItem.color == .Citrus
        {
            brick = HHSSpriteNode(imagename: "brick_citrus")
        }
        else if brickItem.color == .Cyan
        {
            brick = HHSSpriteNode(imagename: "brick_cyan")
        }
        else if brickItem.color == .Strawberry
        {
            brick = HHSSpriteNode(imagename: "brick_strawberry")
        }
        else if brickItem.color == .Blueberry
        {
            brick = HHSSpriteNode(imagename: "brick_blueberry")
        }
        else if brickItem.color == .Silver
        {
            brick = HHSSpriteNode(imagename: "brick_silver")
        }
        else if brickItem.color == .Sky
        {
            brick = HHSSpriteNode(imagename: "brick_sky")
        }
        else if brickItem.color == .Rainbow
        {
            brick = HHSSpriteNode(imagename: "brick_rainbow")
        }
        
        brick?.score = 10
        
        if brickItem.behavior == .Blink
        {
            brick?.score = 15
            brick?.hitsCount = 2
            let col1 = UIColor.colorWithHexString(hex: "#78A942")
            let col2 = UIColor.colorWithHexString(hex: "#0A7BFF")
            brick?.spriteAction = SpriteActions.getBlinkAction(firstColor: col1, secondColor: col2)
        }
        else if brickItem.behavior == .MoveLeft
        {
            brick?.score = 20
            brick?.hitsCount = 1
            brick?.spriteAction = SpriteActions.getMoveAction(sprite: brick!, time:1.8, direction: SpriteMoveDirection.Left, parentScene:  self.parentScene)
        }
        else if brickItem.behavior == .MoveRight
        {
            brick?.score = 20
            brick?.hitsCount = 1
            brick?.spriteAction = SpriteActions.getMoveAction(sprite: brick!, time:1.8, direction: SpriteMoveDirection.Right, parentScene: self.parentScene)
        }
            /*
        else if brickBehavoir == "moveLB"
        {
            brick?.score = 20
            brick?.hitsCount = 3
            brick?.spriteAction = self.GetMoveAction(sprite: brick!, time:1.8, direction: SpriteMoveDirection.Left)
        }
        else if brickBehavoir == "moveRB"
        {
            brick?.score = 20
            brick?.hitsCount = 3
            brick?.spriteAction = self.GetMoveAction(sprite: brick!, time:1.8, direction: SpriteMoveDirection.Right)
        }
        */
        else if brickItem.behavior == .Wiggle
        {
            brick?.score = 25
            brick?.hitsCount = 1
            brick?.spriteAction = SpriteActions.getWiggleAction(sprite: brick!, time:0.5)
        }
        else if brickItem.behavior == .LittleWiggle
        {
            brick?.score = 20
            brick?.hitsCount = 1
            brick?.spriteAction = SpriteActions.getLittleWiggleAction(sprite: brick!, time:1.0)
        }
        else if brickItem.behavior == .Rotate
        {
            brick?.score = 30
            brick?.hitsCount = 1
            brick?.spriteAction = SpriteActions.getRotateAction(sprite: brick!, time:2.0)
        }
            
         if brickItem.gameEvent != .None
         {
            brick?.gameEvent = brickItem.gameEvent
         }
        
        if let brick = brick
        {
            brick.physicsBody = SKPhysicsBody(rectangleOf: brick.frame.size)
            brick.physicsBody?.categoryBitMask = BrickCategory
            brick.physicsBody?.contactTestBitMask = BallCategory
            brick.physicsBody?.isDynamic = false
        }
        return brick
    }
}
