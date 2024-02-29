let n = Int(readLine()!)!

var count = 0
for i in stride(from: 1, through: n, by: 1) {
    var n = i

    while n % 5 == 0 {
        count += 1
        n /= 5
    }
}

print(count)