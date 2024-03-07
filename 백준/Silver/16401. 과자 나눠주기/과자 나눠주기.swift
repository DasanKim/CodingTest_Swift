let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let m = input[0]
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

let maxLength = arr.max()!

var result = 0

var st = 1
var en = maxLength

while st <= en {
    let mid = (st+en)/2

    if isCheck(d: mid) >= m {
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