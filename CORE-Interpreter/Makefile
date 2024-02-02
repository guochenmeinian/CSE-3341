# comments in a Makefile start with sharp 

# make .o files
all:
	rm -rf *.class project5.zip
	javac Main.java

project5.zip:
	zip project5.zip Makefile README *.java tester.sh

# so that a completely new compile of all items is required
clean:
	rm -rf *.class