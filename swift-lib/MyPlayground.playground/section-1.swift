// Playground - noun: a place where people can play

import Foundation



var nae:String="1234567890"



func subString(sIndex:Int,c:Int) -> String
{
   
        //推进的
        let startIndex = advance(0, sIndex)
    
        let maxCount = (countElements(nae) - sIndex);
    
        let end = sIndex+c > maxCount ? maxCount : sIndex+c;
    
        let endIndex = advance(startIndex,end);
    
        return nae[Range(start: startIndex, end: endIndex)]
   
}


subString(2, 4)
