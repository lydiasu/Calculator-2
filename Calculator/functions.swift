//
//  functions.swift
//  Calculator
//
//  Created by Su Yuqing on 5/2/15.
//  Copyright (c) 2015 Su Yuqing. All rights reserved.
//

import Foundation


func NumberToString(var num: Double)->NSString
{
    
    var text: NSString;
    
    text = NSDecimalNumber(double: num).stringValue;
    
    return text;
    
}

func StringToNumber(var text: NSString)->Double
{
    var num: Double
    
    num = NSString(string: text).doubleValue;
    
    return num;

}

func containsDot (var ss: String) ->Bool{
    
    var arr = Array(ss);
    
    var found: Bool = false;
    
    for var i = 0; i < arr.count; i++
    {
        
        if(arr[i] == ".")
        {
            found = true;
        }
        
    }
    
    return found;
}


func containsSpace (var ss: String) ->Bool{
    
    var arr = Array(ss);
    
    var found: Bool = false;
    
    for var i = 0; i < arr.count; i++
    {
        
        if(arr[i] == " ")
        {
            found = true;
        }
        
    }
    
    return found;
}

func degreeToRadians(var num: Double)->Double
{
    var value = num * M_PI/180
    
    return value
}