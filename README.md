# Shell Scripts

- [Array](./tutorials/array.md)
- [Copy files from folder](./tutorials/update_repository.md)
   - This script copies files from one git directory from another, to help simplifying git repositories
- [Loop Curl Cli Shell Linux](./tutorials/loop_curl_cli_shell.md)
- [Square root](./square_root.sh)

## Enable Permission
```
chmod u+x script.sh

./script.sh
```

### Sum two numbers in a single line
```sh
read -p "a:" a; read -p "b:" b; echo $((a + b))
```

#### Explanation:
1. **Reading input:**
   - `read -p "a:" a`: Prompts the user to input a value for variable `a`. The `-p` option allows you to specify a prompt string ("a:") that is displayed to the user.
   - `read -p "b:" b`: Prompts the user to input a value for variable `b`. The `-p` option specifies the prompt string ("b:") that is displayed to the user.
2. **Performing arithmetic and printing the result:**
   - `echo $((a + b))`: Performs the arithmetic operation of adding the values of `a` and `b`, and then prints the result. The `$((...))` syntax is used for arithmetic expansion in the shell, which allows for performing calculations.

### Math operation in a single line
```sh
read -p "a:" a; read -p "b:" b; read -p "o:" o; echo `expr $a $o $b`
```

#### Explanation:
1. **Reading input:** (Refer to the explanation above)
   - `read -p "a:" a`
   - `read -p "b:" b`
   - `read -p "o:" o`: Prompts the user to input a value for variable `o`, which is expected to be a mathematical operator (e.g., `+`, `-`, `*`, `/`). The `-p` option specifies the prompt string ("o:") that is displayed to the user.
2. **Performing arithmetic and printing the result:**
   - `echo \`expr $a $o $b\``: Performs the arithmetic operation specified by the operator `o` on the values of `a` and `b`, and then prints the result. The backticks `` `...` `` are used for command substitution, where the expression inside the backticks is executed, and its output is returned. The `expr` command evaluates the expression `$a $o $b`.

### Improved and safer version using `bc`
To handle floating-point arithmetic and avoid issues with certain operators, we can use `bc` (a command-line calculator):
```sh
read -p "a:" a; read -p "b:" b; read -p "o:" o; echo "$a $o $b" | bc
```

#### Explanation:
1. **Reading input:** (Refer to the explanation above)
   - `read -p "a:" a`
   - `read -p "b:" b`
   - `read -p "o:" o`
2. **Performing arithmetic and printing the result:**
   - `echo "$a $o $b" | bc`: Constructs the arithmetic expression and pipes it to `bc` for evaluation. This method handles floating-point numbers and more complex arithmetic operations.

### Filter files to delete
```sh
for val in $(ls); do if [ "$val" != "car.png" ]; then rm -rf $val; fi; done
```

### One line loop
```sh
for val in {1..5}; do echo $val; done
```
### Notes

```sh
# Reads input and sets it in variable 'a'
read -p "input number: " a

# Checks if both 'a' and 'b' are set
if [ -n "$a" -a -n "$b" ]; then
  echo "Both 'a' and 'b' are set."
fi

# Checks if either 'a' or 'b' is set
if [ -n "$a" -o -n "$b" ]; then
  echo "Either 'a' or 'b' is set."
fi

# Checks if 'a' is empty
if [ -z "$a" ]; then
  echo "'a' is empty."
fi

# Checks if the number of arguments is not equal to 2
if [ $# -ne 2 ]; then
  echo "The number of arguments is not equal to 2."
fi
# The symbol $# is the number of arguments
# The symbol -ne stands for "not equal"

# Evaluates expression
echo $(expr $a $operand $b)

# Reads two inputs and evaluates their sum
read -r x
read -r z
echo $(expr $x + $z)
```
