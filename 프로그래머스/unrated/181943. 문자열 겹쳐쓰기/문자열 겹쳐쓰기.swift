import Foundation

func solution(_ my_string:String, _ overwrite_string:String, _ s:Int) -> String {
    
    var newString = my_string
    let startIndex = newString.index(newString.startIndex, offsetBy: s)
    let endIndex = newString.index(newString.startIndex, offsetBy: overwrite_string.count + s)
    
    newString.replaceSubrange(startIndex..<endIndex, with: overwrite_string)
    
    return newString
}
