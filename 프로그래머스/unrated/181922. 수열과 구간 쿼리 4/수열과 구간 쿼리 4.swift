import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var array = arr
    
    for query in queries {
        for (i, n) in array.enumerated() {
            if query[0]...query[1] ~= i && i % query[2] == 0 {
                array[i] += 1
            }
        }
    }
    
    return array
}