//  ScoreView.swift
//  BricksAndBalls
//  Created by Holger Hinzberg on 21.04.21.

import SwiftUI
import SpriteKit

class ScoreSKScene : SKBorderScene, ObservableObject , GameEnviromentObserver {

    // Score and Level SizeMargin
    private let labelMarging : CGFloat = 5
    
    // Score
    private var scoreLabel:SKLabelNode?
    private var displayedScore:Int = 0
    private var shouldDisplayedScore:Int = 0
    private var displayedLives:Int = 0
    private var displayedLevelNumber:Int = 0
        
    private var levelLabel:SKLabelNode?
    
    private var livesIndicatorNodes:[SKShapeNode]?
    
    // To increase score value animated
    private var lastUpdateTimeInterval:TimeInterval?
    
    private var numberFormatter:NumberFormatter?
        
    private var primaryColor = SKColor.red
    private var secondaryColor = SKColor.yellow
    
    override func didMove(to view: SKView)
    {
        super.didMove(to: view)
     
        let appDelegate: CustomAppDelegate = CustomAppDelegate.shared
        let gameEnviroment = appDelegate.gameEnviroment
        gameEnviroment.attach(self)
        self.displayedLives = gameEnviroment.currentLives
        self.displayedScore = gameEnviroment.currentGameScore
        self.displayedLevelNumber = gameEnviroment.currentLevelNumber

        self.numberFormatter = NumberFormatter()
        self.numberFormatter?.numberStyle = NumberFormatter.Style.decimal
        self.numberFormatter?.locale = NSLocale.current
        
        self.lastUpdateTimeInterval = CFAbsoluteTimeGetCurrent()
        self.livesIndicatorNodes = [SKShapeNode]()
        
        backgroundColor = .black
        
        self.createScoreLabel()
        self.createLevelLabel()
        self.updateLivesDisplay()
    }
    
    // Update function, will be called automaticly
    override func update(_ currentTime: CFTimeInterval)
    {
        self.updateScoreDisplay()
    }
    

    private func createScoreLabel()
    {
        self.scoreLabel = SKLabelNode(fontNamed: "Futura Medium")
        self.scoreLabel?.physicsBody?.categoryBitMask = UICategory
        self.scoreLabel?.fontSize = 18
        self.scoreLabel?.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.scoreLabel?.fontColor = self.primaryColor
        self.scoreLabel?.color = .white
        let positionX : CGFloat = self.labelMarging
        let positionY : CGFloat = (self.size.height / 2) - 8
        self.scoreLabel?.position = CGPoint(x: positionX, y: positionY)
        self.scoreLabel?.zPosition = 100
        self.addChild(self.scoreLabel!)
        let number = NSNumber(value: displayedScore)
        let formattedScore = self.numberFormatter?.string(from: number)
        if let score = formattedScore
        {
            self.scoreLabel?.text = "Score \(score)"
        }
    }
    
    func update(subject: GameEnviroment)
    {
        // Score changed, must update
        if self.displayedScore < subject.currentGameScore {
            self.shouldDisplayedScore = subject.currentGameScore
        }
        
        // Lives changed
        if self.displayedLives != subject.currentLives {
            self.displayedLives = subject.currentLives
            self.updateLivesDisplay()
        }
        
    }
    
    func updateScoreDisplay()
    {
        let remainingScore = self.shouldDisplayedScore - self.displayedScore
        var incrementScorePerInterval = remainingScore / 3
        if remainingScore > 0 && incrementScorePerInterval == 0 {
            incrementScorePerInterval = remainingScore
        }

        let currentTime:CFTimeInterval = CFAbsoluteTimeGetCurrent();
        let timeSinceLast:CFTimeInterval = currentTime - self.lastUpdateTimeInterval!;
        
        // Enough time elapsed for an update of the score display?
        if (timeSinceLast > 0.05)
        {
            self.lastUpdateTimeInterval = currentTime;
            if (self.displayedScore >= shouldDisplayedScore)
            {
                // score value reached
                let number = NSNumber(value: self.displayedScore)
                let formattedScore = self.numberFormatter?.string(from: number)
                if let score = formattedScore
                {
                    self.scoreLabel?.text = "Score \(score)"
                }
            }
            else
            {
                // score value not reached, increment more
                self.displayedScore += incrementScorePerInterval;
                let number = NSNumber(value: self.displayedScore)
                let formattedScore = self.numberFormatter?.string(from: number)
                if let score = formattedScore
                {
                    self.scoreLabel?.text = "Score \(score)"
                }
            }
        }
    }
    

    
    
    private func createLevelLabel()
    {
        self.levelLabel = SKLabelNode(fontNamed: "Futura Medium")
        self.levelLabel?.physicsBody?.categoryBitMask = UICategory
        self.levelLabel?.fontSize = 18
        self.levelLabel?.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        self.levelLabel?.fontColor = self.primaryColor
        let positionX : CGFloat = self.size.width - self.labelMarging
        let positionY : CGFloat = (self.size.height / 2) - 8;
        self.levelLabel?.position = CGPoint(x: positionX, y: positionY)
        self.levelLabel?.zPosition = 10
        self.levelLabel?.text = "Level \(self.displayedLevelNumber)"
        self.addChild(self.levelLabel!)
    }
    
    func updateLivesDisplay()
    {
        let dotDiameter:Double = 4
        let dotDistance:Double = 6
        
        // Die alten Indikatoren entfernen
        for node:SKShapeNode in self.livesIndicatorNodes!
        {
            node.removeFromParent()
        }
        self.livesIndicatorNodes!.removeAll(keepingCapacity: true)
        
        let count = self.displayedLives
    
        let center:Double = Double(self.size.width / 2)
        
        var offsetFromCenter = dotDiameter  * Double(count)
        offsetFromCenter += (dotDistance ) * Double(count)
        offsetFromCenter = offsetFromCenter / 2
        
        let startX:Double = Double(center - offsetFromCenter)
        let startY:CGFloat = self.size.height / 2
    
        for i in 0 ..< count
        {
            let offsetX = dotDiameter + (dotDistance * 2) * Double(i)
            let xPos:CGFloat = CGFloat(startX + offsetX)
            let circle:SKShapeNode = SKShapeNode(circleOfRadius: CGFloat(dotDiameter))
            circle.fillColor = self.secondaryColor
            circle.strokeColor = self.secondaryColor
            circle.position = CGPoint(x: xPos, y: startY)
            circle.physicsBody?.categoryBitMask = UICategory
            circle.zPosition = 100
            self.addChild(circle)
            self.livesIndicatorNodes!.append(circle)
        }
   }
    
    
    
    

    
}
