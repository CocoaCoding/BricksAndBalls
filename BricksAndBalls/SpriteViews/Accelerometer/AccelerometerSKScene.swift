// AccelerometerView.swift
//  BricksAndBalls
//  Created by Holger Hinzberg on 21.04.21.

import Foundation

import SpriteKit
import CoreMotion

class AccelerometerSKScene : SKBorderScene , ObservableObject {
    
    var accelerometerControlX:HHSAccelerometerControl?
    var motionManager:CMMotionManager?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = .black
        
        self.motionManager = CMMotionManager()
        self.motionManager?.accelerometerUpdateInterval = 0.2
        self.motionManager?.startAccelerometerUpdates()
        
        let controlsize = CGSize(width: self.size.width - 10 , height: 20)
        let centerpoint = CGPoint(x: self.frame.size.width / 2 , y: self.frame.size.height / 2)
        
        self.accelerometerControlX = HHSAccelerometerControl(scene: self, size: controlsize, centerPoint: centerpoint)
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        let x = self.motionManager?.accelerometerData?.acceleration.x
        if let accelerometerValue = x
        {
            self.accelerometerControlX?.setValue(value: accelerometerValue)
        }
    }
}
