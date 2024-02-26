N_EX_NEXT_FORMATED=$(shell ./file.sh 1)
FILES_ARRAY=$(shell ./file.sh 2)
N=next_project
N_PATH=src/$(N_EX_NEXT_FORMATED)-ex-$(N)
T=Document

next-e:
	@mkdir $(N_PATH)
	@cp ./templates/script.js $(N_PATH)/
	@cp ./templates/style.css $(N_PATH)/
	@sed 's/TITLE/$(T)/g' templates/index.html > $(N_PATH)/index.html
	@echo "Empty note" > $(N_PATH)/notes.txt

update:
	sed 's/FILELIST/$(FILES_ARRAY)/g' templates/main.js > script.js
