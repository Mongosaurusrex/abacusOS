ASM=nasm
QEMU=qemu-system-x86_64
SECTOR_SIZE=512
CONV=notrunc

boot.img: boot.bin loader.bin kernel.bin
	dd if=$< of=$@ bs=$(SECTOR_SIZE) count=1 conv=$(CONV)
	dd if=$(word 2,$^) of=$@ bs=$(SECTOR_SIZE) count=2 seek=1 conv=$(CONV)
	dd if=$(word 3,$^) of=$@ bs=$(SECTOR_SIZE) count=10 seek=3 conv=$(CONV)

boot.bin: boot.asm
	$(ASM) -f bin $< -o $@

loader.bin: loader.asm
	$(ASM) -f bin $< -o $@

kernel.bin: kernel.asm
	$(ASM) -f bin $< -o $@

qemu: boot.img
	$(QEMU) -cpu qemu64,pdpe1gb -drive format=raw,file=$<

clean: 
	rm -f *.bin *.img
