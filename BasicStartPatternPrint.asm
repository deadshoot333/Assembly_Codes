include emu8086.inc
.model small
.stack 100h
.data
.code

main proc
    mov bh,1
    outer:
         cmp bh,5
         je outer_exit
         
         mov bl,1
         inner:
            cmp bl,5
            je inner_exit
            
            mov ah,2
            mov dl,"*"
            int 21h
            print " " 
            
            inc bl
            loop inner
            
            inner_exit:
            printn
        inc bh
        loop outer
        outer_exit:
            print
        main endp
end
            