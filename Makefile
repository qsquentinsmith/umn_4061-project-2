CFLAGS = -Wall -g
CC	   = gcc $(CFLAGS)
include test_Makefile

blather : server_funcs.o bl_server.o bl_client.o util.o simpio.o
	$(CC) -o bl_server server_funcs.o bl_server.o util.o
	$(CC) -o bl_client bl_client.o simpio.o
	@echo blather is ready

server_funcs.o : server_funcs.c blather.h
	$(CC) -c server_funcs.c

bl_server.o : bl_server.c blather.h
	$(CC) -c bl_server.c

bl_client.o : bl_client.c blather.h
	$(CC) -c bl_client.c

util.o : util.c blather.h
	$(CC) -c util.c

simpio.o : simpio.c blather.h
	$(CC) -c simpio.c

clean:
	rm -f blather *.o

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
