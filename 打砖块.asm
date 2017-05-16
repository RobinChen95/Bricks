DATAS SEGMENT 
    x dw -2;X运动向量 
    y dw 1;Y运动向量 
    score_info db 'Score:000$' 
    life_info db 'Life:3$' 
    stop_info db 'Press space to continue!$'
    con_info  db '                        $'
    lose_info db 'Game Over!Try again?(Y/N)$'
    con1_info db '                            $'
    congratulation_info db 'You win!$' 
    playagain_info db 'Play next level?(Y/N)$' 
    startsx dw 0 
    startsy dw 0 
    endsx dw 10
    endsy dw 3 
    color db 10 
    bat_color db 1110b;球拍颜色
    frame_color db 0011b;边框颜色 
    ball_color db 1011b;球的颜色
    bricks_color1 db 1111b;砖块颜色
    bricks_color2 db 1010b
    bricks_color3 db 0101b
    exitsym dw 1;记录玩家退出游戏的标志
    stopsym dw 0;记录玩家暂停游戏的标志
    replaysym dw 0;记录玩家选择重新开始游戏的标志
    itemsym db -1;记录当前屏幕中是否有道具
    speedsym dw 1;记录是否要加速的标志
    cmpgamesym db 0;记录砖块打完的标志
    balloutsym db 0;记录生命值
    barsym db 1;记录关数
	count db 0
    life_num db 3;记录生命值 
    score_num db 0;记录分数
    mouse_last dw 80;记录鼠标位置
    bat_width dw 50;记录球拍的宽度 
    ballx dw 160;记录球的左上角的x轴坐标 
    bally dw 183;记录球的左上角的y轴坐标 
    bricks_num dw 100;记录砖块的数量 
    itemx dw 0;记录道具的左上角的x轴信息 
    itemy dw 0;记录道具的左上角的y轴信息 
    item_color db 1011b ;加生命道具
               db 1110b ;加分道具
               db 0011b ;加速道具
               db 0100b ;减速道具
               db 1010b ;大球拍道具
               db 1001b ;小球拍道具
    ;---------------------------------------------------------  
    bricks_life db 100 dup(?) 
	bricks_life_reset1 db 1,1,1,1,1,1,1,1,1,1 ;第一关
	                      db 1,1,1,1,1,1,1,1,1,1 
	                      db 1,1,2,2,2,2,2,2,1,1 
	                      db 1,1,2,2,2,2,2,2,1,1 
	                      db 1,1,2,2,2,2,2,2,1,1 
	                      db 1,1,2,2,2,2,2,2,1,1  
	                      db 1,1,2,2,2,2,2,2,1,1  
	                      db 1,1,2,2,2,2,2,2,1,1  
	                      db 1,1,1,1,1,1,1,1,1,1 
	                      db 1,1,1,1,1,1,1,1,1,1
    bricks_life_reset2 	db 2,2,2,2,2,2,2,2,2,2  ;第二关
			               db 2,2,2,2,2,2,2,2,2,2 
			               db 2,2,2,2,2,2,2,2,2,2
			               db 1,1,1,1,1,1,1,1,1,1 
			               db 1,1,1,1,1,1,1,1,1,1 
			               db 1,1,1,1,1,1,1,1,1,1
			               db 1,1,1,1,1,1,1,1,1,1
			               db 1,1,1,1,1,1,1,1,1,1
			               db 1,1,1,1,1,1,1,1,1,1
			               db 1,1,1,1,1,1,1,1,1,1                     
    bricks_life_reset3 db 4,4,4,4,4,4,4,4,4,4 ;第三关
	                      db 4,4,4,4,4,4,4,4,4,4 
	                      db 2,2,2,2,2,2,2,2,2,2 
	                      db 2,2,2,2,2,2,2,2,2,2 
			              db 2,2,2,2,2,2,2,2,2,2 
			              db 1,1,1,1,1,1,1,1,1,1 
			              db 1,1,1,1,1,1,1,1,1,1
			              db 1,1,1,1,1,1,1,1,1,1
			              db 1,1,1,1,1,1,1,1,1,1
			              db 1,1,1,1,1,1,1,1,1,1
			              db 1,1,1,1,1,1,1,1,1,1                       
	bricks_life_reset4 db 2,2,2,2,2,2,2,2,2,2 ;第四关
	                      db 2,2,2,2,2,2,2,2,2,2 
	                      db 2,2,2,2,2,2,2,2,2,2
	                      db 1,1,1,1,2,2,1,1,1,1 
	                      db 1,1,1,1,2,2,1,1,1,1 
	                      db 1,1,1,1,2,2,1,1,1,1 
	                      db 1,1,1,1,2,2,1,1,1,1  
	                      db 1,1,1,1,2,2,1,1,1,1 
	                      db 2,2,2,2,2,2,2,2,2,2 
	                      db 2,2,2,2,2,2,2,2,2,2                     
	bricks_life_reset5 db 1,1,1,1,1,1,1,1,1,1 ;第五关
	                      db 1,1,1,1,1,1,1,1,1,1 
	                      db 1,1,4,4,4,4,4,4,1,1 
	                      db 1,1,4,4,4,4,4,4,1,1 
	                      db 1,1,4,4,4,4,4,4,1,1 
	                      db 1,1,4,4,4,4,4,4,1,1 
	                      db 1,1,4,4,4,4,4,4,1,1 
	                      db 1,1,4,4,4,4,4,4,1,1 
	                      db 1,1,1,1,1,1,1,1,1,1 
	                      db 1,1,1,1,1,1,1,1,1,1
    ball db 0,0,0,1,1,1,1,0,0,0;球 
         db 0,1,1,1,1,1,1,1,1,0 
         db 0,1,1,1,1,1,1,1,1,0 
         db 1,1,1,1,1,1,1,1,1,1 
         db 1,1,1,1,1,1,1,1,1,1 
         db 1,1,1,1,1,1,1,1,1,1 
         db 1,1,1,1,1,1,1,1,1,1 
         db 0,1,1,1,1,1,1,1,1,0 
         db 0,1,1,1,1,1,1,1,1,0 
         db 0,0,0,1,1,1,1,0,0,0 
     
	add_life  db 0,0,1,0,0,0,0,1,0,0;增加生命道具 
	          db 0,1,1,0,0,0,1,1,1,0 
	          db 1,1,1,1,0,0,1,1,1,1 
	          db 1,1,1,1,1,1,1,1,1,1 
	          db 1,1,1,1,1,1,1,1,1,1 
	          db 0,1,1,1,1,1,1,1,1,0 
	          db 0,1,1,1,1,1,1,1,1,0 
	          db 0,0,1,1,1,1,1,1,0,0 
	          db 0,0,0,1,1,1,1,0,0,0 
	          db 0,0,0,0,1,1,0,0,0,0 
         
	add_score db 0,0,0,0,1,1,0,0,0,0;增加分数道具 
	          db 0,0,0,1,1,1,1,0,0,0 
	          db 0,0,1,1,1,1,1,1,0,0 
	          db 0,1,1,1,1,1,1,1,1,0 
	          db 1,1,1,1,1,1,1,1,1,1 
	          db 1,1,1,1,1,1,1,1,1,1 
	          db 0,1,1,1,1,1,1,1,1,0 
	          db 0,0,1,1,1,1,1,1,0,0 
	          db 0,0,0,1,1,1,1,0,0,0 
	          db 0,0,0,0,1,1,0,0,0,0 
           
	speed_up  db 0,0,0,0,1,1,0,0,0,0;加速道具 
	          db 0,0,0,1,1,1,1,0,0,0 
	          db 0,0,1,1,1,1,1,1,0,0 
	          db 0,1,1,0,1,1,0,1,1,0 
	          db 1,1,0,0,1,1,0,0,1,1
	          db 1,0,0,0,1,1,0,0,0,1 
	          db 0,0,0,0,1,1,0,0,0,0 
	          db 0,0,0,0,1,1,0,0,0,0 
	          db 0,0,0,0,1,1,0,0,0,0 
	          db 0,0,0,0,1,1,0,0,0,0 
           
	speed_down db 0,0,0,0,1,1,0,0,0,0;减速道具 
	           db 0,0,0,0,1,1,0,0,0,0 
	           db 0,0,0,0,1,1,0,0,0,0 
	           db 0,0,0,0,1,1,0,0,0,0
	           db 0,0,0,0,1,1,0,0,0,0 
	           db 1,1,0,0,1,1,0,0,1,1
	           db 0,1,1,0,1,1,0,1,1,0 
	           db 0,0,1,1,1,1,1,1,0,0 
	           db 0,0,0,1,1,1,1,0,0,0 
	           db 0,0,0,0,1,1,0,0,0,0 
 
	lar_bat db 1,1,1,1,1,1,1,1,1,1;增大球拍道具 
	           db 1,0,0,1,1,1,1,1,1,1 
	           db 1,0,0,1,1,1,1,1,1,1 
	           db 1,0,0,1,1,1,1,1,1,1 
	           db 1,0,0,1,1,1,1,1,1,1 
	           db 1,0,0,1,1,1,1,1,1,1 
	           db 1,0,0,1,1,1,1,1,1,1 
	           db 1,0,0,0,0,0,0,0,0,1
	           db 1,0,0,0,0,0,0,0,0,1 
	           db 1,1,1,1,1,1,1,1,1,1 
            
	sma_bat db 1,1,1,1,1,1,1,1,1,1;减小球拍道具 
	           db 1,1,1,1,1,1,1,1,1,1 
	           db 1,1,0,0,1,1,0,0,1,1 
	           db 1,0,1,1,0,0,1,1,0,1 
	           db 1,0,1,1,0,0,1,1,0,1 
	           db 1,0,1,1,0,0,1,1,0,1 
	           db 1,0,1,1,0,0,1,1,0,1 
	           db 1,0,1,1,0,0,1,1,0,1 
	           db 1,0,1,1,0,0,1,1,0,1 
	           db 1,1,1,1,1,1,1,1,1,1 
	          
DATAS ENDS

STACKS SEGMENT 
    stks dw 100 dup(?) 
STACKS ENDS 

CODES SEGMENT 
    ASSUME CS:CODES,DS:DATAS,SS:STACKS 
START: 
    MOV AX,DATAS 
    MOV DS,AX  
    mov ax,0 ;用于检测鼠标，同时游戏时消除鼠标指针
    int 33h 
    cmp ax,0 
    jz exit 
    mov ah,00 	;设置显示模式
    mov al,13h 
    int 10h 
;------------------------------------------------- 
;调用1ch的中断，产生每秒18.2次的中断 
    mov al,1ch 
    mov ah,35h 
    int 21h 
    push es 
    push bx 
    push ds 
    mov dx,offset interupt 
    mov ax,seg interupt
    mov ds,ax 
    mov al,1ch 
    mov ah,25h
    int 21h 
    pop ds 
;----------------------------------------------------- 
    call init ;初始化游戏
next2: 
    call mouse_bat ;画挡板
    cmp exitsym,0;判断退出位是否有效，若有效则退出 
    jz exit      
    cmp stopsym,1;判断暂停位是否有效，若有效则暂停
    jne notstop 
    call waits
notstop:  
    cmp replaysym,1;判断重玩位是否有效，若有效则重玩
    jne notreplay 
    call replays 
notreplay: 
    cmp balloutsym,1 ;判断生命值是否为零
    jne notballout 
    call ballouts 
notballout:  
    cmp cmpgamesym,1 ;判断砖块数是否为零
    jne notcmpgame 
notcmpgame:     
    jmp next2 
exit: 
    pop dx 
    pop ds 
    mov al,1ch 
    mov ah,25h  
    int 21h 
    MOV AH,4CH 
    INT 21H 
;---------------------------------------------------------------------- 
;初始化游戏
init proc near
    push ax 
    push bx 
    push cx 
    push dx 
    push si 
    push di 
     
	mov count,0 
    mov life_num,3
    mov score_num,0
    mov mouse_last,160
    mov bat_width,50
    mov ballx,160
    mov bally,183
    mov bricks_num,100
    mov x,-2
    mov y,-1
    mov exitsym,1
    mov stopsym,0
    mov replaysym,0
    mov itemsym,-1
    mov speedsym,0
    mov cmpgamesym,0
    mov balloutsym,0
    mov al,frame_color
    mov color,al
    mov startsx,0     ;画上边第一条线
    mov startsy,0 
    mov endsx,320 
    mov endsy,2 
    call setarea
    mov endsx,5     ;画左边线条
    mov endsy,200 
    call setarea 
    mov startsx,0     ;画下边线条
    mov startsy,197 
    mov endsx,320 
    mov endsy,200 
    call setarea 
    mov startsx,315     ;画右边线条
    mov startsy,0 
    call setarea 
    mov startsx,0    ;画上边第二条线
    mov startsy,17
    mov endsx,320
    mov endsy,20
    call setarea
    
    mov ah,02 ;设置光标
    mov bh,00
    mov dh,1 
    mov dl,2 
    int 10h     
	mov ah,09 
    lea dx,life_info 
    int 21h
    
    mov ah,02 ;设置光标
    mov bh,00 
    mov dh,1 
    mov dl,30 
    int 10h 
    mov ah,09 
    lea dx,score_info 
    int 21h 
    mov dl,bat_color 
    mov color,dl 
    mov startsx,135
    mov endsx,185
    mov startsy,193 
    mov endsy,196 
    call setarea 
     
    ;将砖块画入
    mov cx,bricks_num
    mov si,-1
    ;用于选关
    .if barsym==1 
init_bricks_reset1:  
    add si,1 
    mov al,bricks_life_reset1[si]
    mov bricks_life[si],al 
    loop init_bricks_reset1 
    jmp reset_end 
    .endif 
    
    .if barsym==2 
init_bricks_reset2:    
    add si,1 
    mov al,bricks_life_reset2[si]
    mov bricks_life[si],al 
    loop init_bricks_reset2 
    jmp reset_end 
    .endif 
    
    .if barsym==3 
init_bricks_reset3:   
    add si,1 
    mov al,bricks_life_reset3[si]
    mov bricks_life[si],al 
    loop init_bricks_reset3 
    jmp reset_end 
    .endif 
    
    .if barsym==4 
init_bricks_reset4: 
    add si,1 
    mov al,bricks_life_reset4[si]
    mov bricks_life[si],al 
    loop init_bricks_reset4 
    jmp reset_end 
    .endif 
    
    .if barsym==5 
init_bricks_reset5:  
    add si,1 
    mov al,bricks_life_reset5[si]
    mov bricks_life[si],al 
    loop init_bricks_reset5 
    jmp reset_end 
    .endif 
         
reset_end:      
    mov si,-1
    mov di,0 
    mov startsx,6
    mov endsx,35
    mov startsy,21
    mov endsy,27
     
init_bricks:   
    add si,1 
    add di,1 
    cmp si,bricks_num;
    je init_bricks_exit 
    
    mov al,bricks_color1;
    cmp bricks_life[si],1 
    je init_bricks_color 
         
    mov al,bricks_color2;
    cmp bricks_life[si],2 
    je init_bricks_color 
         
    mov al,bricks_color3
init_bricks_color: 
    mov color,al
    call setarea
 
    cmp di,10;判断是否画完一行
    jne bricks_x 
    
        mov di,0
        add endsy,8
        add startsy,8
        mov startsx,-25
        mov endsx,4
    bricks_x:  
        add startsx,31
        add endsx,31
    jmp init_bricks 
init_bricks_exit: 
    pop di 
    pop si 
    pop dx 
    pop cx 
    pop bx 
    pop ax 
ret 
init endp 
;------------------------------------------------------------------ 
;中断处理，用于处理小球的运动等功能
interupt proc near 
    push ds 
    push ax 
    push cx 
    push dx 
    mov ax,DATAS 
    mov ds,ax 
    cmp stopsym,1
    je interupt_exit_1 
    cmp replaysym,1
    je interupt_exit_1 
    cmp balloutsym,1 
    je interupt_exit_1  
    cmp cmpgamesym,1
    je interupt_exit_1      
    
    mov ah,6 ;直接控制台输入
    mov dl,0ffh 
    int 21h 
    cmp al,1bh;判断是否按下Esc
    jne interupt_notesc
    mov exitsym,0;将退出标志置为有效
    jmp interupt_exit 
         
interupt_notesc: 
    cmp al,72h;判断是否为r，是则重玩，不是则跳转
    jne interupt_notr
    mov replaysym,1
    jmp interupt_exit 
     
interupt_notr:;判断是否为R，是则重玩，不是则跳转 
    cmp al,52h 
    jne interupt_notR1
    mov replaysym,1
    jmp interupt_exit 
     
interupt_notR1: 
    cmp al,20h;判断是否为空格，如果是，则暂停
    jne interupt_notspace 
    mov stopsym,1 
    jmp interupt_exit_1 
    
interupt_notspace:
	cmp al,31h;判断是否为1，如果是，则跳转到第1关
	jne interupt_not1
	mov barsym,1
	mov replaysym,1
	jmp interupt_exit_1
	
interupt_not1:
	cmp al,32h;判断是否为2，如果是，则跳转到第2关
	jne interupt_not2
	mov barsym,2
	mov replaysym,1
	jmp interupt_exit_1
	
interupt_not2:
	cmp al,33h;判断是否为3，如果是，则跳转到第3关
	jne interupt_not3
	mov barsym,3
	mov replaysym,1
	jmp interupt_exit_1
	
interupt_not3:
	cmp al,34h;判断是否为4，如果是，则跳转到第4关
	jne interupt_not4
	mov barsym,4
	mov replaysym,1
	jmp interupt_exit_1
	
interupt_not4:
	cmp al,35h;判断是否为5，如果是，则跳转到第5关
	jne interupt_exit
	mov barsym,5
	mov replaysym,1
	jmp interupt_exit_1
     
interupt_exit:;结束中断
    call move_handle
    call move_handle 
    call move_handle 
    call item_show 
    cmp speedsym,0 
    jz interupt_exit_1;判断加速位
    call move_handle 
     
interupt_exit_1:     
    pop dx 
    pop cx 
    pop ax 
    pop ds 
iret
interupt endp 

;------------------------------------------------------------------- 
;当生命值归零时，显示信息并确定是否重玩
ballouts proc near 
    mov ah,02
    mov bh,00 
    mov dh,13 
    mov dl,8 
    int 10h 
    mov ah,09
    lea dx,lose_info 
    int 21h 
    mov ah,01
    int 21h 
     
    cmp al,79h;如果是y，那么重玩 
    jne ballout_noty 
          mov ah,02 
          mov bh,00 
          mov dh,13 
          mov dl,8 
          int 10h 
          mov ah,09 
          lea dx,con1_info 
          int 21h 
          call replays 
          jmp ballout_exit   
ballout_noty: 
        cmp al,59h;如果是Y，那么重玩 
        jne ballout_notbigy 
        mov ah,02 
        mov bh,00 
        mov dh,13 
        mov dl,8 
        int 10h 
        mov ah,09 
        lea dx,con1_info 
        int 21h 
        call replays 
        jmp ballout_exit 
ballout_notbigy:      
        mov exitsym,0;如果不重玩，那么退出游戏
ballout_exit:     
ret 
ballouts endp 


;------------------------------------------------------------------- 
;重新开局时，重新对砖块等进行赋值 
replays proc near 
    push ax 
    push bx 
    mov ax,ballx
    mov startsx,ax 
    add ax,10 
    mov endsx,ax 
    mov ax,bally 
    mov startsy,ax 
    add ax,10 
    mov endsy,ax 
    mov color,00 
    call setarea 
    mov startsy,193 
    mov endsy,196 
    mov ax,mouse_last 
    mov startsx,ax 
    add ax,bat_width 
    mov endsx,ax 
    call setarea 
    cmp itemsym,-1 
    je replay_notitem 
         mov itemsym,-1
         mov ax,itemx 
         mov startsx,ax 
         add ax,10 
         mov endsx,ax 
         mov ax,itemy 
         mov startsy,ax 
         add ax,10 
         mov endsy,ax 
         mov color,00 
         call setarea 
replay_notitem: 
    call init ;初始化游戏
    pop bx 
    pop ax 
ret 
replays endp 


;------------------------------------------------------------------- 
;用于暂停游戏
waits proc near
    push ax 
    cmp stopsym,1 
    jne waits_exit 
    mov ah,02 
    mov bh,00 
    mov dh,18 
    mov dl,1 
    int 10h 
    mov ah,09 
    lea dx,stop_info 
    int 21h 
     
waitsloop:;等待空格或者esc键 
       mov ah,07 
       int 21h 
       cmp al,20h 
       je waits_exit 
       cmp al,1bh;如果按的是esc键，那么将退出位置为有效 
       jne waitsloop 
       mov exitsym,0 
waits_exit: 
    mov ah,02 
    mov bh,00 
    mov dh,18 
    mov dl,1 
    int 10h 
    mov ah,09
    lea dx,con_info 
    int 21h 
     
    mov stopsym,0;将暂停的控制位置为0
    pop ax 
ret 
waits endp 


;------------------------------------------------------------------------- 
;处理小球运动的函数 
move_handle proc near 
    push ax 
    push bx 
    push cx 
    push dx 
    mov color,00 
    call setball;擦除并重新画小球      
    call positions
    cmp bally,185;如果小球落地，则生命减1
    jl notoutball
    push bx
    xor bx,bx
    mov bx,462h
    call sound
	pop bx
    call sound
    call sound
    call sound
    call sound
    sub life_num,1 
    cmp life_num,1;生命值归零
    jnl notout 
         
    mov balloutsym,1
    jmp move_handle_exit 
 
notout:;只是小球落地而还有生命值时，执行下面的操作 
        mov ah,02;设置光标
        mov bh,00 
        mov dh,1
        mov dl,2 
        int 10h 
        mov ah,09 
        lea dx,life_info
        int 21h 
        mov ah,02;设置光标
        mov bh,00 
        mov dh,1
        mov dl,7 
        int 10h 
        mov ah,02 
        mov dl,life_num 
        add dl,30h 
        int 21h;显示剩余生命
        mov ballx,160;重置
        mov bally,183 
        mov x,-2
        mov y,-1
        mov al,ball_color 
        mov  color,al 
        call setball
        mov ax,mouse_last
        mov startsx,ax 
        mov endsx,ax 
        mov ax,bat_width 
        add endsx,ax 
        mov startsy,193 
        mov endsy,196 
        mov color,00 
        call setarea 
        mov bat_width,50
        mov mouse_last,160
        mov startsx,135 
        mov endsx,185
        mov al,bat_color 
        mov color,al 
        call setarea 
 
notoutball: 
        mov al,ball_color 
        mov  color,al 
        call setball
		push ballx
		cmp x,0		
		jl x_left	;向量向左则跳转
		add ballx,10
x_left:
        call judges;判断小球是否撞到砖块
		pop ballx
move_handle_exit: 
	    pop dx 
	    pop cx 
	    pop bx 
	    pop ax 
ret 
move_handle endp 


;----------------------------------------------------------
;通过对下一个位置的颜色判断得到相应的新位置和新方向向量
positions proc near 
    push ax
    push bx 
    push cx 
    push dx 
    push si 
    push di 
    
    cmp x,0;判断在x轴方向向量
    jnl posright 
    posleft:    
	         mov cx,ballx 
	         add cx,x 
	         jmp posline1 
    posright:   
	         mov cx,ballx 
	         add cx,x 
	         add cx,10 
    posline1:  
		    mov dx,bally 
		    mov ah,0dh;读取下一位置的图形像素
		    mov bh,00 
		    int 10h
		    cmp al,00 
		    je rightup 
		    neg x;x变反
			call sound 		   
		    jmp rightup_exit         
    rightup: 
	        add cx,10 
	        int 10h ;获得下个位置处的像素值
		    cmp al,00 
		    je notnex 
	        neg x;X变反
	        mov ax,x 
	        sub ballx,ax
	        call sound 
    notnex: 
	       mov ax,x 
	       add ballx,ax 
    rightup_exit:     
		    cmp y,0;再判断垂直方向
		    jl up 
    down:    
	         mov dx,bally 
	         add dx,9 
	         add dx,y 
	   		 jmp posvertical 
    up: 
	         mov dx,bally 
	         add dx,y 
    posvertical:
		    mov cx,ballx 
		    mov ah,0dh ;读取下一位置的图形像素
		    mov bh,00 
		    int 10h
		    cmp al,00  
		    je rightcro 
		    neg y
		    call sound 
		    jmp positions_exit 
	rightcro: 
		    add cx,10 
		    int 10h
		    cmp al,00 
		    je notney 
		    neg y 
		    call sound 
		    jmp positions_exit  
    notney: 
	        mov ax,y 
	        add bally,ax      
    positions_exit:         
	    pop di
	    pop si 
	    pop dx 
	    pop cx 
	    pop bx 
	    pop ax 
ret 
positions endp 


;----------------------------------------------------------------------- 
;处理小球与砖块的碰撞
judges proc near 
    push ax
    push bx 
    push dx 
    push cx 
    push si 
         
    cmp bally,101
    jnl judges_exitqq
    mov si,0 
    mov ax,ballx
    mov bx,bally
    sub ax,x;ax中是球的上个x的坐标
    sub bx,y;bx中是球的上个y的坐标
    mov startsy,21
    mov cx,27	
    hit_lie: 
        cmp cx,bx 
        jnl hit_lie_exit;判断行
        add cx,8
        add startsy,8 
        add si,10 
        jmp hit_lie 
    hit_lie_exit:      
	    mov cx,36	;36=31+5
	    mov startsx,6
    hit_line: 
        cmp cx,ax 
        jnl hit_line_exit;判断列
        add cx,31 
        add startsx,31 
        add si,1 
        jmp hit_line 
    hit_line_exit:     
	    cmp bricks_life[si],0;判断是否已击碎 
	    je judges_exitqq   
    mov ah,0dh 
    mov bh,00 
    mov dx,startsy 
    mov cx,startsx 
    int 10h 
    
    cmp al,00 
    je judges_exitqq      
    sub bricks_life[si],1;砖块生命减一
    cmp bricks_life[si],0
    jne judges_exitqq      
    sub bricks_num,1 
    cmp bricks_num,0 
    jne gp 
    mov cmpgamesym,1
 gp: 
    mov ax,startsx;将砖块画为黑色
    add ax,29
    mov endsx,ax 
    mov ax,startsy 
    add ax,6 
    mov endsy,ax 
    mov color,00 
    call setarea
    mov al,bricks_life_reset1[si]
    add score_num,al 
    call score_show
    cmp itemsym,-1;道具 
    jne judges_exitqq  
    mov ax,ballx 
    mov itemx,ax 
    mov ax,bally 
    add ax,13 
    mov itemy,ax 
    cmp bricks_num,98;剩余98个砖块，出现加速道具 
    jne bricks_num98 
    mov itemsym,2 
    jmp judges_exitqq 
  bricks_num98:      
    cmp bricks_num,90 ;剩余90个砖块，出现增大球拍道具 
    jne bricks_num90
    mov itemsym,4
    jmp judges_exitqq 
  bricks_num90:      
    cmp bricks_num,75;剩余75个砖块，出现加分道具
    jne bricks_num75 
    mov itemsym,1
    jmp judges_exitqq 
  bricks_num75:     
    cmp bricks_num,60 ;剩余60个砖块，出现加生命道具 
    jne bricks_num60
    mov itemsym,0
    jmp judges_exitqq 
  bricks_num60:        
    cmp bricks_num,50 ;剩余50个砖块，出现减速道具 
    jne bricks_num50 
    mov itemsym,3
    jmp judges_exitqq 
  bricks_num50:
  	cmp bricks_num,30
  	jne judges_exitqq
    mov itemsym,5
    jmp judges_exitqq 
     
judges_exitqq: 
    pop si 
    pop cx 
    pop dx 
    pop bx 
    pop ax 
ret 
judges endp 
;----------------------------------------------------------------------- 
;画道具
printitem proc near
    push ax
    push bx 
    push cx 
    push dx 
    push si 
    push di 
     
    mov al,100
    mov bl,itemsym 
    mul bl 
    mov si,ax
    mov count,0 
     
    mov al,itemsym
    mov ah,00h 
    mov di,ax 
 
    mov bh,00
    mov ah,0ch
    sub si,1
    mov dx,itemy
    sub dx,1 
    mov cx,itemx 
    add cx,10
printitem_line: 
    mov bl,0 
    add dx,1     
    sub cx,10 
printitem_lie: 
      add bl,1
      add cx,1 
      add si,1 
      mov al,item_color[di]
      cmp add_life[si],00 
      jne printitemcolor
      mov al,00 
printitemcolor: 
      int 10h 
      
      add count,1 
      cmp bl,10 
      jb printitem_lie
      cmp count,99 
      jb printitem_line
    pop di 
    pop si 
    pop dx 
    pop cx 
    pop bx 
    pop ax  
ret 
printitem endp 

;---------------------------------------------------------------- 
;延时函数
waitf proc near
   push cx 
       mov cx,0ffffh
       waitf_1: 
           push cx 
           mov cx,01ffh
           waitf_2: 
           loop waitf_2 
           pop cx 
       loop waitf_1  
   pop cx 
ret 
waitf endp 
;------------------------------------------------------------------------ 
;画小球 
setball proc near
    push ax 
    push bx 
    push cx 
    push dx 
     
    mov bh,00
    mov ah,0ch
    mov si,-1
    mov dx,bally
    sub dx,1 
    mov cx,ballx 
    add cx,10
setball_line: 
    mov bl,0 
    add dx,1      
    sub cx,10 
setball_lie: 
      add bl,1
      add cx,1 
      add si,1 
      mov al,color 
      cmp ball[si],00 
      jne setballcolor
      mov al,00 
setballcolor: 
      int 10h 
      
    cmp bl,10 
    jb setball_lie
    cmp si,99 
    jb setball_line   
setballexit: 
	    pop dx 
	    pop cx 
	    pop bx 
	    pop ax 
ret 
setball endp 

 
;------------------------------------------------------------------------ 
;画矩形
setarea proc near
    push ax 
    push bx 
    push cx 
    push dx 
    push si 
     
    mov ah,0ch
    mov al,color 
    mov dx,startsy
    sub dx,1 
next: 
    add dx,1 
    mov cx,startsx
    sub cx,1 
next1: 
    add cx,1 
    int 10h 
    cmp cx,endsx 
    jnz next1      
    cmp dx,endsy 
    jnz next 
    mov color,al
	
    pop si 
    pop dx 
    pop cx 
    pop bx 
    pop ax   
ret 
setarea endp    


;---------------------------------------------------------- 
;显示分数
score_show proc near
    push ax 
    push bx 
    push dx 
    push cx 
     
    mov ah,02 
    mov bh,00 
    mov dh,1
    mov dl,36
    int 10h 
    mov al,score_num ;百位 
    mov ah,0 
    mov cl,100 
    div cl 
    mov cl,ah 
    mov dl,al 
    add dl,30h 
    mov ah,02 
    int 21h 
    mov al,cl;十位
    mov ah,00 
    mov cl,10 
    div cl     
    mov cl,ah 
    mov ah,02 
    mov dl,al 
    add dl,30h 
    int 21h 
    mov dl,cl;个位 
    add dl,30h 
    int 21h 
     
    pop cx 
    pop dx 
    pop bx 
    pop ax 
ret 
score_show endp 


;------------------------------------------------------------------- 
;道具落下的处理
item_show proc near
    push ax 
    push bx 
    push cx 
    push dx 
    push si 
    cmp itemsym,-1 
    je item_show_exit 
     
    mov bl,itemsym 
    mov bh,00 
    mov al,item_color[bx] 
    mov item_color[bx],00 
    call printitem 
    mov item_color[bx],al
     
    cmp itemy,187;没接到道具
    jl item_show_add 
    mov itemsym,-1 
    jmp item_show_exit
    
item_show_add:      
    	cmp itemy,183;接到   
    	jl item_show_new 
        mov ax,mouse_last 
        cmp ax,itemx 
        jnl item_show_new
         
        add ax,bat_width 
        cmp ax,itemx 
        jl item_show_new
        cmp itemsym,0
        jne nottitem_addlife
        ;增加生命道具
        add life_num,1;设置光标
        mov ah,02 
        mov bh,00 
        mov dh,1 
        mov dl,7 
        int 10h 
        mov ah,02 
        mov dl,life_num 
        add dl,30h 
        int 21h 
        jmp additemend 
nottitem_addlife:              
        cmp itemsym,1 
        jne nottitem_addscore  
        ;增加分数道具
        add score_num,20 
        call score_show
        jmp additemend 
nottitem_addscore:             
        cmp itemsym,2 
        jne nottitem_speedup 
           ;加速道具 
               mov ax,x 
               mov bx,y 
               cmp ax,0
               jnl axbuxiaoyu0 
               neg ax 
    axbuxiaoyu0: 
               cmp bx,0
               jnl bxbuxiaoyu0 
               neg bx 
    bxbuxiaoyu0:               
               add ax,bx
               .if ax>5 
                   mov speedsym,1 
                   jmp additemend 
               .endif                
               mov ax,x
               mov bx,y 
               add ax,ax 
               add bx,bx 
               mov x,ax 
               mov y,bx 
               jmp additemend  
nottitem_speedup: 
               cmp itemsym,3 
           	   jne nottitem_speeddown 
           ;减速道具 
               cmp speedsym,1 
               jne speeddown_hh 
               mov speedsym,0 
               jmp additemend 
   speeddown_hh:          
               mov score_num,3 
               call score_show
               cmp x,-3 
               jnl x1 
               mov x,-2 
               jmp shey 
            x1: 
                cmp x,0 
                jnl x2 
                mov x,-1 
                jmp shey 
             x2: 
                cmp x,4 
                jnl x3 
                mov x,1 
                jmp shey 
             x3: 
                mov x,2 
           shey:                
               cmp y,-3 
               jnl y1 
               mov y,-2 
               jmp additemend 
            y1: 
                cmp y,0 
                jnl y2 
                mov y,-1 
                jmp additemend 
             y2: 
                cmp y,4 
                jnl y3 
                mov y,1 
                jmp additemend 
             y3: 
                mov y,2                
                jmp additemend 
nottitem_speeddown:           
		        cmp itemsym,4 
		        jne nottitem_bigbat 
		           
           ;增大球拍道具
	               cmp bat_width,29 
	               jl bigbat30 
	               mov bat_width,80
	               jmp bigbat_show 
   bigbat30: 
               	   mov bat_width,30 
bigbat_show: 
                  mov startsy,193 
                  mov endsy,196 
                  mov al,bat_color 
                  mov color,al 
                  mov ax,mouse_last 
                  add ax,bat_width 
                  cmp ax,200 
                  jl batkeyi 
                  mov endsx,200 
                  mov ax,200 
                  sub ax,bat_width 
                  mov startsx,ax 
                  call setarea 
                  jmp additemend 
       batkeyi: 
                  mov ax,mouse_last 
                  mov startsx,ax 
                  add ax,bat_width 
                  mov endsx,ax 
                  call setarea 
                  jmp additemend 
nottitem_bigbat:           
		           cmp itemsym,5 
		           jne nottitem_smallbat 
           
           ;减小球拍道具
               mov startsy,193 
               mov endsy,196 
               mov ax,mouse_last 
               mov startsx,ax 
               add ax,bat_width 
               mov endsx,ax 
               mov color,00 
               call setarea                     
               cmp bat_width,40 
               jnl smallbat30 
               
                   mov bat_width,20 
                   mov ax,startsx 
                   add ax,20 
                   mov endsx,ax 
                   mov al,bat_color 
                   mov color,al 
                   call setarea 
                   jmp additemend 
     smallbat30: 
                   mov bat_width,30 
                   mov ax,startsx 
                   add ax,30 
                   mov endsx,ax 
                   mov al,bat_color 
                   mov color,al 
                   call setarea 
               jmp additemend 
               
nottitem_smallbat:                
  additemend: 
            mov itemsym,-1 
            jmp item_show_exit 
item_show_new: 
	    add itemy,1 
	    call printitem
	  	cmp itemsym,0 
	  	jne nottlife 
  	    jmp item_show_exit 
  	nottlife:   	 
		  	cmp itemsym,1 
		  	jne nottscore 
  	        jmp item_show_exit 
  	nottscore:   	 
		  	cmp itemsym,2 
		  	jne nottspeedup 
  	        jmp item_show_exit 
  	nottspeedup:  
		  	cmp itemsym,3 
		  	jne nottspeeddown 
  	        jmp item_show_exit 
  	nottspeeddown:   	 
		  	cmp itemsym,4 
		  	jne nottlargebat 
  	        jmp item_show_exit 
  	nottlargebat:   	 
		  	cmp itemsym,5 
		  	jne nottsmallbat 
  	        jmp item_show_exit 
  	nottsmallbat:   	 
		  	cmp itemsym,6 
		  	jne nottbomb 
	  	    jmp item_show_exit 
  	nottbomb:   	 
	  	   jmp item_show_exit 
    item_show_exit: 
	    pop si 
	    pop dx 
	    pop cx 
	    pop bx 
	    pop ax  
ret 
item_show endp 

;-------------------------------------------------------------------- 
;画挡板
mouse_bat proc near
    push ax 
    push bx 
    push cx 
    push dx 
    mov ax,0bh;读取鼠标变化量 
    int 33h 
    cmp cx,0 
    je mouse_bat_exit
    jl mouse_bat_xiaoyu;向右则跳转
     
    mov dx,mouse_last;确定最左边界
    mov startsx,dx 
    add dx,cx 
     
    mov ax,dx
    add ax,bat_width 
    cmp ax,315 
    jnl mouse_bat_exit 
     
    mov mouse_last,dx
    mov endsx,dx 
    mov startsy,193 
    mov endsy,196 
    mov color,00 
    call setarea 
     
    add dx,bat_width
    mov endsx,dx 
    sub dx,cx 
    mov startsx,dx 
    mov bl,bat_color 
    mov color,bl 
    call setarea 
     
    jmp mouse_bat_exit 
     
mouse_bat_xiaoyu:    ;如果是向右移动 
    mov dx,mouse_last 
    mov endsx,dx 
    add dx,cx 
     
    cmp dx,6;超出0则跳转 
    jl mouse_bat_exit 
     
    mov mouse_last,dx
    mov startsx,dx 
    mov startsy,193 
    mov endsy,196 
    mov bl,bat_color 
    mov color,bl 
    call setarea 
     
    add dx,bat_width
    mov startsx,dx 
    sub dx,cx 
    mov endsx,dx 
    mov color,00 
    call setarea 
   
mouse_bat_exit: 
    pop dx 
    pop cx 
    pop bx 
    pop ax 
ret 
mouse_bat endp 
;---------------------------------------------------------------------- 
;用于实现音效
sound proc far
	push ax
	mov al,0b6h
	out 43h,al
	mov ax,11cah
	add ax,bx
	out 42h,al
	mov al,ah
	out 42h,al
	in al,61h
	mov ah,al
	or al,03h
	out 61h,al
	call delay
	mov al,ah
	out 61h,al
	pop ax
	ret
sound endp

delay proc near
	push ax
	push cx
	mov cx,15668
wait1:
	in al,61h
	and al,10h
	cmp al,ah
	je wait1
	mov ah,al
	loop wait1
	pop cx
	pop ax
	ret
delay endp
;---------------------------------------------------------------------- 
CODES ENDS 
    END START






