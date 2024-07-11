# Shell Scripts

## Enable Permission
```

chmod u+x script.sh

./script.sh

```

### Sum two numbers at a single line
```sh
read -p "a:" a; read -p "b:" b; echo $((a + b))
```
### Math operation at single line
```sh
read -p "a:" a; read -p "b:" b; read -p "o:" o; echo `expr $a $o $b`;
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
