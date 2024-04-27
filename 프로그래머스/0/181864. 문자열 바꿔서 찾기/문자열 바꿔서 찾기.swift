import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    
    var str = ""
    for c in myString {
        str += (c=="A") ? "B" : "A"
    }
    
    return str.contains(pat) ? 1 : 0
}