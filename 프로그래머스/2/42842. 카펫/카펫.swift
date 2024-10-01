import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var sumYellowXY = (brown/2) - 2 // x가 가로, y가 세로
    let yellowXY = findYellowXY(yellow, sumYellowXY)

    return yellowXY.map { $0 + 2 }
}

// xy = yellow 개수면서, x(가로) >= y(세로)인 조합 찾기
func findYellowXY(_ num: Int, _ sum: Int) -> [Int] {
    var arr: [Int] = []
    
    var i = 1
    while i <= (num/i) {
        if num % i == 0 {
            let x = num/i
            let y = i
            
            if x+y == sum {
                arr.append(x)
                arr.append(y)
            }
        }
        i += 1
    }
    
    return arr
}