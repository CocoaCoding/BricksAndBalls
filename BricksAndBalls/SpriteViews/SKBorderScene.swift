//  SKBorderScene.swift
//  BricksAndBalls
//  Created by Holger Hinzberg on 25.04.21.

import SpriteKit

class SKBorderScene: SKScene {
    
    public var showTop : Bool = true
    public var showBottom : Bool = true
    public var showLeft : Bool = true
    public var showRight : Bool = true
    
    var externalSize:CGSize?
    
    override func didMove(to view: SKView) {
        
        if let externalSize = self.externalSize {
            self.size = externalSize
        } else {
            self.size = CGSize(width: 400, height: 400)
        }
        self.SetBorder(borderThickness: 4, borderColor: .red)
    }
    
    func SetBorder( borderThickness : CGFloat, borderColor : SKColor )
    {
        let height:CGFloat = self.size.height
        let width:CGFloat = self.size.width
        
        let yPosTopBorder:CGFloat = height
        let xPosTopBorder:CGFloat = width / 2
        let sizeHorizonalBorder = CGSize(width: width, height: borderThickness)
        let sizeVerticalBorder = CGSize(width: borderThickness, height: height)
        
        if self.showTop {
            // Top
            let topBorderSprite = SKSpriteNode(color: borderColor , size: sizeHorizonalBorder)
            topBorderSprite.position = CGPoint(x: xPosTopBorder, y: yPosTopBorder)
            addChild(topBorderSprite)
        }
        
        if self.showBottom {
            // Bottom
            let bottomBorderSprite = SKSpriteNode(color: borderColor , size: sizeHorizonalBorder)
            bottomBorderSprite.position = CGPoint(x: xPosTopBorder, y: 0)
            addChild(bottomBorderSprite)
        }
        
        if self.showLeft {
            // Left
            let leftBorderSprite = SKSpriteNode(color: borderColor , size: sizeVerticalBorder)
            leftBorderSprite.position = CGPoint(x: 0, y: height / 2)
            addChild(leftBorderSprite)
        }
        
        if self.showRight {
            // Right
            let rightBorderSprite = SKSpriteNode(color: borderColor , size: sizeVerticalBorder)
            rightBorderSprite.position = CGPoint(x: width, y: height / 2)
            addChild(rightBorderSprite)
        }
    }
}
