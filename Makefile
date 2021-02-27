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
	@echo - $(todo) >> todolist-`date +'%d.%m.%y'`.md
	@echo "Item added to your todolist"

cenas:
	# @echo $(item) >> todolist-`date +'%d.%m.%y'`.md
