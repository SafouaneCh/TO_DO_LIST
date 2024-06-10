# To-Do List Tools

This repository contains two scripts for managing to-do lists: `todolist` and `Todolist`.

## Installation

To install these tools, follow these steps:

1. **Clone the Repository**:
  
   git clone https://github.com/SafouaneCh/to_do_list.git
   cd to_do_list
Make the Scripts Executable:

_chmod +x todolist Todolist


Add Scripts to PATH:

_To run the scripts from anywhere on your system, you need to create symbolic links in a directory that's included in your system's PATH, such as /usr/local/bin.


Run these commands:


sudo ln -s $(pwd)/todolist1 /usr/local/bin/todolist1
sudo ln -s $(pwd)/todolist /usr/local/bin/todolist

This will create symbolic links for the todolist and Todolist scripts, allowing you to run them from any terminal window.

Usage

todolist
This script provides various functionalities for managing tasks.

Available Commands
-v, --view: View the list of all tasks
-a, --add: Add a new task
-r, --remove TASK: Remove a specific task
-s, --show TASK: Show details of a specific task
-e, --edit TASK: Edit a specific task
-f, --filter-status: Filter tasks by their status (e.g., ongoing, completed)
-p, --filter-priority: Filter tasks by their priority (e.g., high, medium, low)
-x, --export: Export all tasks to an archive file
-i, --import: Import tasks from an archive file
-h, --history: Show the modification history of the tasks
-A, --alarm TASK: Activate an alarm for a task
-H, --help: Display the help message


Example Usage

todolist1 -a
todolist1 -v
todolist1 -e Task1




This condensed version provides all the necessary steps for installation, usage, and contribution in one block of text.
