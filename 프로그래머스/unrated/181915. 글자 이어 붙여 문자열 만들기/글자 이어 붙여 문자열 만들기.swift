import Foundation

func solution(_ my_string:String, _ index_list:[Int]) -> String {
    let s = Array(my_string)
    var result = ""
    
    for i in 0..<index_list.count {
        result += String(s[index_list[i]])
    }
    
    return result
}