let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").compactMap { Int($0) }

var result = ""

for target in b {
    result += "\(findRight(target) - findLeft(target)) "
}

print(result)

func findLeft(_ target: Int) -> Int {
    var st = 0
    var en = n

    while st < en {
        let mid = (st+en) / 2
        if a[mid] >= target {
            en = mid
        } else if a[mid] < target {
            st = mid + 1
        }
    }
    return st
}

func findRight(_ target: Int) -> Int {
    var st = 0
    var en = n

    while st < en {
        let mid = (st+en) / 2
        if a[mid] > target {
            en = mid
        } else if a[mid] <= target {
            st = mid + 1
        }
    }
    return st
}