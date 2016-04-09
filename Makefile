MYSQL_INC=-I/usr/include/mysql/
# MYSQL_LIB=

TARGET=lib_mysqludf_json.so.0.1

all: $(TARGET)

$(TARGET): lib_mysqludf_json.o
	gcc -shared -fPIC -g -O2  -o $@ $^
.c.o:
	gcc -shared -fPIC -g -O2 $(MYSQL_INC) -c $^ -o $@
clean:
	rm -rf *.o $(TARGET)
install: $(TARGET)
	install $< /usr/lib64/mysql/plugin/
deploy: install
	/etc/init.d/mysqld restart
