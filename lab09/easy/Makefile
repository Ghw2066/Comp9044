# Makefile generated at Wed Aug  5 00:15:52 CST 2020

CC = gcc
CFLAGS = -Wall -g

easymain:	easymain.o graphics.o world.o 
	$(CC) $(CFLAGS) -o $@ easymain.o graphics.o world.o 

easymain.o:	graphics.h world.h easymain.c
graphics.o:	graphics.h world.h graphics.c
world.o:	world.h world.c
