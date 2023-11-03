import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var array = [Int]()
    
    for query in queries {
        let number = arr[query[0]...query[1]].filter({ query[2] < $0 }).min() ?? -1
        array.append(number)
    }
    
    return array
}