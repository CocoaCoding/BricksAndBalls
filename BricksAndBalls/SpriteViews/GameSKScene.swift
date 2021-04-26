//  GameScene.swift
//  BricksAndBalls
//  Created by Holger Hinzberg on 21.04.21.

import SwiftUI
import SpriteKit
import CoreMotion

class GameSKScene : SKBorderScene , SKPhysicsContactDelegate, ObservableObject {
    
    // Diese Zahl muss später von außen reingegeben werden
    let levelNumber : Int = 5
    
    @AppStorage("HasHaptic") var hasHaptic = true;
    
    // Playground border
    var worldPaddings = EdgePaddings(top: 1, botton: 1, left: 1, right: 1)
    
    private var bricksInSceneCount = 1
    private let maxBallSpeed:Double = 720
    
    private var currentLevel:Level?
    private var levelBuilder:LevelBuilder?
    
    // Wird aus dem LevelBuilder zurück gegeben
    private var ballSprite:SKShapeNode?
    // Wird aus dem LevelBuilder zurück gegeben
    private var playerPaddleSprite:SKSpriteNode?
    // Wird aus dem LevelBuilder zurück gegeben
    var paddleBottomOffset:CGFloat = 0
    
    private var messageLayer:SKNode?
    private var gameState:GameState?
    
    private var motionManager:CMMotionManager?
    
    private var hitTimeValidator:BallHitTimeValidator?
    
    // Initial Setup
    override func sceneDidLoad()
    {
        super.sceneDidLoad()
        // self.scaleMode = .aspectFill
        backgroundColor = .black
        
        // Bewegungerkennung
        self.motionManager = CMMotionManager()
        self.motionManager?.startAccelerometerUpdates()
        
        // Level Builder init
        self.levelBuilder = LevelBuilder(scene: self, paddings: self.worldPaddings)
        
        // Set current level information
        let levelRepository = LevelRepository()
        self.currentLevel = levelRepository.getLevel(self.levelNumber)
        
        // Bonuspunkte bei schnellen Hits
        self.hitTimeValidator = BallHitTimeValidator()
        
        // Physics
        self.setUpWorldPhysics()
    }
    
    // Setup and Level creation
    override func didMove(to view: SKView)
    {
        super.didMove(to: view)
        
        // Theme (Background color and gap)
        let levelThemeBuilder = LevelThemeBuilder(scene: self, paddings: self.worldPaddings)
        levelThemeBuilder.buildLevel(currentTheme:  self.currentLevel!.theme)
        
        // Bricks
        let levelBricksBuilder = LevelBricksBuilder(scene: self, paddings: self.worldPaddings)
        self.bricksInSceneCount = levelBricksBuilder.buildLevel(currentBricks: self.currentLevel!.bricks)
        
        // Interaction (Ball and paddle)
        self.paddleBottomOffset = currentLevel!.theme.paddleBottomOffset
        
        
        self.displayLevelStartMessage(state: LevelStartState.StartNewLevel)
    }
    
    
    
    private func setUpWorldPhysics()
    {
        let worldFrame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height - self.worldPaddings.top)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: worldFrame)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -0.5);
        self.physicsWorld.contactDelegate = self;
    }
    
    private func displayLevelStartMessage(state:LevelStartState)
    {
        self.messageLayer?.removeAllChildren()
        let factory = MessageLayerFactory(theme: currentLevel!.theme)
        
        if state == LevelStartState.StartNewLevel
        {
            self.messageLayer = factory.createStartMessage(scene: self, level: self.currentLevel!)
        }
        else if state == LevelStartState.RestartLevel
        {
            if  true //   self.gameController!.currentLives > 1
            {
                self.messageLayer = factory.createRestartMessage(scene: self, level: self.currentLevel!)
            }
            else
            {
                self.messageLayer = factory.createAlternativeRestartMessage(scene: self, level: self.currentLevel!)
            }
        }
        
        if let layer = self.messageLayer
        {
            layer.alpha = 0
            self.addChild(layer)
            let fadeIn = SKAction.fadeIn(withDuration: 1.0)
            layer.run(fadeIn)
        }
        
        self.gameState = GameState.Prepare
    }
    
    // MARK: Updates
    override func update(_ currentTime: CFTimeInterval)
    {
        // Accelrometer
        let x = self.motionManager?.accelerometerData?.acceleration.x
        if let accelerometerValue = x
        {
            //self.accelerometerControl?.setValue(value: accelerometerValue)
        }
        
        self.updateMovements()
        //self.scoreDisplay?.updateScoreDisplay()
        
        if self.gameState == GameState.Running && self.bricksInSceneCount == 0
        {
            self.gameState = GameState.Stopped
            // let levelWon = LevelWonScene(size: self.size)
            // self.view?.presentScene(levelWon, transition: SKTransition.doorsCloseHorizontal(withDuration: 0.5))
        }
        
        if let physicsBody = self.ballSprite?.physicsBody
        {
            let d:Double = Double(physicsBody.velocity.dx * physicsBody.velocity.dx) + Double(physicsBody.velocity.dy * physicsBody.velocity.dy)
            let currentSpeed:Double = sqrt(d)
            if currentSpeed > self.maxBallSpeed
            {
                self.ballSprite?.physicsBody?.linearDamping = 0.4
            }
            else
            {
                self.ballSprite?.physicsBody?.linearDamping = 0.0
            }
        }
    }
    
    private func updateMovements()
    {
        let data = self.motionManager?.accelerometerData;
        if let data = data
        {
            let movement = 100.0
            let newX = CGFloat(movement * data.acceleration.x / 100)
            self.physicsWorld.gravity = CGVector(dx: newX, dy: -0.5)
        }
    }
    
    //MARK: SKPhysicsContactDelegate
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        var brick:SKNode?
        var gap:SKNode?
        
        if contact.bodyA.categoryBitMask == BrickCategory
        {
            brick = contact.bodyA.node
        }
        else if contact.bodyB.categoryBitMask == BrickCategory
        {
            brick = contact.bodyB.node
        }
        if contact.bodyA.categoryBitMask == GapCategory
        {
            gap = contact.bodyA.node
        }
        else if contact.bodyB.categoryBitMask == GapCategory
        {
            gap = contact.bodyB.node
        }
        
        // Kollision mit einem Brick
        if let brick = brick as? HHSSpriteNode
        {
            if self.hasHaptic {
                HapticController.shared.vibrateImpact()
            }
            
            brick.hitsCount = brick.hitsCount - 1
            
            // Hits Count 0 => Brick entfernen
            if brick.hitsCount <= 0
            {
                // Punkte addieren und Sprites reduzieren
                
                // self.gameController?.addScore(value: brick.score)
                // self.scoreDisplay?.displayScoreChange()
                
                brick.removeFromParent()
                self.bricksInSceneCount = self.bricksInSceneCount - 1
                
                let hitsInARow = self.hitTimeValidator!.validateHitsInterval()
                if hitsInARow > 0
                {
                    // Jetzt gibst Bonus
                    // self.gameController?.addScore(value: hitsInARow * 5)
                    // self.scoreDisplay?.displayScoreChange()
                }
                
                
                if let event = brick.gameEvent
                {
                    self.runGameEvents(event: event)
                }
            }
            else
            {
                // Multihit
                self.flashMultihitBrick(brick: brick)
            }
        }
        
        if gap != nil
        {
            // Ball hat die Lücke getroffen
            self.ballLost()
        }
    }
    
    
    func didEndContact(contact: SKPhysicsContact)
    {
        // Wird nicht benötigt
    }
    
    //MARK: Touches
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        super.touchesBegan(touches, with: event)
        
        if self.gameState == GameState.Prepare
        {
            self.messageLayer?.removeFromParent()
            self.startLevel()
        }
    }
    
    // Paddle bei Touches bewegen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let borderLeftRightOffset : CGFloat = 3
        let halfPaddleWith = self.playerPaddleSprite!.size.width / 2
        super.touchesMoved(touches,with: event)
        
        for touch in touches
        {
            let location = touch.location(in: self)
            var newPosition = CGPoint(x: location.x, y: self.paddleBottomOffset)
            //var newPosition = CGPoint(x: location.x, y: location.y)
            
            // Nicht über die Ränder hinaus bewegen
            if newPosition.x < halfPaddleWith + borderLeftRightOffset
            {
                newPosition.x = halfPaddleWith + borderLeftRightOffset
            }
            else if newPosition.x > self.size.width - halfPaddleWith - borderLeftRightOffset
            {
                newPosition.x = self.size.width -  halfPaddleWith - borderLeftRightOffset
            }
            
            // let distance = MathHelper.shared.calculateDistance(firstPoint: location, secondPoint: newPosition)
            //let duration = MathHelper.shared.calculateDuration(distance: distance, referenceDistance: 50)
            
            let move = SKAction.move(to: newPosition, duration: 0.05)
            self.playerPaddleSprite?.run(move)
        }
    }
    
    // Wird durch eine Berührung nach der StartMessage aufgerufen
    private func startLevel()
    {
        if let theme = self.currentLevel?.theme
        {
            self.ballSprite = self.levelBuilder?.setLevelBall(currentTheme: theme)
            self.playerPaddleSprite = levelBuilder?.setLevelPlayerPaddle(currentTheme: theme)
        }
        self.gameState = GameState.Running
    }
    
    private func ballLost()
    {
        /*
         self.ballSprite?.removeFromParent()
         self.playerPaddleSprite?.removeFromParent()
         // Ein Ball weniger
         self.gameController?.currentLives -= 1
         
         if (self.gameController?.currentLives)! <= 0
         {
         // Keine Bälle mehr übrig, Spiel verloren
         let gameOverScene = GameOverScene(size: self.size)
         self.view?.presentScene(gameOverScene, transition: SKTransition.doorsCloseHorizontal(withDuration: 0.5))
         }
         else
         {
         // Level fortführen
         self.scoreDisplay?.updateLivesDisplay()
         self.displayLevelStartMessage(state: LevelStartState.RestartLevel)
         }
         */
    }
    
    //MARK: Game Events und Special Effects
    
    private func runGameEvents(event:GameEvent)
    {
        if event == GameEvent.ExtraLife
        {
            //self.gameController?.currentLives += 1
            //self.scoreDisplay?.updateLivesDisplay()
            let labelNodeHelper = HHSLabelNodeHelper()
            
            let extra = labelNodeHelper.GetLabelNode(text: "Extra Ball!", fontSize: 10, color: SKColor.white)
            extra.position = CGPoint(x: self.size.width / 2 , y: self.size.height / 2)
            
            let remove = SKAction.removeFromParent()
            let fadeOut = SKAction.fadeOut(withDuration: 0.5)
            let grow = SKAction.scale(to: 5, duration: 0.5)
            let group = SKAction.group([fadeOut, grow])
            let seqenz = SKAction.sequence([group, remove])
            extra.run(seqenz)
            self.addChild(extra)
        }
    }
    
    private func flashMultihitBrick(brick:HHSSpriteNode)
    {
        let timeToRun = 0.1
        let texture = brick.texture
        
        let action1 = SKAction.customAction(withDuration: timeToRun, actionBlock: { (node:SKNode!, elapsedTime: CGFloat) -> Void in
            let n = node as! SKSpriteNode
            n.color = SKColor.red
            n.colorBlendFactor = 1.0
            n.texture = nil
        })
        
        let action2 = SKAction.customAction(withDuration: timeToRun, actionBlock: { (node:SKNode!, elapsedTime: CGFloat) -> Void in
            let n = node as! SKSpriteNode
            n.color = SKColor.yellow
        })
        
        let action3 = SKAction.customAction(withDuration: timeToRun, actionBlock: { (node:SKNode!, elapsedTime: CGFloat) -> Void in
            let n = node as! SKSpriteNode
            n.colorBlendFactor = 0.0
            n.texture = texture
        })
        
        let group = SKAction.sequence([action1, action2,action3])
        brick.run(group)
    }
    
    
    
}
