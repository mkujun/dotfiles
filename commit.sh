#!/bin/sh
cd /full/path/to/your/project
git add --all
timestamp() {
  date +"at %H:%M:%S on %d/%m/%Y"
}
git commit -am "Regular auto-commit $(timestamp)"
git push origin master

#this is a shell script which runs automatic git commit.
#best usage for this script is with "Task Scheduler" for Windows 10, which can create a scheduled task.
