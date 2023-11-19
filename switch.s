.global myswitch

myswitch:
    pushfl
    pushal
    pushw %ds
    pushw %es
    pushw %fs
    pushw %gs
    #Save current context (1st argument when called from c)
    movl %esp,(%esi)
    #Load given context (2nd argument when called from c)
    movl (%edi),%esp
    popw %gs
    popw %fs
    popw %es 
    popw %ds 
    popal
    popfl