# Copyright 2018 Andrii Burkatskyi aka underr

dir=$(shell pwd)
zip=$(shell basename $(dir)).ocmod.zip

license=LICENSE.txt
readme=README.md
src=src
bin=bin


all: clean makedir makezip addtext

makedir:
	mkdir -p "$(bin)"

makezip:
	cd "$(src)" && zip -9 -r "../$(bin)/$(zip)" * && cd ..

addtext:
	zip -9 -j "$(bin)/$(zip)" "$(readme)" "$(license)"

clean:
	@echo Cleaning...
	@rm -f "$(bin)"/*.*
	@rm -f "$(src)"/*.zip
	@rm -f "$(src)/$(license)"
	@rm -f "$(src)/$(readme)"
