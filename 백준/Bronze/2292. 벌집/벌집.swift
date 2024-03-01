let n = Int(readLine()!)!

var i = 0
var index = 1

while true {
    index += 6 * i
    if n <= index {
        print(i+1)
        break
    }
    i += 1
}