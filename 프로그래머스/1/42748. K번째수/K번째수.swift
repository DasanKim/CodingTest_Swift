import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    let n = commands.count
    var result = Array(repeating: 0, count: n)
    
    for c in 0..<n {
        let command = commands[c]
        let i = command[0]-1
        let j = command[1]-1
        let k = command[2]-1
        result[c] = array[i...j].sorted()[k]
    }
    
    return result
}