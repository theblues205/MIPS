# Filename: Ex1
# Author: Vuong Quang Huy	Date: 03/04/2018
# Description: This program computes the operation (4x+5)/y, with x,y are integers and read from keyboard
# Input: Three integer numbers x,y
# Output: outputs the result of (4x+5)/y

################### Data segment ###################
.data
prompt:	.asciiz     "Please enter x,y \n"
result1:	.asciiz     "(4x+5)/y =  "
result2:  .asciiz     "\n Remainder = "
################### Code segment ###################
.text
.globl main
main:
      la    $a0,prompt    # display prompt string
      li    $v0,4
      syscall
      li    $v0,5         # read x 
      syscall
      move  $t0,$v0       # store x into $t0
    
      li    $v0,5         # read y 
      syscall
      move  $t1,$v0       # store y into $t1
          
      li    $t2,4         # calculate 4x and store into $t0
      mul   $t0,$t0,$t2   
      
      li    $t2,5         # store 5 into $t2
      
      addu  $t0,$t0,$t2   # calculate (4x + 5) and store into $t0
     
      div    $t0,$t1      # calculate (4x + 5)/y  (division with overflow, set LO to quotient and HI to remainder )
  
          
      
      mflo $s0     #  get quotient and store into $s0
      mfhi $s1     #  get remainder and store into $s1 
      
      la    $a0,result1    # write quotient message
      li    $v0,4
      syscall
      
      move  $a0,$s0       # output quotient
      li    $v0,1
      syscall
      
      la    $a0,result2   # write remainder message
      li    $v0,4
      syscall
      
      move  $a0,$s1       # output remainder
      li    $v0,1
      syscall
      
      li    $v0,10        # exit
      syscall
