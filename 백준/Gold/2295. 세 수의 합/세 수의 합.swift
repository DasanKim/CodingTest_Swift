test()

func test() {
    let n = Int(readLine()!)!
    var a = [Int]()
    var b = [Int]()

    for _ in 0..<n {
        a.append(Int(readLine()!)!)
    }

    a.sort()

    for i in 0..<n {
        for j in i..<n {
            if a[n-1] >= a[i] + a[j] {
                b.append(a[i] + a[j])
            }
        }
    }

    let sum = Set(b).sorted()

    for x in a.reversed() {
        for y in a.reversed() {
            if x-y > 0 && binarySearch(x-y) {
                //print("결과있음: \(x)")
                print(x)
                return
            }
        }
    }

    func binarySearch(_ target: Int) -> Bool {
        var st = 0
        var en = sum.count-1

        while st <= en {
            let mid = (st+en) / 2
            if sum[mid] > target {
                en = mid - 1
            } else if sum[mid] < target {
                st = mid + 1
            } else {
                return true
            }
        }
        return false
    }
}