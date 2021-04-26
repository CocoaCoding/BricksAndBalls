//
//  HHSSpriteNode.swift
//  SwiftBricks
//
//  Created by Holger Hinzberg on 26.01.15.
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.
//

import Foundation
import SpriteKit

class HHSSpriteNode: SKSpriteNode
{
    var score:Int
    var negativeScore:Int
    var hitsCount:Int
    var durationForPoint:Double
    var velocityOffset:Double
    var explosionDuration:Double
    var collisionDamage:Double
    var resourceNameForExplosion:String
    var destination:CGPoint
    var tag:Int
   
    var spriteAction:SKAction?
    var gameEvent:GameEvent?
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    
    override init(texture: SKTexture!, color: UIColor, size: CGSize)
    {
        self.tag = -1
        self.hitsCount = 1
        self.hitsCount = 1
        self.score = 1
        self.negativeScore = -1
        self.velocityOffset = 1
        self.durationForPoint = 0
        self.explosionDuration = 0
        self.collisionDamage = 10
        self.spriteAction = nil
        self.resourceNameForExplosion = ""
        self.destination = CGPoint(x: 0, y: 0)
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init(imagename: String)
    {
        let color = UIColor()
        let textu = SKTexture(imageNamed: imagename)
        //let size = CGSizeMake(10.0, 10.0);
        let size = textu.size()
        self.init(texture: textu, color: color, size: size)
    }
}