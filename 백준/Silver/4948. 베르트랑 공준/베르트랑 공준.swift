let MAX_N = 123456
let doubleN = 2 * MAX_N
var arr = Array(repeating: true, count: doubleN + 1)

arr[1] = false

var i = 2
while i*i <= doubleN {
    if arr[i] == true {
        for j in stride(from: i*i, through: doubleN, by: i) {
            arr[j] = false
        }
    }
    i += 1
}

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }

    var count = 0

    for i in n+1...2*n {
        if arr[i] == true {
            count += 1
        }
    }
    print(count)
}