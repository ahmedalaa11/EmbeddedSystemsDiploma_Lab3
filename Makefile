#prepared by AHMED ALAA
CC =arm-none-eabi-
CARGS =-mcpu=arm926ej-s -g
INC=-I .
LARGS= -Map=map_file.map 
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
AS=$(wildcard *.s)
ASOBJ=$(AS:.s=.o)
ProjectName =lab3

all: $(ProjectName).bin

%.o: %.s 
	$(CC)as.exe $(CARGS) $< -o $@

%.o: %.c
	$(CC)gcc.exe -c $(INC) $(CARGS) $< -o $@

$(ProjectName).elf: $(OBJ) $(ASOBJ)
	$(CC)ld.exe -T linker_script.ld $(LARGS) $(OBJ) $(ASOBJ) -o $@ 

$(ProjectName).bin: $(ProjectName).elf
	$(CC)objcopy.exe -O binary $< $@
	@echo "======BUILD DONE======"

clean_all: 
	rm *.o *.elf *.bin *.map
clean:
	rm *.bin *.elf