//  SpriteScaleMultiplicator.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 09.01.21.
//  Copyright © 2021 Holger Hinzberg. All rights reserved.

import SpriteKit

// Sprite Vergrößerung, abhängig vom Bildschirm
// 414 pt = 8 plus
// 375 pt = iPhone X
// 320 pt = iPhone SE

public class SpriteScaleMultiplicator {
    
    static let shared = SpriteScaleMultiplicator()
    
    private init() {
    }
    
    public func getScaleMultiplicator(width : CGFloat) -> CGFloat {
        var spriteScaleMultiplicator:CGFloat = 0
        if width > 320
        {
            spriteScaleMultiplicator = width / 320
        }
        return spriteScaleMultiplicator
    }
}
