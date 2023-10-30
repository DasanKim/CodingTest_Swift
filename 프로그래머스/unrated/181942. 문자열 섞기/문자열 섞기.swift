import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    var newString: String = ""
    let string1 = Array(str1)
    let string2 = Array(str2)
    
    for index in 0..<string1.count {
        newString += String(string1[index]) + String(string2[index])
    }
    
    return newString
}