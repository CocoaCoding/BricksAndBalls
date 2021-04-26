//  HHZMathHelper.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 23.01.21.
//  Copyright © 2021 Holger Hinzberg. All rights reserved.

import SpriteKit

class MathHelper {
    
    static let shared = MathHelper()
    
    private init() {
    }
    
    func calculateDistance(firstPoint:CGPoint, secondPoint:CGPoint) -> CGFloat
    {
        let distanceX = abs(firstPoint.x - secondPoint.x)
        let distanceY = abs(firstPoint.y - secondPoint.y)
        let distance = sqrt((distanceX * distanceX) + (distanceY * distanceY));
        print("Distance \(distance)")
        return distance
    }
    
    func calculateDuration(distance:CGFloat, referenceDistance:Double) -> Double
    {
        let duration = Double(distance) / referenceDistance
        print("Duration \(duration)")
        return duration
    }
}
