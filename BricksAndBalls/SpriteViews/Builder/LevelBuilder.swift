//  LevelBuilder.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 02.11.20.
//  Copyright © 2020 Holger Hinzberg. All rights reserved.


import SpriteKit

public class LevelBuilder
{
    private var parentScene:SKScene
    private var levelBricksBuilder:LevelBricksBuilder?
    private var levelThemeBuilder:LevelThemeBuilder?
    
    // Spielfeld Rand oben
    private var paddings = EdgePaddings()
    
    public init(scene:SKScene , paddings:EdgePaddings)
    {
        self.parentScene = scene
        self.paddings = paddings
        self.levelThemeBuilder = LevelThemeBuilder(scene:scene, paddings: paddings)
        self.levelBricksBuilder = LevelBricksBuilder(scene: scene, paddings: paddings)
    }
    
    // Erzeugt das Theme (Farben , Rand, etc)
    public func setLevelTheme(currentTheme: LevelTheme)
    {
        self.levelThemeBuilder?.buildLevel(currentTheme: currentTheme)
    }
    
    // Erzeugt und platziert die Bricks
    public func setLevelBricks(currentBricks: LevelBricks) -> Int
    {
        let bricksCount = self.levelBricksBuilder?.buildLevel(currentBricks: currentBricks)
        return bricksCount!
    }
    
    // Erzeugt den Ball und gibt das Ball Sprite zurück
    public func setLevelBall(currentTheme:LevelTheme) -> SKShapeNode
    {
        let ballSprite = SKShapeNode(circleOfRadius: currentTheme.ballRadius)
        ballSprite.fillColor = currentTheme.secondaryThemeColor
        ballSprite.strokeColor = currentTheme.secondaryThemeColor
        ballSprite.physicsBody = SKPhysicsBody(circleOfRadius: currentTheme.ballRadius)
        ballSprite.physicsBody?.categoryBitMask = BallCategory;
        ballSprite.physicsBody?.contactTestBitMask = BrickCategory | GapCategory ;
        ballSprite.physicsBody?.isDynamic = true;
        ballSprite.physicsBody?.friction = 0;
        ballSprite.physicsBody?.linearDamping = 0;
        ballSprite.physicsBody?.restitution = 1.0;
        
        // Die Startposition des Balles
        // In der X-Richtung immer etwas zufällig verschoben
        let randomXOffset = CGFloat(arc4random_uniform(40))
        let xStartPosition:CGFloat = (self.parentScene.size.width / 2) - 20 + randomXOffset
        let yStartPostion:CGFloat = currentTheme.paddleBottomOffset + currentTheme.paddleSize.height + 5
        let ballPosition = CGPoint(x: xStartPosition , y: yStartPostion)
  
        // Sprite Vergrößerung, abhängig vom Bildschirm
        let spriteScaleMultiplicator = SpriteScaleMultiplicator.shared.getScaleMultiplicator(width: self.parentScene.size.width)
        if spriteScaleMultiplicator > 0
        {
            // Vergrößern wenn nötig
            ballSprite.setScale(spriteScaleMultiplicator)
        }
        
        ballSprite.position = ballPosition
        self.parentScene.addChild(ballSprite)
        
        let ballVector = CGVector(dx: 0, dy: 4.5)
        ballSprite.physicsBody?.applyImpulse(ballVector)
        return ballSprite
    }
    
    // Erzeugt das Paddle und gibt das Paddle Sprite zurück
    public func setLevelPlayerPaddle(currentTheme:LevelTheme) -> SKSpriteNode
    {
        let playerPaddleSprite = SKSpriteNode(color: currentTheme.primaryThemeColor, size: currentTheme.paddleSize)
        playerPaddleSprite.physicsBody = SKPhysicsBody(rectangleOf: playerPaddleSprite.size)
        playerPaddleSprite.physicsBody?.categoryBitMask = PaddleCategory;
        playerPaddleSprite.physicsBody?.isDynamic = false
        playerPaddleSprite.physicsBody?.linearDamping = 0
        playerPaddleSprite.physicsBody?.restitution = 0.1
        playerPaddleSprite.physicsBody?.friction = 0.4
        
        // Sprite Vergrößerung, abhängig vom Bildschirm
        let spriteScaleMultiplicator = SpriteScaleMultiplicator.shared.getScaleMultiplicator(width: self.parentScene.size.width)
        if spriteScaleMultiplicator > 0
        {
            // Vergrößern wenn nötig
            playerPaddleSprite.setScale(spriteScaleMultiplicator)
        }
        
        let playerPosition = CGPoint(x: self.parentScene.size.width / 2 , y: currentTheme.paddleBottomOffset)
        playerPaddleSprite.position = playerPosition
        self.parentScene.addChild(playerPaddleSprite)
        return playerPaddleSprite
    }
}
