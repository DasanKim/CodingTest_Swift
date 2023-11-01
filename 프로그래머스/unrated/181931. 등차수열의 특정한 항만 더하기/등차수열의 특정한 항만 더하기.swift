import Foundation

func solution(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    let length = included.count
    var result = 0
    
    for index in 0..<length {
        if included[index] == true {
            result += a + (index * d)
        }
    }
    
    return result
}