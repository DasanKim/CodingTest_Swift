import Foundation

func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    var array = Array(repeating: 0, count: 6)
    array[a-1] += 1
    array[b-1] += 1
    array[c-1] += 1
    array[d-1] += 1
    
    var p = 0
    var q = 0
    var r = 0
    
    for (i, n) in array.enumerated() {
       switch n {
       case 4, 3:
           p = i + 1
       case 2:
           if p == 0 {
               p = i + 1
           } else {
               q = i + 1
           }
       case 1:
           if q == 0 {
               q = i + 1
           } else {
               r = i + 1
           }
       default:
           continue
       }
    }
    
    switch array.max() {
    case 4:
        return p * 1111
    case 3:
        return (10 * p + q) * (10 * p + q)
    case 2:
        return r == 0 ? (p + q) * abs(p - q) : q * r
    case 1:
        return [a, b, c, d].min()!
    default:
        return 0
    }
}