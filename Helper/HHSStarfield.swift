//
//  HHSStarfield.swift
//  SwiftBricks
//
//  Created by Holger Hinzberg on 23.12.14.
//  Copyright (c) 2014 Holger Hinzberg. All rights reserved.
//

import Foundation
import SpriteKit

public class HHSStarfield
{
    // Public
    public var withColorStars:Bool = false
    public var withTransparentStars:Bool = false
    public var withRotation:Bool = false
    public var suspendEmission:Bool = false // Die Generierung neuer Sterne aussetzen
    public var emissionInterval:Double = 0.15
    public var smallImageName:String
    public var bigImageName:String
    public var zPosition:CGFloat = 1
    // Private
    private var parentScene:SKScene
    private var lastEmission:TimeInterval?
    
    init(scene:SKScene)
    {
        self.parentScene = scene
        self.smallImageName = "snowBrickSmall"
        self.bigImageName = "snowBrickBig"
    }
    
    public func runEmitter(currentTime:CFTimeInterval)
    {
        if self.suspendEmission == true
        {
            return
        }
                
        var timeSinceLastEmission:CFTimeInterval = currentTime
        if self.lastEmission != nil
        {
            timeSinceLastEmission = currentTime - self.lastEmission!
        }
        
        if timeSinceLastEmission > self.emissionInterval
        {
            self.lastEmission = currentTime
            let xSeedPosition:CGFloat = CGFloat(arc4random_uniform(UInt32(self.parentScene.size.width)))
            let starType:Int = Int(arc4random_uniform(10))
            
            var starSprite:SKSpriteNode?
            starSprite?.zPosition = self.zPosition
            
            var velocity:CGFloat = 220.0/1.0
            
            if starType > 1 && starType < 8
            {
                starSprite = SKSpriteNode(imageNamed: self.smallImageName)
                velocity = CGFloat(arc4random_uniform(200) + 100)
            }
            else if starType >= 8
            {
                starSprite = SKSpriteNode(imageNamed: self.bigImageName)
                velocity = CGFloat(arc4random_uniform(200) + 50)
            }
            
            // Hinzufügen
            if  let starSprite = starSprite
            {
                if self.withColorStars
                {
                    starSprite.colorBlendFactor = 1.0
                    starSprite.color = UIColor.randomColor()
                }
                
                if self.withTransparentStars
                {
                    starSprite.alpha = 0.5
                }
                
                starSprite.position = CGPoint(x: xSeedPosition, y: self.parentScene.size.height)
                starSprite.zPosition = 1
                self.parentScene.addChild(starSprite)
                
                let realMoveDuration = TimeInterval(self.parentScene.size.height / velocity)
                let destination = CGPoint(x: xSeedPosition, y: 0)
                let actionMove:SKAction = SKAction.move(to: destination, duration: realMoveDuration)
                
                let actionMoveDone:SKAction = SKAction.removeFromParent()
                var sequenz = SKAction.sequence([actionMove,actionMoveDone])
                
                if self.withRotation
                {
                    var spinDicrection = 360.0
                    let spin = arc4random_uniform(2)
                    if spin == 1
                    {
                        spinDicrection = -360.0
                    }
                    let time = Double(arc4random_uniform(300)) / 100.0 + 0.1
                    let radians = CGFloat(spinDicrection * 0.0174532925)
                    var rotateAction = SKAction.rotate(byAngle: radians, duration: time)
                    rotateAction = SKAction.repeatForever(rotateAction)
                    sequenz = SKAction.group([sequenz, rotateAction])
                }
                
                
                starSprite.run(sequenz)
            }
        }
    }
}
