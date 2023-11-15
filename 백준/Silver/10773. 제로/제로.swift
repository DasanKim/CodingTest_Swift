let k = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<k {
    let n = Int(readLine()!)!

    if n == 0 {
        arr.removeLast()
    } else {
        arr.append(n)
    }
}

print(arr.reduce(0,+))