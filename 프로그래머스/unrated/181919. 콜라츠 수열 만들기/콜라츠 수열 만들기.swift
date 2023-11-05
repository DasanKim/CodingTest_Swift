import Foundation

func solution(_ n:Int) -> [Int] {
    var x = n
    var result = [n]
    
    while x != 1 {
        x % 2 == 0 ? (x /= 2) : (x = 3 * x + 1)
        result.append(x)
    }
    
    return result
}