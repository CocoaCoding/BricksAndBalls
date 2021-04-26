//
//  BallHitTimeValidator.swift
//  SwiftBricks
//
//  Created by Holger Hinzberg on 11.02.15.
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.
//

import Foundation

public class BallHitTimeValidator
{
    private var  timeOfLastHit:TimeInterval = 0
    private var requiredMaxTimeInterval:TimeInterval = 0.8
    private var hitsInARow:Int = 0
    
    public func validateHitsInterval() -> Int
    {
        // Werden mehrere Bricks innerhalb einer bestimmten Zeitspannen getroffen gibt es einen Bonus
        let currentTime:CFTimeInterval = CFAbsoluteTimeGetCurrent();
        
        if currentTime - self.timeOfLastHit <= self.requiredMaxTimeInterval
        {
            //println("Schnell genug");
            self.hitsInARow += 1
            // println("Hits in a row %li", (long)self.hitsInARow);
        }
        else
        {
            // println(@"Zu langsam");
            self.hitsInARow = 0;
        }
        
        self.timeOfLastHit = currentTime;
        return self.hitsInARow;
    }
}
