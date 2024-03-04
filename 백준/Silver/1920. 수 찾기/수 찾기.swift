let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

let _ = Int(readLine()!)!
let b = readLine()!.split(separator: " ").compactMap { Int($0) }

for target in b {
    print(binarySearch(target) ? "1" : "0")
}

func binarySearch(_ target: Int) -> Bool {
    var st = 0
    var en = n-1

    while st <= en {
        let mid = (st+en) / 2
        if a[mid] > target {
            en = mid - 1
        } else if a[mid] < target {
            st = mid + 1
        } else {
            return true
        }
    }
    return false
}