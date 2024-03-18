let n = Int(readLine()!)!
var log = Set<String>()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let name = input[0]
    let action = input[1]

    switch action {
        case "enter":
        log.insert(name)
        case "leave":
        log.remove(name)
        default:
        print("error")
    }
}

log.sorted(by: >).forEach {
    print($0)
}