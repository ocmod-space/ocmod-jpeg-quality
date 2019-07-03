# Copyright 2018 Andrii Burkatskyi aka underr

zip=$(shell basename `pwd`).ocmod.zip

license=LICENSE.txt
readme=README.md
src=src
bin=bin


all: clean makedir makezip addtext

makedir:
	mkdir -p "$(bin)"

makezip:
	cd "$(src)" && zip -9qrX "../$(bin)/$(zip)" * && cd ..

addtext:
	zip -9qrX "$(bin)/$(zip)" "$(readme)" "$(license)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
