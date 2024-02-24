let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").compactMap{ Int($0) }
var result = 0

for number in arr {
    if isPrime(number) {
        result += 1
    }
}

print(result)

func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    var i = 2
    while i*i <= number {
        if number % i == 0 { return false }
        i += 1
    }
    return true
}