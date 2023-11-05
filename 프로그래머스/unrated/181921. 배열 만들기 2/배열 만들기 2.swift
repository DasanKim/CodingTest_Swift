import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    var result = [String]()
    
    for i in l...r {
        if String(i).contains { $0 != "5" && $0 != "0" } { continue }
        result.append(String(i))
    }
    
    return result.isEmpty ? [-1] : result.compactMap { Int($0) }
}