# What is asmstation?
Asmstation is a bootloader which is capable of starting 16bit games made by the community.
It allows you to burn the image file on a usb, boot it with your pc and start playing some installed games.
It's main purpose is to turn a regular pc into a arcade maschine.

# Developing game for asmstation.
When developing games for asmstation, you can make use of the bios interrupts. Because the bootloader
stays in real mode, it allows the developers to make use of the bios interrupts. We plan on adding a
32bit protected mode with a kernel for interrupts in the future.

# Limitations
- Currently only supports games made by the community.
- Currently only supports games made in the 16bit mode.
- 512 Bytes size limitations
- CHS limitations

# Building
When you finish making your game you can put it in the `programs` folder and start building the image.
It will be automatically added in a sector of the image. The selector program should then be able to detect you game.

## Linux
- `python3 build.py`

## Windows
- `python winbuild.py`
