import Foundation

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
//     var str = my_string
    
//     for q in queries {
//         let range = str.index(str.startIndex, offsetBy: q[0])...str.index(str.startIndex, offsetBy: q[1])
//         let subAarray = str[range].reversed()
//         str.removeSubrange(range)
//         str.insert(contentsOf: subAarray, at: str.index(str.startIndex, offsetBy: q[0]))
//     }
    
    var str = my_string.map { String($0) }
    
    queries.forEach { str[$0[0]...$0[1]].reverse() }

    return str.joined()
}