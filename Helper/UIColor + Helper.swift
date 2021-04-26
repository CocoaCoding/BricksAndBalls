//  UIColor + Helper.swift
//  SwiftBricks
//  Created by Holger Hinzberg on 21.03.15.
//  Copyright (c) 2015 Holger Hinzberg. All rights reserved.

import Foundation
import SpriteKit

extension UIColor
{
    public static func randomColor() -> UIColor
    {
        let redCol = CGFloat(arc4random_uniform(255)) / 255.0
        let greenCol = CGFloat(arc4random_uniform(255)) / 255.0
        let blueCol = CGFloat(arc4random_uniform(255)) / 255.0
        return UIColor(red: redCol, green: greenCol, blue: blueCol, alpha: 1.0)
    }

    // Creates a UIColor from a Hex string.
    public static func colorWithHexString (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#"))
        {
            //cString = cString.substring(from: cString.index(cString.startIndex, offsetBy: 1))
            cString = String(cString[...cString.index(cString.startIndex, offsetBy: 1)])
        }
        
        if (cString.count   != 6)
        {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    public static func fromRGB(r: Double, g:Double, b:Double) -> UIColor {
        return UIColor(
            red: CGFloat(r / 255.0),
            green: CGFloat(g / 255.0),
            blue: CGFloat(b / 255.0),
            alpha: CGFloat(1.0)
        )
    }
        
    class func veryLightGrayColor()->UIColor
    {
        return UIColor(red: CGFloat(0.98), green: CGFloat(0.98) , blue: CGFloat(0.98), alpha: CGFloat(1.0))
    }
    
    class func iOS7redColor()->UIColor
    {
        return UIColor(red: CGFloat(1.0), green: CGFloat(0.22), blue: CGFloat(0.22), alpha: CGFloat(1.0))
    }
    
    class func iOS7orangeColor()->(UIColor)
    {
        return UIColor(red: CGFloat(1.0), green: CGFloat(0.58), blue: CGFloat(0.21), alpha: CGFloat(1.0))
    }
    
    class func iOS7yellowColor()->UIColor
    {
        return UIColor(red: CGFloat(1.0), green: CGFloat(0.79), blue: CGFloat(0.28), alpha: CGFloat(1.0))
    }
    
    class func iOS7greenColor()->UIColor
    {
        return UIColor(red: CGFloat(0.27), green: CGFloat(0.85), blue: CGFloat(0.46), alpha: CGFloat(1.0))
    }
    
    class func iOS7lightBlueColor()->UIColor
    {
        return UIColor(red: CGFloat(0.18), green: CGFloat(0.67), blue: CGFloat(0.84), alpha: CGFloat(1.0))
    }
    
    class func iOS7darkBlueColor()->UIColor
    {
        return UIColor(red: CGFloat(0.0), green: CGFloat(0.49), blue: CGFloat(0.96), alpha: CGFloat(1.0))
    }
    
    class func iOS7purpleColor()->UIColor
    {
        return UIColor(red: CGFloat(0.35), green: CGFloat(0.35), blue: CGFloat(0.81), alpha: CGFloat(1.0))
    }
    
    class func iOS7pinkColor()->UIColor
    {
        return UIColor(red: CGFloat(1.0), green: CGFloat(0.17), blue: CGFloat(0.34), alpha: CGFloat(1.0))
    }
    
    class func iOS7darkGrayColor()->UIColor
    {
        return UIColor(red: CGFloat(0.56), green: CGFloat(0.56), blue: CGFloat(0.56), alpha: CGFloat(1.0))
    }
    
    class func iOS7lightGrayColor()->UIColor
    {
        return UIColor(red: CGFloat(0.78), green: CGFloat(0.78), blue: CGFloat(0.78), alpha: CGFloat(1.0))
    }
    
    class func lightTransparentBlueColor()->UIColor
    {
        return UIColor(red: CGFloat(0.7), green: CGFloat(0.7), blue: CGFloat(1.0), alpha: CGFloat(0.1))
    }
    
    class func lightCyanColor() ->UIColor
    {
        return UIColor(red: CGFloat(0.8), green: CGFloat(1.0), blue: CGFloat(1.0), alpha: CGFloat(1.0))
    }
    
    class func lightPinkColor() ->UIColor
    {
        return UIColor(red: CGFloat(1.0), green: CGFloat(0.69), blue: CGFloat(0.92), alpha: CGFloat(1.0))
    }
    
    static var skyBlue : UIColor {
        return UIColor.fromRGB(r: 130, g: 204, b: 255)
    }
    
    static var lightBlue : UIColor {
        return UIColor.fromRGB(r: 154, g: 203, b: 255)
    }    
}
