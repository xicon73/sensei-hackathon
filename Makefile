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
	
save:
	@echo "rota para enviar a todo list para a bd"

sync:
	@echo "Rota para recever a todo list que está guardada"

add:
	@echo - [ ] $(todo) >> todolist-`date +'%d.%m.%y'`.md
	@git add todolist-`date +'%d.%m.%y'`.md
	@git commit -m "$(todo)"
	@echo "Item added to your todolist"

remove:

complete:
# - [ ]
# - [x]

cenas:
	# @echo $(item) >> todolist-`date +'%d.%m.%y'`.md
	# Usar git para adicionar
	# 


install:
	@alias create_todolist="make create_todolist"
	@alias delete_todolist="make remove_todolist"
	@alias show_todolist="make show_todolist"
	@alias add_todolist="make add"

open work tools:
