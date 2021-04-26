//  BrickRow.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 13.08.18.
//  Copyright © 2018 Holger Hinzberg. All rights reserved.

// Definition for a Row of Bricks
// Alwas have to be 10 bricks in a row

import Foundation

public struct BrickRow
{
    var BrickItems = [BrickItem]()
    
    init() {
    }
    
    init(cc1: BrickColor, cc2: BrickColor, cc3: BrickColor, cc4: BrickColor, cc5: BrickColor, cc6: BrickColor, cc7: BrickColor, cc8: BrickColor, cc9: BrickColor, cc10: BrickColor ) {
        self.BrickItems.append(BrickItem(color: cc1))
        self.BrickItems.append(BrickItem(color: cc2))
        self.BrickItems.append(BrickItem(color: cc3))
        self.BrickItems.append(BrickItem(color: cc4))
        self.BrickItems.append(BrickItem(color: cc5))
        self.BrickItems.append(BrickItem(color: cc6))
        self.BrickItems.append(BrickItem(color: cc7))
        self.BrickItems.append(BrickItem(color: cc8))
        self.BrickItems.append(BrickItem(color: cc9))
        self.BrickItems.append(BrickItem(color: cc10))
    }
}
