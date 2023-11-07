import Foundation

func solution(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
    var result = [Int]()
    
    for str in intStrs {
        let numbers = str.map { String($0) }
        let n = Int(numbers[s...(s+l-1)].joined())!
        
        if n > k { result.append(n)}
    }
    
    return result
}