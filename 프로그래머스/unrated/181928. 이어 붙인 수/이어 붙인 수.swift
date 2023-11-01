import Foundation

func solution(_ num_list:[Int]) -> Int {
    let oddStrings = num_list.filter({ $0 % 2 == 1 }).map({String($0)}).joined()
    let evenStrings = num_list.filter({ $0 % 2 == 0 }).map({String($0)}).joined()
    
    guard let oddNumbers = Int(oddStrings), 
          let evenNumbers = Int(evenStrings) else { return 0 }
    
    return oddNumbers + evenNumbers
}