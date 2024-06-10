Here’s an improved version of the README file for your GitHub repository, with enhanced formatting and clarity:

---

# To-Do List Tools

This repository contains two scripts for managing to-do lists: `todolist1` and `todolist`.

## Installation

To install these tools, follow these steps:

### 1. Clone the Repository

```bash
git clone https://github.com/SafouaneCh/to_do_list.git
cd to_do_list
```

### 2. Make the Scripts Executable

```bash
chmod +x todolist1 todolist
```

### 3. Add Scripts to PATH

To run the scripts from anywhere on your system, create symbolic links in a directory included in your system's `PATH`, such as `/usr/local/bin`.

Run these commands:

```bash
sudo ln -s $(pwd)/todolist1 /usr/local/bin/todolist1
sudo ln -s $(pwd)/todolist /usr/local/bin/todolist
```

This will create symbolic links for the `todolist1` and `todolist` scripts, allowing you to run them from any terminal window.

## Usage

### `todolist1`

This script provides various functionalities for managing tasks.

#### Available Commands

- `-v, --view`  
  View the list of all tasks.

- `-a, --add`  
  Add a new task.

- `-r, --remove TASK`  
  Remove a specific task.

- `-s, --show TASK`  
  Show details of a specific task.

- `-e, --edit TASK`  
  Edit a specific task.

- `-f, --filter-status`  
  Filter tasks by their status (e.g., ongoing, completed).

- `-p, --filter-priority`  
  Filter tasks by their priority (e.g., high, medium, low).

- `-x, --export`  
  Export all tasks to an archive file.

- `-i, --import`  
  Import tasks from an archive file.

- `-h, --history`  
  Show the modification history of the tasks.

- `-A, --alarm TASK`  
  Activate an alarm for a task.

- `-H, --help`  
  Display the help message.

### Example Usage

```bash
todolist1 -a
```

```bash
todolist1 -v
```

```bash
todolist1 -e Task1
```

---

This version provides a clean, structured format that enhances readability and usability. Each section is clearly defined, and code blocks are used for commands, making it easier for users to follow the instructions.
