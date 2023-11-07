import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    let startIndex = my_string.index(my_string.startIndex, offsetBy: my_string.count-n)
    let endIndex = my_string.index(before: my_string.endIndex)
    
    return String(my_string[startIndex...endIndex])
}