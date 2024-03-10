import os as linux

commands = [
    "nasm -f bin ./src/bootloader/bootloader.asm -o ./build/binary/bootloader.bin",
    "dd if=/dev/zero of=./build/asmstation.img bs=1024 count=1440",
    "dd if=./build/binary/bootloader.bin of=./build/asmstation.img seek=0 conv=notrunc",
]

for command in commands:
    stat = linux.popen(command).read()
    if stat != "":
        print(stat)
