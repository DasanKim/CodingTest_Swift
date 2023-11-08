import Foundation

func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    let stringsCount = my_string.count / m
    var result = ""
    
    if m == 1 { return my_string }
    
    for i in 0..<stringsCount {
        result += String(my_string[my_string.index(my_string.startIndex, offsetBy: (c - 1) + i * m)])
    }
    
    return result
}