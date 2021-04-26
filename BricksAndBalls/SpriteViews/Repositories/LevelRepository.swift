//  LevelRepository.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 01.11.20.
//  Copyright © 2020 Holger Hinzberg. All rights reserved.

// Definition aller Level

import SpriteKit


class LevelRepository
{
    private var levels = [Int : Level]()
    
    init()
    {
        levels.updateValue(CreateLevel1(), forKey: 1)
        levels.updateValue(CreateLevel2(), forKey: 2)
        levels.updateValue(CreateLevel3(), forKey: 3)
        levels.updateValue(CreateLevel4(), forKey: 4)
        levels.updateValue(CreateLevel5(), forKey: 5)
    }
    
    func getLevel(_ level:Int) -> Level
    {
        return self.levels[level]!
    }
    
    func getAvailibleLevelsCount() -> Int
    {
        return self.levels.count
    }
    
    private func CreateLevel1() -> Level
    {
        let level = Level(levelNumber: 1)
        let row1 = BrickRow(cc1: .Red, cc2: .Red, cc3: .Red, cc4: .Red, cc5: .Red, cc6: .Red, cc7: .Red, cc8: .Red, cc9: .Red, cc10: .Red)
        let row2 = BrickRow(cc1: .Orange, cc2: .Orange, cc3: .Orange, cc4: .Orange, cc5: .Orange, cc6: .Orange, cc7: .Orange, cc8: .Orange, cc9: .Orange, cc10: .Orange)
        let row3 = BrickRow(cc1: .Yellow, cc2: .Yellow, cc3: .Yellow, cc4: .Yellow, cc5: .Yellow, cc6: .Yellow, cc7: .Yellow, cc8: .Yellow, cc9: .Yellow, cc10: .Yellow)
        
        level.bricks.Rows.append(row1)
        level.bricks.Rows.append(row2)
        level.bricks.Rows.append(row3)
        
        level.theme.backgroundColor = SKColor.black
        level.theme.borderColor = SKColor.red
        level.theme.gapColor = SKColor.black
        level.theme.fillingColor = SKColor.black
        level.theme.primaryThemeColor = SKColor.red
        level.theme.secondaryThemeColor = SKColor.yellow
        
        return level
    }
    
    private func CreateLevel2() -> Level
    {
        let level = Level(levelNumber: 2)
        let lev2Row1 = BrickRow(cc1: .Blue, cc2: .Blue, cc3: .Blue, cc4: .Blue, cc5: .Blue, cc6: .Blue, cc7: .Blue, cc8: .Blue, cc9: .Blue, cc10: .Blue)
        let lev2Row2 = BrickRow(cc1: .Green, cc2: .Green, cc3: .Green, cc4: .Green, cc5: .Green, cc6: .Green, cc7: .Green, cc8: .Green, cc9: .Green, cc10: .Green)
        let lev2Row3 = BrickRow(cc1: .Red, cc2: .Red, cc3: .Red, cc4: .Red, cc5: .Red, cc6: .Red, cc7: .Red, cc8: .Red, cc9: .Red, cc10: .Red)
        let lev2Row4 = BrickRow(cc1: .Orange, cc2: .Orange, cc3: .Orange, cc4: .Orange, cc5: .Orange, cc6: .Orange, cc7: .Orange, cc8: .Orange, cc9: .Orange, cc10: .Orange)
        let lev2Row5 = BrickRow(cc1: .None, cc2: .None, cc3: .Yellow, cc4: .Yellow, cc5: .Yellow, cc6: .Yellow, cc7: .Yellow, cc8: .Yellow, cc9: .None, cc10: .None)
        
        level.bricks.Rows.append(lev2Row1)
        level.bricks.Rows.append(lev2Row2)
        level.bricks.Rows.append(lev2Row3)
        level.bricks.Rows.append(lev2Row4)
        level.bricks.Rows.append(lev2Row5)
        
        level.theme.backgroundColor = SKColor.black
        level.theme.borderColor = SKColor.yellow
        level.theme.gapColor = SKColor.black
        level.theme.fillingColor = SKColor.yellow
        level.theme.primaryThemeColor = SKColor.yellow
        level.theme.secondaryThemeColor = SKColor.red

        return level
    }
    
    private func CreateLevel3() -> Level
    {
        let level = Level(levelNumber: 3)
        let lev3Row1 = BrickRow(cc1: .Sky, cc2: .Sky, cc3: .Sky, cc4: .Sky, cc5: .Sky, cc6: .Sky, cc7: .Sky, cc8: .Sky, cc9: .Sky, cc10: .Sky)
        let lev3Row2 = BrickRow(cc1: .Blue, cc2: .Blue, cc3: .Blue, cc4: .Blue, cc5: .Blue, cc6: .Blue, cc7: .Blue, cc8: .Blue, cc9: .Blue, cc10: .Blue)
        let lev3Row3 = BrickRow(cc1: .Blueberry, cc2: .Blueberry, cc3: .Blueberry, cc4: .Blueberry, cc5: .Blueberry, cc6: .Blueberry, cc7: .Blueberry, cc8: .Blueberry, cc9: .Blueberry, cc10: .Blueberry)
        let lev3Row4 = BrickRow(cc1: .Lime, cc2: .None, cc3: .Lime, cc4: .None, cc5: .Lime, cc6: .Lime, cc7: .None, cc8: .Lime, cc9: .None, cc10: .Lime)
        let lev3Row5 = BrickRow(cc1: .Lime, cc2: .None, cc3: .Lime, cc4: .None, cc5: .Lime, cc6: .Lime, cc7: .None, cc8: .Lime, cc9: .None, cc10: .Lime)
        let lev3Row6 = BrickRow(cc1: .Green, cc2: .Green, cc3: .Green, cc4: .Green, cc5: .Green, cc6: .Green, cc7: .Green, cc8: .Green, cc9: .Green, cc10: .Green)

        level.bricks.Rows.append(lev3Row1)
        level.bricks.Rows.append(lev3Row2)
        level.bricks.Rows.append(lev3Row3)
        level.bricks.Rows.append(lev3Row4)
        level.bricks.Rows.append(lev3Row5)
        level.bricks.Rows.append(lev3Row6)
        
        level.theme.backgroundColor = SKColor.black
        level.theme.borderColor = SKColor(cgColor: UIColor.skyBlue.cgColor)
        level.theme.gapColor = SKColor.black
        level.theme.fillingColor = SKColor.black
        level.theme.primaryThemeColor = SKColor(cgColor: UIColor.skyBlue.cgColor)
        level.theme.secondaryThemeColor = SKColor.white
        
        return level
    }
    
    private func CreateLevel4() -> Level
    {
        let level = Level(levelNumber: 4)
        
        var lev4Row1 = BrickRow()
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Rainbow, behavior: .None, event: .ExtraLife))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        lev4Row1.BrickItems.append(BrickItem(color: .Blue))
        
        let lev4Row2 = BrickRow(cc1: .Blue, cc2: .Green, cc3: .Green, cc4: .Green, cc5: .Green, cc6: .Green, cc7: .Green, cc8: .Green, cc9: .Green, cc10: .Blue)
        
        var lev4Row3 = BrickRow()
        lev4Row3.BrickItems.append(BrickItem(color: .Blue))
        lev4Row3.BrickItems.append(BrickItem(color: .Green))
        lev4Row3.BrickItems.append(BrickItem(color: .Green, behavior: .Blink ))
        lev4Row3.BrickItems.append(BrickItem(color: .Green, behavior: .Blink ))
        lev4Row3.BrickItems.append(BrickItem(color: .Green, behavior: .Blink ))
        lev4Row3.BrickItems.append(BrickItem(color: .Green, behavior: .Blink ))
        lev4Row3.BrickItems.append(BrickItem(color: .Green, behavior: .Blink ))
        lev4Row3.BrickItems.append(BrickItem(color: .Green, behavior: .Blink ))
        lev4Row3.BrickItems.append(BrickItem(color: .Green))
        lev4Row3.BrickItems.append(BrickItem(color: .Blue))
        
        let lev4Row4 = BrickRow(cc1: .Blue, cc2: .Green, cc3: .Green, cc4: .Green, cc5: .Green, cc6: .Green, cc7: .Green, cc8: .Green, cc9: .Green, cc10: .Blue)
        let lev4Row5 = BrickRow(cc1: .Blue, cc2: .Blue, cc3: .Blue, cc4: .Blue, cc5: .Blue, cc6: .Blue, cc7: .Blue, cc8: .Blue, cc9: .Blue, cc10: .Blue)
        
        level.bricks.Rows.append(lev4Row1)
        level.bricks.Rows.append(lev4Row2)
        level.bricks.Rows.append(lev4Row3)
        level.bricks.Rows.append(lev4Row4)
        level.bricks.Rows.append(lev4Row5)
        
        level.theme.backgroundColor = SKColor.black
        level.theme.borderColor = SKColor(cgColor: UIColor.lightBlue.cgColor)
        level.theme.gapColor = SKColor.black
        level.theme.fillingColor = SKColor.black
        level.theme.primaryThemeColor = SKColor(cgColor: UIColor.lightBlue.cgColor)
        level.theme.secondaryThemeColor = SKColor.white
        
        return level
    }
    
    private func CreateLevel5() -> Level
    {
        let level = Level(levelNumber: 5)
        
        var lev5Row1 = BrickRow()
        lev5Row1.BrickItems.append(BrickItem(color: .Red, behavior: .MoveRight ))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        lev5Row1.BrickItems.append(BrickItem(color: .None))
        
        let lev5Row2 = BrickRow(cc1: .Blue, cc2: .Blue, cc3: .Blue, cc4: .Blue, cc5: .Blue, cc6: .Blue, cc7: .Blue, cc8: .Blue, cc9: .Blue, cc10: .Blue)
        
        var lev5Row3 = BrickRow()
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .None))
        lev5Row3.BrickItems.append(BrickItem(color: .Red, behavior: .MoveLeft))
        
        let lev5Row4 = BrickRow(cc1: .Blue, cc2: .Blue, cc3: .Blue, cc4: .Blue, cc5: .Blue, cc6: .Blue, cc7: .Blue, cc8: .Blue, cc9: .Blue, cc10: .Blue)
        
        var lev5Row5 = BrickRow()
        lev5Row5.BrickItems.append(BrickItem(color: .Red, behavior: .MoveRight ))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))
        lev5Row5.BrickItems.append(BrickItem(color: .None))

        level.bricks.Rows.append(lev5Row1)
        level.bricks.Rows.append(lev5Row2)
        level.bricks.Rows.append(lev5Row3)
        level.bricks.Rows.append(lev5Row4)
        level.bricks.Rows.append(lev5Row5)
        
        level.theme.backgroundColor = SKColor.black
        level.theme.borderColor = SKColor.red
        level.theme.gapColor = SKColor.black
        level.theme.fillingColor = SKColor.black
        level.theme.primaryThemeColor = SKColor.red
        level.theme.secondaryThemeColor = SKColor.white
        
        return level
    }
    
}
