//  GameScene.swift
//  BricksAndBalls
//  Created by Holger Hinzberg on 21.04.21.

import SpriteKit

class GameSKScene : SKBorderScene , ObservableObject {
    
    private let player = SKShapeNode(circleOfRadius: 50)
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        backgroundColor = .black
        player.fillColor = .white
        player.position = CGPoint(x: self.size.width / 2, y: (self.size.height / 2))
        
        addChild(player)
    }
}
