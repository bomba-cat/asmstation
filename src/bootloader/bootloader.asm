        org 0x7C00
        bits 16

        jmp short start                 ; Jump to the main instruction
        nop

;--------------------------------------------------------------------------
bdb_oem:
        db 'MSWIN4.1'	                ; 8 bytes

bdb_bytes_per_sector:
        dw 512

bdb_sectors_per_cluster:
        db 1

bdb_reserved_sectors:
        dw 1

bdb_fat_count:
        db 2

bdb_dir_entry_count:
        dw 0E0h

bdb_total_sectors:
        dw 2880	                        ; 2880 * 512 = 1.44Mb

bdb_media_descriptor_type:
        db 0F0h		                    ; F0 = 3.5" Floppy disk

bdb_sectors_per_fat:            
        dw 9		                    ; 9 Sectors Fat

bdb_sectors_per_track:          
        dw 18

bdb_head:                       
        dw 2

bdb_hidden_sectors:             
        dd 0

bdb_large_sector_count:         
        dd 0
;---------------------------------------
;----------------Extended-Boot-Record---
ebr_drive_number:               
        db 0                            ; Floppy
        db 0	    	                ; Reserved

ebr_signature:                  
        db 29h

ebr_volume_id:                  
        db 12h, 34h, 56h 78h            ; Volume ID can be anything

ebr_volume_label:              
        db 'asmstation '                ; 11 bytes, padded with spaces

ebr_system_id:                  
        db 'FAT12   '	                ; 8 bytes, padded with spaces
;----------------------------------------------------------------------------------------

start:
        jmp setup
setup:
        ;Setup data segment
        mov ax, 0
        mov ds, ax
        mov es, ax

        ;Setup stack
        mov ss, ax
        mov sp, 0x7C00

        ;Call main
        call main
        hlt

main:
        ;Load the second sector
        mov ax, 0x8000
        mov es, ax
        mov bx, 0
        mov ax, 0
        mov cx, 1
        mov dx, 0
        int 0x13
        ret

times 510-($-$$) db 0
dw 0x55AA
