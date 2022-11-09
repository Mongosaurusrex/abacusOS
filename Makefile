build:
	nasm -f bin -o boot.bin boot.asm
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc
run:
	qemu-system-x86_64 -drive format=raw,file=boot.img
