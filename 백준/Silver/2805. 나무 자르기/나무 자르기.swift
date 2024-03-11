let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let arr = readLine()!.split(separator: " ").compactMap { Int($0) }

var result = 0

var st = 1
var en = arr.max()!

while st <= en {
    let mid = (st+en)/2

    if isCheck(d: mid) >= input[1] {
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
        if a > d {
            sum += a - d
        }
    }

    return sum
}