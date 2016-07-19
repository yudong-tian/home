

	program getrand
	real a(5, 2)
	integer seeds(100)
	integer asize, i, j
        Do j = 1, 3
        Do i=1, 100
          seeds(i) = j*1000001
        end do
	
	call random_seed(SIZE=asize)
        write(*, *)"asize=", asize
	call random_seed(PUT=seeds)
	call random_seed(SIZE=asize)
        write(*, *)"asize=", asize
	call random_number(a)
	write(*, *) a

	!call random_seed(PUT=2)
	call random_number(a)
	write(*, *) a

	call random_number(a)
	write(*, *) a
	call random_number(a)
	write(*, *) a
	write(*, *) "=============================="
        end do 
        
	stop
	end
