
! testing the behavior of sequential output 
!  
!
program seq_test


   real :: a(100, 100, 7), b
   integer :: i, j, k
   
   open(10, file="test.bin", form="unformatted", access="sequential") 

   Do k=1, 7
    Do j=1, 100
     Do i=1, 100
        a(i, j, k) = k*1000+i
     End Do 
    End Do 
   End Do 

   b=3.0
   
   write(10) b
   Do k=1, 7
    write(10) a(:, :, k) 
   end do 

   close(10) 
   end 

