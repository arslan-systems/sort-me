# SortMe

SortMe is a bash script that helps you prioritize items by asking you to compare them pairwise and sort them in order of importance. You can use it to prioritize tasks, goals, or any list of items that you need to sort.

## Getting started

1. Clone the repository or download the `sortme.sh` file.
2. Open a terminal window and navigate to the directory where the file is saved.
3. Make sure the file has execution permission with `chmod +x sortme.sh`.
4. Run the script with `./sortme.sh`.

## Usage

1. Enter the items you want to sort, one per line.
2. When you are done, enter `end` to signal the end of the list.
3. The script will present you with pairwise comparisons of the items, starting with the first two.
4. Choose which item is more important by entering `1` or `2`.
5. The script will keep presenting pairwise comparisons until all items have been compared.
6. Finally, the script will output the sorted list of items.

## Example

```
$ ./sortme.sh

Enter items, one per line. Enter 'end' when done:
go to the gym
get a job offer
buy a car
end

Comparing items:

Progress: [=======             ] 33%
Which item is more important? [1/2]
1. go to the gym
2. get a job offer
2

Progress: [==============      ] 66%
Which item is more important? [1/2]
1. go to the gym
2. buy a car
1

Progress: [====================] 100%
Which item is more important? [1/2]
1. get a job offer
2. buy a car
1

Sorted items:
1. get a job offer
2. go to the gym
3. buy a car
```
