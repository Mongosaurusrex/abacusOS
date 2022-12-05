nasm -f bin -o boot.bin boot.asm
nasm -f bin -o loader.bin loader.asm
nasm -f elf64 -o kernel.o kernel.asm
/opt/homebrew/Cellar/x86_64-elf-gcc/12.2.0/bin/x86_64-elf-gcc -std=c99 -mcmodel=large -ffreestanding -fno-stack-protector -mno-red-zone -c main.c 
/opt/homebrew/Cellar/x86_64-elf-binutils/2.39/bin/x86_64-elf-ld -nostdlib -T link.lds -o kernel kernel.o main.o
/opt/homebrew/Cellar/x86_64-elf-binutils/2.39/bin/x86_64-elf-objcopy -O binary kernel kernel.bin 
dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
dd if=loader.bin of=boot.img bs=512 count=5 seek=1 conv=notrunc
dd if=kernel.bin of=boot.img bs=512 count=100 seek=6 conv=notrunc
