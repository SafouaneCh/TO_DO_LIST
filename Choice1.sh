#!/bin/bash

TODO_DIR="$HOME/.todo"

mkdir -p "$TODO_DIR"

Show_Menu() {
    figlet -f slant -c "TO DO LIST " | lolcat 
    figlet -f digital -c "To_Do_List Menu " | lolcat

    echo "
        1. View To-do list
        2. Add a Task 
        3. Remove Task
        4. Show a specific Task
        5. Edit a specific Task
        6. Filter by status
	7. Filter by priority
        8. Activate the alarm option
	9. Export tasks
	10. Import tasks
	11. Show history of the list
        0. Exit"
    
    figlet -f digital "Your choice : " | lolcat 
    read choice
    Handle_Choice "$choice"
}

Handle_Choice() {

    case $1 in
        1) Show_List ;;
        2) Add_Task ;;
	4) Show_Task ;;
	5) Edit_Task ;;
	6) Filter_By_Status ;;
	7) Filter_By_Priority;;
	9) Export_Tasks;;
	10) Import_Tasks;;
	11) Show_History ;;
        0) exit ;;
        *) echo "Invalid choice";;
    esac
}

Show_List() {
	for task in "$TODO_DIR"/*; do
		echo "Task: $(basename "$task")"
	done
}

Add_Task() {

    n=$(ls "$TODO_DIR" | wc -l)
    let n=$n-1
    mkdir "Task$n" || exit
    cd "Task$n"
    
    touch Task$n.txt    

    echo "_ What's your task title: "
    read title
    echo "- Title: $title" >> Task$n.txt

    echo "_ What's the deadline of your task: "
    read deadline
    echo "- Deadline: $deadline" >> Task$n.txt

    date=$(date)
    echo "- Added in: $date" >> Task$n.txt

    echo "- Status: ongoing" >> Task$n.txt

    echo "_ Who works on this task: "
    read assignees
    echo "- Assignees: $assignees" >> Task$n.txt

    echo "_ What do you need to complete this task: "
    read attachments
    echo "- Attachments: $attachments" >> Task$n.txt
    

    echo "_What is the priority of this task (high, medium, low):"
    read priority
    echo "- Priority: $priority" >> Task$n.txt

    echo -e
    echo "_ Do you wish to add any sub-tasks (y/n): "
    read answer

    case $answer in
        n|N) 
            echo "No sub-tasks added"
            ;;
        y|Y) 
            Add_subTask "Task$n"
            echo "SubTask added successfully"
            ;;
        *) 
            echo "Incorrect Input"
            ;;
    esac
    cd ..

}


Remove_Task(){

	echo "_Which task do you want to remove ?"
	read task
	if [ -d "$task" ]; then
		rm -r "$task"
	else 
		echo "_No such task in the list "

	fi
}


Add_subTask() {

    local list="$1"

    k=$(ls  | wc -l)

    touch "Sub_Task$k.txt"

    read -p "What's your task title: " title
    echo "- Title: $title" >> "Sub_Task$k.txt"

    read -p "What's the deadline of your task: " deadline
    echo "- Deadline: $deadline" >> "Sub_Task$k.txt"

    date=$(date)
    echo "- Added in: $date" >> "Sub_Task$k.txt"

    read -p "Who works on this task: " assignees
    echo "- Assignees: $assignees" >> "Sub_Task$k.txt"

    read -p "What do you need to complete this task: " attachments
    echo "- Attachments: $attachments" >> "Sub_Task$k.txt"

    read -p "Do you wish to add other sub-tasks (y/n): " answer

    case $answer in
        n|N) echo "No other sub-tasks added" ;;
        y|Y)   Add_subTask "$list" ;;
        *) echo "Incorrect Input" ;;
    esac
    cd..
}


Remove_Subtask(){

    echo "_Which task contains the subtask : "
    read task

    echo "_ Which subtask do you want to remove : "
    read subtask

    if [ -f "$task/$subtask" ]; then
        rm "$task/$subtask"
        echo "Subtask '$subtask' removed from task '$task' "
    else
        echo "No such subtask in task '$task' "
    fi

}


Show_Task(){
  
        echo -e	
        echo "Which task do wish to view : "
	read Task
	for j in $( ls "$Task" )  ; do
        if [[ "$j" == Task* ]]; then
            echo "The main task is : "
            echo -e
            cat "$Task/$j"
            echo -e
        elif [[ "$j" == Sub* ]]; then
            echo "The sub tasks are : "
            echo -e
            cat "$Task/$j"
            echo -e
        fi
    done
}


Filter_By_status(){
	echo "_Enter the status to filter by (ongoing, completed): "
	read status

	echo "Tasks with status '$satus': "
	find . -type f -name "*.txt" -exec grep -l "- Status: $status" {} \; -exec grep "- Type: " {}\;
}


Filter_By_Priority(){
	echo "_Enter the priority to filter by (high, medium, low) :"
	read priority 

	echo "Tasks with priority '$priority': "
	find . -type f -name "*.txt" -exec grep -l "- Priority: $priority"{} \;
	#-l affiche juste le nom des fichiers(tasks) non pas les details du task 
}

Export_Tasks(){
	echo "Entrez le nom de l'archive (ou appuyer sur Entrée pour utiliser le nom par défaut):"
	read user_archive_name

	if [ -z "$user_archive_name" ]; then
		archive_name="tasks_backup_$(date +%Y%m%d_%H%M%S).tar.gz"
	else
		archive_name="${user_archive_name}.tar.gz"
	fi
	tar -cvf "$archive_name" Task*
	echo "toutes les tâches ont été exportées vers $archive_name"
}

Import_Tasks(){
	echo "Entrez le nom de l'archive à partir de laquelle importer les tâches:"
	read archive_name

	if [ -f "$archive_name" ]; then
		tar -xvf "$archive_name"
		echo "Les tâches ont été importées à partir de $archive_name"
	else
		echo "Fichier d'archive $archive_name non trouvé"
	fi

}

Edit_Task() {
    echo "Which task do you want to edit?"
    read task
    if [ -d "$task" ]; then
        cd "$task"
        if [ -f "${task}.txt" ]; then
            echo "Editing Task: $task"
            nano "${task}.txt"
            echo "Task edited successfully !!"
            echo "Task edited: $task at $(date)" >> "../modification_history.txt"
        else
            echo "No such task"
        fi
        cd ..
    else
        echo "No such task"
    fi
}


Edit_Subtask() {
    echo "Which task contains the subtask you want to edit?"
    read task
    if [ -d "$task" ]; then
        echo "Which subtask do you want to edit?"
        read subtask
        if [ -f "$task/$subtask" ]; then
            cd "$task"
            nano "$subtask"
            echo "Subtask edited successfully !!"
            echo "Subtask edited: $subtask in task: $task at $(date)" >> "../modification_history.txt"
            cd ..
        else
            echo "No such subtask"
        fi
    else
        echo "No such task"
    fi
}

Show_History() {
    if [ -f "modification_history.txt" ]; then
        cat "modification_history.txt"
    else
        echo "No modification history available"
    fi
}
# Keep showing the menu until the user exits
while true; do
    
    if [[ $choice == 0 ]]; then 
	    exit 
    fi
    Show_Menu
done
