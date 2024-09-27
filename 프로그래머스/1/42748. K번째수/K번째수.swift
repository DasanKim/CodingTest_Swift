import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var result = [Int]()
    
    for c in commands {
        let r = array[c[0]-1...c[1]-1].sorted(by: <)[c[2]-1]
        result.append(r)
    }
    
    return result
}