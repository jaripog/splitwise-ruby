Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: intervals = [[1,4],[4,5],[2,3]]
Output: [[1,5]]



[0,0]

[[1,4],[2,3],[8,10],[15,18]]


hash = {
    0 = true
    1 = true
    2 = false
    3 = false

}


lowest = 1
highest = 4

1,4
8,10

2 > lowest and 2 < highest
    continue;

6 > highest
    highest = 6
6 



init

def init
    inp = [[1,4],[2,6],[8,10],[15,18]]
    op = []
    visited_nodes = {}
    inp.each_with_index do |value,index|
        visited_nodes[index] = false
    end

    lowest = inp[0][0] # 1
    highest = inp[0][1] # 4
    visited_nodes[0] = true
    cont = true
    #inp = [[1,6],[8,10],[15,18]]
    inp.each_with_index do |value,index|
        next if index == 0
        if visited_nodes[index] == false && cont

            if value[0] > lowest && value[0] < highest 
                cont = true
            elsif value[0] > highest
                cont = false
                break
            elsif value[0] < lowest
                cont = true
                lowest = value[0]
            end
            # lowest = 1

            if value[1] < highest && value[1] > lowest
                cont = true
            elsif value[1] > highest
                highest = value[1]
            elsif value[1] < lowest
                cont = false
                break
            end
            #highest = 6
            
            if cont == true
                op.push([lowest,highest])
                visited_nodes[index] = true
            end
            cont = true
            

        end
        return op
    end

end






