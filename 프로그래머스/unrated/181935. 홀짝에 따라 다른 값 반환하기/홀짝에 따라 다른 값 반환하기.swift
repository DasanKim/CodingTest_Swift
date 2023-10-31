import Foundation

func solution(_ n:Int) -> Int {
    var sum = 0
    
    if isEven(n) {
        (1...n).forEach { number in
            sum += isEven(number) ? (number*number) : 0
        }
    } else {
        (1...n).forEach { number in
            sum += isEven(number) ? 0 : number
        }
    }
    
    return sum
}

func isEven(_ n: Int) -> Bool {
    return n % 2 == 0 ? true : false
}