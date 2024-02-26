let x = Int(readLine()!)!

var turn = 1
var endIndex  = 1

while endIndex < x {
    turn += 1
    endIndex += turn
}

let startIndex = endIndex - turn + 1
let sum = turn + 1
var number = turn

for i in startIndex...endIndex {
    if i == x {
        if turn % 2 != 0 {
            print("\(number)/\(sum-number)")
        } else {
            print("\(sum-number)/\(number)")
        }
        break
    }
    number -= 1
}