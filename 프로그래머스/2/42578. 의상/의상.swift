import Foundation

// 조합론의 곱의 법칙 사용하기
// https://tsi0511.tistory.com/100
func solution(_ clothes:[[String]]) -> Int {
    var dic = [String:Int]()
    
    for c in clothes {
        dic[c[1], default: 0] += 1
    }
    
    var result = 1
    for d in dic {
        result *= (d.value+1)
    }
    
    return result - 1
}