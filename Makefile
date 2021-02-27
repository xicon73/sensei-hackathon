create_todolist:
	@touch todolist-`date +'%d.%m.%y'`.md
	@echo "Created Todolist"

login:
	@curl

remove_todolist:
	@rm todolist-`date +'%d.%m.%y'`.md
	@echo "Todolist removed"

show_todolist:
	@echo "Items:"
	@cat todolist-`date +'%d.%m.%y'`.md

show_completed:
	@grep -F "[x]" todolist-`date +'%d.%m.%y'`.md

show_todo:
	@grep -F "[ ]" todolist-`date +'%d.%m.%y'`.md

complete_all:
	@python -c "import sys;lines=sys.stdin.read();print lines.replace('[ ]','[x]')" < todolist-27.02.21.md > todolist-new-27.02.21.md
	@rm -f todolist-27.02.21.md
	@mv todolist-new-27.02.21.md todolist-27.02.21.md

save:
	@echo "rota para enviar a todo list para a bd"

sync:
	@echo "Rota para recever a todo list que está guardada"

add:
	@echo - $(todo) >> todolist-`date +'%d.%m.%y'`.md
	@git add todolist-`date +'%d.%m.%y'`.md
	@git commit -m "$(todo)"
	@echo "Item added to your todolist"

remove:

complete:
# - [ ]
# - [x]

install:
	@alias create_todolist="make create_todolist"
	@alias delete_todolist="make remove_todolist"
	@alias show_todolist="make show_todolist"
	@alias add_todolist="make add"
	@alias work="open_work_tools"
	@alias app="open"

open_work_tools:
	@open /Applications/MAMP/MAMP.app
	@open /Applications/Microsoft\ Teams.app
	@open /Applications/Spectacle.app
	# @open /Applications/Visual\ Studio\ Code.app

open:
	@open /Applications/$(app).app
