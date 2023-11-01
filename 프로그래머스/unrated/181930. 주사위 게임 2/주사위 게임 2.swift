import Foundation

func solution(_ a:Int, _ b:Int, _ c:Int) -> Int {
    if (a == b) && (a == c) {
        return Int(pow(3.0, 3.0)) * Int(pow(Double(a), 6.0))
    } else if (a != b) && (a != c) && (b != c) {
        return a + b + c
    } else {
        return (a + b + c) * Int((pow(Double(a), 2.0) + pow(Double(b), 2.0) + pow(Double(c), 2.0)))
    }
}