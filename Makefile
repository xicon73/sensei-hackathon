i=1
day=`date +'%d.%m.%y'`

create_todolist:
	@touch todolist-`date +'%d.%m.%y'`.md
	@echo "Created Todolist"

remove_todolist:
	@rm todolist-`date +'%d.%m.%y'`.md
	@echo "Todolist removed"

show_todolist:
	@echo "Items":
	@if grep -F "[" todolist-`date +'%d.%m.%y'`.md; then echo; else echo "Não tens items na tua todolist"; fi

show_completed:
	@echo "Items Completos":
	@if grep -F "[x]" todolist-`date +'%d.%m.%y'`.md; then echo; else echo "Não tens items concluídos"; fi

show_todo:
	@echo "Items por Concluir":
	@if grep -F "[ ]" todolist-`date +'%d.%m.%y'`.md; then echo; else echo "Não tens items por concluir"; fi

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
	@open -a /Applications/Google\ Chrome.app "https://github.com/xicon73/sensei-hackathon/blob/master/todolist-$(day).md"

add:
	@echo "- [ ] $(todo)" >> todolist-`date +'%d.%m.%y'`.md
	@echo "Item added to your todolist"

complete:
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
	@alias startm='cd /Applications/MAMP/bin && ./start.sh'

open_work_tools:
	@open /Applications/MAMP/MAMP.app
	@cd /Users/francisco/sensei-hackathon 
	@open /Applications/Microsoft\ Teams.app
	@open /Applications/Spectacle.app
	@open /Applications/Visual\ Studio\ Code.app
	@open -a /Applications/Google\ Chrome.app 'https://uphups.uphill.test'


open:
	@open /Applications/$(app).app

cry:
	@open -a /Applications/Google\ Chrome.app 'https://giphy.com/search/cry'

memes:
	@open -a /Applications/Google\ Chrome.app 'https://giphy.com/search/$(shell echo "${meme}" | sed -e 's/ /-/g')'

learn:
	@open -a /Applications/Google\ Chrome.app 'https://cesium.di.uminho.pt/activities?show=next'

info:
	@echo "Para adicionar artigos à sua todo list, escreve add todo=todo_to_add"
	@echo "Quando terminares de trabalhar podes consultar o estado da tua todo list. Basta escreveres end"
	@echo "Para conheceres todos os comandos, escreve commands"

start_work: open_work_tools create_todolist info
	@echo "Comecei o meu dia de trabalho - `date +'%H:%M'`" >> todolist-`date +'%d.%m.%y'`.md

end_work: final save
	osascript -e 'quit app "Microsoft Teams"'
	osascript -e 'quit app "Visual Studio Code"'
	osascript -e 'quit app "Spectacle"'
	osascript -e 'quit app "MAMP"'
	osascript -e 'quit app "Google Chrome"'
	@open -a /Applications/Google\ Chrome.app 'https://www.seium.org'

commands:
	@echo "Para veres memes, escreve memes meme=meme_a_pesquisar"
	@echo "Para veres formações do cesium, escreve learn"
	@echo "Para começares um dia de trabalho, escreve start_work"
	@echo "Para terminares um dia de trabalho, escreve end_work"
	@echo "Para abrir uma aplicação, escreve open app=nome_da_app"
	@echo "Para gravares a tua todolist, escreve save"
	@echo "Caso pretendas apagar a tua todolist diária, escreve delete"
	@echo "Caso tenhas terminado a tua todolist diária, podes criar uma nova, escrevendo new_todolist"
	@echo "Caso pretendas ver as tarefas em falta, escreve todo"
	@echo "Caso pretendas ver as tarefas executadas, escreve completed"
	@echo "Caso pretendas ver todas as tarefas, escreve show"

final:
	@echo "Terminei o meu dia de trabalho - `date +'%H:%M'`" >> todolist-`date +'%d.%m.%y'`.md
