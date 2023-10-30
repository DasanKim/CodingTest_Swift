import Foundation

func solution(_ a:Int, _ b:Int) -> Int {
    guard let result1 = Int("\(a)\(b)") else { return 0 }
    let result2 = 2 * a * b
    
    return result1 < result2 ? result2 : result1
}