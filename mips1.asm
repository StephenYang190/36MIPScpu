main:
     addiu $s1,$zero,100      #s1=#s1+100
     addiu $s2,$zero,250      #s2=s2+250
exit:add $s1,$s1,$s1          #s1=s1+s1
     slt $s6,$s1,$s2          #if s1<s2,s6=1
     beq $s6,$zero,else       #if s6=0,goto else
     j exit            
else:sub $s3,$s1,$s2          #s3=s1-s2
     ori $s4,$s3,1            #s4=s3|1
     sw $s4 0($s1)
     lw $s3 0($s2)