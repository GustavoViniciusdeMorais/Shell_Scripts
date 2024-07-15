# Building and Looping Through an Array in Shell Script

#### Step 1: Create an Array

In shell scripting, you can create an array that contains different types of elements, such as a number, a string, and another array. Here’s how you can do it:

```sh
# Create an array with a number, a string, and another array
my_number=42
my_string="Hello, World!"
my_inner_array=(1 2 3)

my_array=($my_number "$my_string" "${my_inner_array[@]}")
```

The syntax `"${my_inner_array[@]}"` is used in shell scripting to refer to all the elements of an array, `my_inner_array`, and expand them as individual elements. Here’s a detailed explanation:

### Syntax Explanation

- **`${my_inner_array[@]}`**:
  - `${...}`: This is used for parameter expansion in shell scripting. It allows you to access the value of a variable or perform operations on variables.
  - `my_inner_array`: This is the name of the array variable.
  - `[@]`: This tells the shell to expand to all elements of the array. 

### How It Works
When you use `"${my_inner_array[@]}"`, it expands to all the elements of the array `my_inner_array`, with each element being treated as a separate quoted string.

#### Step 2: Loop Through the Array

To loop through the elements of the array, you can use the `for` loop:

```sh
# Loop through the array and print each element
for val in "${my_array[@]}"; do
  echo $val
done
```

#### Explanation:
1. **Creating the Array:**
   - `my_number=42`: Defines a variable `my_number` with a numeric value.
   - `my_string="Hello, World!"`: Defines a variable `my_string` with a string value.
   - `my_inner_array=(1 2 3)`: Defines an array `my_inner_array` with three numeric values.
   - `my_array=($my_number "$my_string" "${my_inner_array[@]}")`: Combines the number, string, and inner array into a single array `my_array`. The `"${my_inner_array[@]}"` syntax expands the inner array elements as individual elements in the `my_array`.

2. **Looping Through the Array:**
   - `for val in "${my_array[@]}"; do`: Starts a `for` loop that iterates over each element in `my_array`. The `"${my_array[@]}"` syntax expands all elements of the array.
   - `echo $val`: Prints the current element `val`.
   - `done`: Ends the `for` loop.

### Complete Script
Here is the complete script:

```sh
#!/bin/bash

# Create an array with a number, a string, and another array
my_number=42
my_string="Hello, World!"
my_inner_array=(1 2 3)

my_array=($my_number "$my_string" "${my_inner_array[@]}")

# Loop through the array and print each element
for val in "${my_array[@]}"; do
  echo $val
done
```

#### Running the Script
1. Save the script to a file, for example `array_example.sh`.
2. Make the script executable: `chmod +x array_example.sh`.
3. Run the script: `./array_example.sh`.

You should see the output:
```
42
Hello, World!
1
2
3
```