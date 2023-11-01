import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var new_num_list = num_list
    let last = num_list[num_list.count-1]
    let beforeLast = num_list[num_list.count-2]
    
    new_num_list.append(beforeLast < last ? last - beforeLast : last * 2)
    
    return new_num_list
}