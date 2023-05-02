#!/bin/bash

# Function to perform quicksort
quicksort() {
    local left=$1
    local right=$2
    local pivot=${item_indices[$((left + (right - left) / 2))]}
    local i=$left
    local j=$right

    while (( i <= j )); do
        while [[ ${item_priorities[${item_indices[$i]}]} -lt ${item_priorities[$pivot]} ]]; do
            (( i++ ))
        done
        while [[ ${item_priorities[${item_indices[$j]}]} -gt ${item_priorities[$pivot]} ]]; do
            (( j-- ))
        done
        if (( i <= j )); then
            local temp=${item_indices[$i]}
            item_indices[$i]=${item_indices[$j]}
            item_indices[$j]=$temp
            (( i++ ))
            (( j-- ))
        fi
    done

    if (( left < j )); then
        quicksort $left $j
    fi
    if (( i < right )); then
        quicksort $i $right
    fi
}

# Prompt user to enter items
echo ""
echo "Enter items, one per line. Enter 'end' when done:"
item_count=0
while true; do
    read item
    if [ -z "$item" ]; then
        echo "You didn't enter anything."
        continue
    fi
    if [[ $item == "end" ]]; then
        break
    fi
    item_priorities[$item_count]=0
    item_indices[$item_count]=$item_count
    items[$item_count]="$item"
    (( item_count++ ))
done

# Calculate number of required comparisons
num_comparisons=$((item_count*(item_count-1)/2))

# Prompt user to prioritize items
comparison_count=0
echo ""
echo "Comparing items:"
for (( i=0; i<$item_count; i++ )); do
    for (( j=$i+1; j<$item_count; j++ )); do
        (( comparison_count++ ))
        percent_complete=$((comparison_count*100/num_comparisons))
        progress=""
        for (( k=0; k<20; k++ )); do
            if (( percent_complete > k*5 )); then
                progress+="="
            else
                progress+=" "
            fi
        done
        echo ""
        echo -ne "\rProgress: [$progress] $percent_complete%"
        echo ""
        echo "Which item is more important? [1/2]"
        echo "1. ${items[$i]}"
        echo "2. ${items[$j]}"
        while true; do
            read input
            if [[ $input == "2" ]]; then
                (( item_priorities[$i]++ ))
                break
            elif [[ $input == "1" ]]; then
                (( item_priorities[$j]++ ))
                break
            else
                echo "Invalid input. Please enter '1' or '2'."
            fi
        done
    done
done
echo

# Sort items by priority using quicksort
quicksort 0 $((item_count-1))

# Print sorted items
echo "Sorted items:"
for (( i=0; i<$item_count; i++ )); do
    echo "$(($i+1)). ${items[${item_indices[$i]}]}"
done

