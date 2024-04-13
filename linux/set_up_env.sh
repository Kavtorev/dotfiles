#!/bin/bash

# Function to print a highlighted message
highlight() {
  echo -e "\e[1;32m$1\e[0m"
}

# Function to print an error message and exit
error_exit() {
  echo -e "\e[1;31mError: $1\e[0m"
  exit 1
}

# Function to execute a script
execute_script() {
  script_name=$1

  # Make the script executable
  chmod +x $script_name

  echo "Executing $script_name..."
  ./$script_name   # Corrected this line

  if [ $? -eq 0 ]; then
    highlight "✔ $script_name completed successfully."
  else
    error_exit "✘ $script_name failed. Exiting."
  fi
}


# Start the setup process
echo "Starting the configuration process..."

execute_script "fonts/install_fira_code.sh"
execute_script "fonts/install_jet_brains_mono.sh"

execute_script "git/set_up_git.sh"

execute_script "system/load_gnome_settings.sh"

execute_script "zsh/set_up_zsh.sh"

highlight "Configuration complete!"
