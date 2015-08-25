//
//  ArrayExtension.swift
//  Bag
//
//  Created by ligh on 15/8/23.
//  Copyright (c) 2015年 ligh. All rights reserved.
//

import Foundation


extension Array{
    
//    func indexOfObject(object : AnyObject) -> NSInteger
//    {
//        return (self as! NSArray).indexOfObject(object)
//    }
    
    func indexOf<T : Equatable>(object:T) -> Int {
       
        for (index,obj) in enumerate(self) {
            if obj as! T == object {
                return index
            }
        }
        return NSNotFound
    }
    
    
    func indexesOfSubset<T : Equatable>(objects : [T]) -> [Int] {
        
        // Create storage for filtered objectsand results
        var unusedObjects = objects
        var result : [Int] = []
        
        // Enumerate through all objects in array
        for (index, obj) in enumerate(self) {
            
            // Enumerate again through all objects that has not been found
            for x in unusedObjects {
                
                // If we hit match, append result, remove it from usused objects
                if obj as! T == x {
                    result.append(index)
                    unusedObjects = unusedObjects.filter( { $0 != x } )
                    break
                }
            }
        }
        
        // Get results
        return result
    }

}