i=1

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
	@grep -F "[ ]" todolist-27.02.21.md
	# @grep -F "[ ]" todolist-`date +'%d.%m.%y'`.md

complete_all:
	@python -c "import sys;lines=sys.stdin.read();print lines.replace('[ ]','[x]')" < todolist-`date +'%d.%m.%y'`.md > todolist-new-`date +'%d.%m.%y'`.md
	@rm -f todolist-`date +'%d.%m.%y'`.md
	@mv todolist-new-`date +'%d.%m.%y'`.md todolist-`date +'%d.%m.%y'`.md

save:
	@echo "Saving your todolist"
	@git add .
	@git commit -m "Finish my day"
	@git push
	@echo "Todolist saved"

add:
	@echo "- [ ] $(todo)" >> todolist-`date +'%d.%m.%y'`.md
	@echo "Item added to your todolist"

add_timed:
	# Soon to be met

complete:
	#imprimir tudo direito
	@python -c "import sys;lines=sys.stdin.readlines();lines[`expr $(todo) - $(i)`]=lines[`expr $(todo) - $(i)`].replace('[ ]','[x]');print lines" < todolist-28.02.21.md > todolist-new-28.02.21.md
	@rm -f todolist-`date +'%d.%m.%y'`.md
	@mv todolist-new-`date +'%d.%m.%y'`.md todolist-`date +'%d.%m.%y'`.md

install:
	@alias create_todolist="make create_todolist"
	@alias delete_todolist="make remove_todolist"
	@alias show_todolist="make show_todolist"
	@alias add_todolist="make add"
	@alias work="open_work_tools"
	@alias app="open"

open_work_tools:
	@open /Applications/MAMP/MAMP.app
	# ligar o server
	@open /Applications/Microsoft\ Teams.app
	@open /Applications/Spectacle.app
	# @open /Applications/Visual\ Studio\ Code.app
	@open -a /Applications/Google\ Chrome.app 'https://uphups.uphill.test'


open:
	@open /Applications/$(app).app

cry:
	@open -a /Applications/Google\ Chromxe.app 'https://giphy.com/search/cry'

memes:
	@open -a /Applications/Google\ Chrome.app 'https://giphy.com/search/$(shell echo "${meme}" | sed -e 's/ /-/g')'

learn:
	@open -a /Applications/Google\ Chrome.app 'https://cesium.di.uminho.pt/activities?show=next'

info:
	@echo "Para adicionar artigos à sua todo list, escreve add todo=todo_to_add"
	@echo "Quando terminares de tralar podes consultar o estado da tua todo list. Basta escreveres end"
	@echo "Para conheceres todos os comandos, escreve commands"

start_work: open_work_tools create_todolist info

end_work: save
	osascript -e 'quit app "Microsoft Teams"'
	# osascript -e 'quit app "Visual Studio Code"'
	osascript -e 'quit app "Spectacle"'
	osascript -e 'quit app "MAMP"'
	osascript -e 'quit app "Google Chrome"'
	@open -a /Applications/Google\ Chrome.app 'https://www.instagram.com'
	@open -a /Applications/Google\ Chrome.app 'https://www.twitter.com'
	@open -a /Applications/Google\ Chrome.app 'https://www.facebook.com'

commands:

begin test:
	@echo "