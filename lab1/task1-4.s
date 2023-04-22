        .text
        .align  1
        .globl  bubblesort
        .type   bubblesort, @function
bubblesort:
        addi sp, sp, -20
        sw ra, 16(sp)
        sw s3, 12(sp)
        sw s4, 8(sp)
        li s4, 0        # i = 0
loop1:
        bge s4, a1, exit1
        addi s3, s4, 1
loop2:
        slli t0, s4, 2  # 左移2位，计算偏移（i）
        add t0, a0, t0  # 加上arr首地址
        lw t1, 0(t0)    # 取出arr[i]内容
        bge s3, a1, exit3       # j>n
        slli t2, s3, 2  # 计算偏移（j）
        add t2, a0, t2  # 加上arr首地址
        lw t3, 0(t2)    # 取出arr[j]内容
        ble t1, t3, exit2       # a[i]<a[j]
        # 交换
        sw t3, 0(t0)
        sw t1, 0(t2)
exit2:
        addi s3, s3, 1  # j++
        j loop2
exit3:
        addi s4, s4, 1  # i++
        j loop1
exit1:
        lw s4, 8(sp)
        lw s3, 12(sp)
        lw ra, 16(sp)
        addi sp, sp, 20
.L2:
        li      a0,0
        ret
        .size   bubblesort, .-bubblesort