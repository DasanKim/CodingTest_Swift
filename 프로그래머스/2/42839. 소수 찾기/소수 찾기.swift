import Foundation

var result: Set<String> = Set()
var visit: [Bool] = []

func solution(_ numbers:String) -> Int {
    let numberArr = numbers.compactMap { String($0) }    
    visit = Array(repeating: false, count: numberArr.count)

    for i in 1...numberArr.count {
        process(index: i-1, maxDigits: numberArr.count, current: "", numberArr)
    }
    
    return result.count

}

func process(index: Int, maxDigits: Int, current: String, _ arr: [String]) {
    if index == maxDigits {
        let number = Int(current) ?? 1
        if isPrime(number) {
            result.insert(String(number))
        }
        return
    }

    // 매 재귀 때마다 visit배열을 0부터 n-1까지 돎
    // 주의! numberArr[index] 아님 index는 현재 자리수 일뿐
    for i in 0..<visit.count {
        if !visit[i] {
            visit[i] = true
            process(index: index + 1, maxDigits: maxDigits, current: current + arr[i], arr)
            visit[i] = false
        }
    }
}

func isPrime(_ number: Int) -> Bool {
    if number == 1 || number == 0 { return false }
    var i = 2
    
    while i*i <= number {
        if number % i == 0 { return false }
        i += 1
    }
    
    return true
}