 #!/bin/bash
# Print the rainbow-colored script title
printf "\n\n\e[38;5;196mC\e[38;5;202mC\e[38;5;226mH\e[38;5;118mM\e[38;5;87mC\e[38;5;27m License Checker\e[0m\n"

  # Check if an argument for the license server was provided
  if [ $# -eq 1 ]; then
    server_arg="$1"
  else
    server_arg=""
  fi

# Check if the license server is up
if ./lmutil lmstat -a | grep -q "license server UP"; then
  printf "\e[1;32mLicense Server is UP\e[0m\n"

user_width=10
host_width=30
disp_width=15

# Print the column headers
# Print the column headers in bright blue
printf "\e[1;34m%-${user_width}s | %-${host_width}s | %-${disp_width}s | %s\n" \
"User" "Host" "Display" "Checkout Time" | column -t -s '|'

  # Parse the license usage information from lmutil lmstat -a
  if [[ -z "$server_arg" ]]; then
    usage_info=$(./lmutil lmstat -a -f MATLAB)
  else
    usage_info=$(./lmutil lmstat -a -f MATLAB -s $server_arg)
  fi

# ./lmutil lmstat -a -f MATLAB | while read -r line; do
echo "$usage_info" | while read -r line; do

#echo "$line"

  # Check if the line contains license usage information (i.e., starts with a space)
  if [[ "$line" == *"(v"* ]]; then

  # Extract the user, user_host, display, version, server_host, port, handle, and checkout_time fields using awk
 user=$(echo "$line" | awk '{gsub(/^ +| +$/,""); print $1}')
  user_host=$(echo "$line" | awk '{gsub(/^ +| +$/,""); print $2}')
  

  display=$(echo "$line" | awk '{print $3}')
  version=$(echo "$line" | awk '{print $4}')
  server_host=$(echo "$line" | awk '{print $5}')
  port=$(echo "$line" | awk '{print $6}')
  handle=$(echo "$line" | awk '{print $7}')
  checkout_time=$(echo "$line" | awk '{print $8, $9, $10, $11, $12, $13}')
  
 # Print the extracted fields
#  echo "User: $user, Host: $user_host, Display: $display, Version: $version, Server: $server_host:$port, Handle: $handle, Checked out at: $checkout_time"
#  echo "User: $user, Host: $user_host, Display: $display, Checked out at: $checkout_time"

  # Print the extracted fields as a table row
  printf "\e[0m%-${user_width}s | %-${host_width}s | %-${display_width}s | %s\n" \
  "$user" "$user_host" "$display" "$checkout_time"
fi
done | column -t -s '|'

else
  printf "\e[1;31mLicense Server is DOWN\e[0m\n"
fi

printf "\n\n"


