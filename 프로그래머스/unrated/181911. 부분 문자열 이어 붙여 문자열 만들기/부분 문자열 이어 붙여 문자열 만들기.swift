import Foundation

func solution(_ my_strings:[String], _ parts:[[Int]]) -> String {
    var result = ""
    
    for i in 0..<my_strings.count {
        var range = parts[i][0]...parts[i][1]
        var arr = my_strings[i].map({ String($0) })[range].joined()
        
        result += arr
    }
    
    return result
}