let input = readLine()!.split(separator: " ").compactMap{ Int($0) }
let k = input[0]
let n = input[1]
var arr = [Int]()
var maxLength = 0
var result = 0

for _ in 0..<k {
    let length = Int(readLine()!)!
    arr.append(length)
    maxLength = max(length, maxLength)
}

var st = 1
var en = maxLength

while st <= en {
    let mid = (st+en)/2

    if isCheck(d: mid) >= n {
        if result < mid {
            result = mid
        }
        st = mid + 1
    } else {
        en = mid - 1
    }
}

print(result)

func isCheck(d: Int) -> Int {
    var sum = 0

    for a in arr {
        sum += a / d
    }

    return sum
}