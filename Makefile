CFLAGS = -Wall -g
CC	   = gcc $(CFLAGS)
include test_Makefile

all : server_func.o bl_server.o bl_client.o util.o simpio.o
	$(CC) -o server_func.o bl_server.o bl_client.o util.o simpio.o

util.o : util.c
	$(CC) -c util.c

server_func.o : server_funcs.c
	$(CC) -c server_funcs.c

bl_server.o : bl_server.c
	$(CC) -c bl_server.c

bl_client.o : bl_client.c
	$(CC) -c bl_client.c

simpio.o : simpio.c
	$(CC) -c simpio.c


#------------ Taken from project 1 to make zip
# clean :
# 	rm *.o commando
# ############################################################
# # 'make zip' to create p1-code.zip for submission
# AN=p1
# SHELL  = /bin/bash
# CWD    = $(shell pwd | sed 's/.*\///g')
# zip : clean clean-tests
# 	rm -f $(AN)-code.zip
# 	cd .. && zip "$(CWD)/$(AN)-code.zip" -r "$(CWD)"
# 	@echo Zip created in $(AN)-code.zip
# 	@if (( $$(stat -c '%s' $(AN)-code.zip) > 10*(2**20) )); then echo "WARNING: $(AN)-code.zip seems REALLY big, check there are no abnormally large test files"; du -h $(AN)-code.zip; fi
# 	@if (( $$(unzip -t $(AN)-code.zip | wc -l) > 256 )); then echo "WARNING: $(AN)-code.zip has 256 or more files in it which may cause submission problems"; fi
