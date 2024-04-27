import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    let str1 = myString.uppercased()
    let str2 = pat.uppercased()
    
    return str1.contains(str2) ? 1 : 0
}