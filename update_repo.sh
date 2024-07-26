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