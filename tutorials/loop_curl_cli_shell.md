# Loop Curl Cli Shell Linux

#### 1. **Making a Curl Request and Storing the Response**

First, we need to send an HTTP GET request to a specified URL and store the JSON response. We use the `curl` command for this.

#### 2. **Checking the Response**

It's important to verify that the response is not empty. This ensures that the server responded correctly.

#### 3. **Parsing JSON with `jq`**

To handle JSON data, we use `jq`, a powerful command-line JSON processor. This allows us to iterate over each item in the JSON response and extract key-value pairs.

#### 4. **Extracting and Printing Key-Value Pairs**

For each JSON object, we extract all key-value pairs and print them out.

### Example Script

```bash
#!/bin/bash

# URL to send the GET request to
url="https://api.example.com/data"

# Make the curl request and store the response
response=$(curl -s $url)

# Check if the response is not empty
if [ -n "$response" ]; then
  # Use jq to parse the JSON and loop through each object
  echo "$response" | jq -c '.[]' | while read item; do
    # Extract and print each key-value pair
    echo "$item" | jq -r 'to_entries[] | "\(.key): \(.value)"'
    echo "------------------"
  done
else
  echo "No response received from the server."
fi
```

### Explanation

1. **`url="https://api.example.com/data"`:**
   - Replace this with the actual API endpoint you want to request.

2. **`response=$(curl -s $url)`:**
   - Sends a GET request to the specified URL and stores the JSON response in the `response` variable. The `-s` flag makes `curl` operate silently, suppressing progress and error messages.

3. **`if [ -n "$response" ]; then`:**
   - Checks if the response is not empty.

4. **`echo "$response" | jq -c '.[]'`:**
   - Pipes the JSON response into `jq`. The `-c` option ensures that each JSON object is output on a single line. The `'.[]'` part iterates over each item in the top-level array.

5. **`while read item; do ... done`:**
   - Loops through each JSON object, which is read into the `item` variable.

6. **`echo "$item" | jq -r 'to_entries[] | "\(.key): \(.value)"'`:**
   - For each JSON object, this line converts it into an array of key-value pairs (`to_entries[]`). It then prints each pair in the format `key: value`. The `-r` option outputs raw strings, without quotes.

7. **`echo "------------------"`:**
   - Prints a separator between each JSON object for readability.

### Usage

- **Saving the Script:** Save the above script to a file, for example, `fetch_data.sh`.
- **Making the Script Executable:** Make the script executable by running `chmod +x fetch_data.sh`.
- **Running the Script:** Execute the script by running `./fetch_data.sh`.

### Prerequisites

Ensure that `jq` is installed on your system. On Ubuntu, you can install it with:

```sh
sudo apt-get install jq
```

This script will print all key-value pairs in each JSON object returned by the API. It is useful for generic JSON processing when you don't know the structure of the response in advance.
