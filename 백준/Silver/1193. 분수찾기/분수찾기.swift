let x = Int(readLine()!)!

var count = 1
var index = 1

while count < x {
    index += 1
    count += index
}

let start = count - index + 1
let end = count
var number = index
let sum = index + 1

for i in start...end {
    if i == x {
        if index % 2 != 0 {
            print("\(number)/\(sum-number)")
            break
        } else {
            print("\(sum-number)/\(number)")
            break
        }
    }
    number -= 1
}