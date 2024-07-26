# Update git repository
With files from another folder

```bash
#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <first_directory> <second_directory> <branch_name>"
    exit 1
fi

# Assign arguments to variables
FIRST_DIR=$1
SECOND_DIR=$2
BRANCH_NAME=$3

# Step into the first directory
echo "Entering directory $FIRST_DIR"
cd "$FIRST_DIR" || { echo "Failed to enter directory $FIRST_DIR"; exit 1; }

# Checkout to the specified branch
echo "Checking out to branch $BRANCH_NAME"
git fetch origin
git checkout "$BRANCH_NAME" || { echo "Branch $BRANCH_NAME does not exist in origin"; exit 1; }

# Delete everything in the directory except the .git directory
echo "Deleting all contents in $FIRST_DIR except .git"
find . -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +

# Copy contents from the second directory to the first directory except .git
echo "Copying contents from $SECOND_DIR to $FIRST_DIR"
cd "$SECOND_DIR" || { echo "Failed to enter directory $SECOND_DIR"; exit 1; }
tar --exclude='.git' -cf - . | (cd "$FIRST_DIR" && tar xf -)

echo "Done"
```

### Explanation:
1. The script starts by checking if the correct number of arguments (3) is provided.
2. It assigns the input arguments to variables for clarity.
3. The script then changes to the first directory.
4. It fetches the latest branches from the origin and checks out to the specified branch.
5. All contents in the first directory, except for the `.git` directory, are deleted.
6. The script copies all contents from the second directory to the first directory, excluding the `.git` directory from the second directory.
7. Finally, it prints "Done" to indicate completion.

### Usage:
Save the script to a file, for example `update_repo.sh`, and give it execute permissions:
```bash
chmod +x update_repo.sh
```

Run the script with the required arguments:
```bash
./update_repo.sh /path/to/first_directory /path/to/second_directory branch_name
```

### Command find
```bash
find . -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
```
#### Explanation of each part:

1. **`find .`**: 
   - This starts the `find` command in the current directory (`.`).

2. **`-mindepth 1`**: 
   - This option ensures that `find` does not consider the starting point itself (`.`). It only considers items at least one level deep. This avoids deleting the current directory itself.

3. **`-maxdepth 1`**: 
   - This option ensures that `find` only looks at the immediate children of the current directory. It prevents `find` from descending into subdirectories.

4. **`! -name '.git'`**: 
   - The `!` operator negates the condition that follows it. 
   - `-name '.git'` specifies that any item named `.git` should be matched. The `!` negates this, meaning anything not named `.git` will be matched.
   - As a result, this condition ensures that the `.git` directory is excluded from the search results.

5. **`-exec rm -rf {} +`**: 
   - `-exec` allows you to execute a command on each item found by `find`.
   - `rm -rf` is the command to remove files and directories recursively and forcefully.
   - `{}` is a placeholder for each found item.
   - The `+` at the end allows `find` to pass multiple filenames at once to `rm`, reducing the number of times `rm` is executed (this is more efficient than running `rm` for each file individually).

### Command tar
```bash
tar --exclude='.git' -cf - . | (cd "$FIRST_DIR" && tar xf -)
```

#### Explanation of each part:

1. **`tar --exclude='.git' -cf - .`**: 
   - **`tar`**: The tar command is used to create and manipulate archive files.
   - **`--exclude='.git'`**: This option tells `tar` to exclude any files or directories named `.git` from the archive.
   - **`-c`**: This option stands for "create" and tells `tar` to create a new archive.
   - **`-f -`**: The `-f` option specifies the filename of the archive. Using `-` as the filename means that the archive should be written to the standard output (stdout) instead of a file.
   - **`.`**: This specifies the current directory as the source of the files to be included in the archive.

2. **`|`**:
   - The pipe `|` takes the output of the command on its left (`tar --exclude='.git' -cf - .`) and uses it as the input for the command on its right (`(cd "$FIRST_DIR" && tar xf -)`).

3. **`(cd "$FIRST_DIR" && tar xf -)`**:
   - **`( ... )`**: The parentheses are used to create a subshell. Commands inside the parentheses are executed in a new shell, which allows for changing the directory without affecting the current shell.
   - **`cd "$FIRST_DIR"`**: This command changes the current directory to the value stored in the variable `FIRST_DIR`.
   - **`&&`**: This is a logical AND operator. It ensures that the next command (`tar xf -`) is executed only if the previous command (`cd "$FIRST_DIR"`) succeeds.
   - **`tar xf -`**: This command extracts the files from the archive. The `-x` option stands for "extract", and the `-f -` option specifies that the archive should be read from the standard input (stdin).
