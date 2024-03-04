let _ = Int(readLine()!)!
let x = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = Set(x).sorted()

var result = ""

for target in x {
    result += "\(findLeft(target)) "
}

print(result)

func findLeft(_ target: Int) -> Int {
    var st = 0
    var en = a.count

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