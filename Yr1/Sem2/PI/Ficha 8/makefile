f8 : main.o Stack.o Listas.o Queue.o
	gcc -o f8 main.o Stack.o Listas.o Queue.o

main.o : main.c Stack.h
	gcc -c main.c

Stack.o : Stack.c Stack.h Listas.h
	gcc -c Stack.c

Queue.o : Queue.c Queue.h Listas.h
	gcc -c Queue.c

Listas.o : Listas.c Listas.h
	gcc -c Listas.c

