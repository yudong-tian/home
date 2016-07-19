
!  random_test.f90  19 June 2000
!
!***********************************************************************
!
program random_test
!
!***********************************************************************
!
!! RANDOM_TEST looks at the F90 random number generation utilities.
!
!
!  Modified:
!
!    15 May 2000
!
!  Author:
!
!    John Burkardt
!
  write ( *, * ) ' '
  write ( *, * ) 'RANDOM_TEST'
  write ( *, * ) '  A Fortran90 program to examine the F90 random'
  write ( *, * ) '  number generation utilities.'
  write ( *, * ) ' '

  call test01

  call test02

  write ( *, * ) ' '
  write ( *, * ) 'RANDOM_TEST'
  write ( *, * ) '  Normal end of RNG tests.'

  stop
end program random_test

subroutine test01
!
!***********************************************************************
!
!! TEST01 demonstrates how the RANDOM_NUMBER routine can be called.
!
!
!  Modified:
!
!    15 May 2000
!
!  Author:
!
!    John Burkardt
!
  integer i
  integer j
  real x_array(5,2)
  real x_scalar
  real x_vector(2)
!
  write ( *, * ) ' '
  write ( *, * ) 'TEST01:'
  write ( *, * ) '  To generate 10 random numbers, you could'
  write ( *, * ) '  call RANDOM_NUMBER ( X )...'
  write ( *, * ) ' '
  write ( *, * ) '  10 times, with a scalar X:'
  write ( *, * ) ' '

  do i = 1, 10
    call random_number ( x_scalar )
    write ( *, * ) ' '
    write ( *, '(f8.5)' ) x_scalar
  end do

  write ( *, * ) ' '
  write ( *, * ) '  five times with a vector X of length 2:'
  write ( *, * ) ' '

  do i = 1, 5
    call random_number ( x_vector )
    write ( *, * ) ' '
    write ( *, '(2f8.5)' ) x_vector(1:2)
  end do

  write ( *, * ) ' '
  write ( *, * ) '  or once with a 5 by 2 X array:'
  write ( *, * ) ' '

  call random_number ( x_array )

  do i = 1, 5
    write ( *, '(2f8.5)' ) x_array(i,1:2)
  end do

  return
end subroutine test01

subroutine test02
!
!***********************************************************************
!
!! TEST02 demonstrates how the SEED routine can be used.
!
!
!  Modified:
!
!    15 May 2000
!
!  Author:
!
!    John Burkardt
!
  integer, parameter :: n_max = 100
!
  integer i
  integer j
  integer n
  integer seed(n_max)
  integer seed_save(n_max)
  real x_array(5,2)
  real x_scalar
  real x_vector(2)
!
  write ( *, * ) ' '
  write ( *, * ) 'TEST02:'
  write ( *, * ) '  The RANDOM_SEED routine can be used to restart'
  write ( *, * ) '  the random number generator.  We will repeat'
  write ( *, * ) '  the previous test, and manipulate the seed so'
  write ( *, * ) '  that we compute the same 10 numbers each time.'
!
!  This call initializes the seed.
!
  call random_seed 

  call random_seed ( SIZE = n )

  write ( *, * ) '  The size of the seed array is N = ', n

  if ( n > n_max ) then
    write ( *, * ) ' '
    write ( *, * ) 'TEST02'
    write ( *, * ) '  The size of the seed array exceeds our'
    write ( *, * ) '  internal max of N_MAX = ', n_max
    write ( *, * ) '  Skip this test until you correct the coding!'
    return
  end if

  call random_seed ( GET = seed )

  write ( *, * ) ' '
  write ( *, * ) '  The current seed is ', seed
  write ( *, * ) '  We''re going to save this seed and reuse it.'

  seed_save = seed

  write ( *, * ) ' '
  write ( *, * ) '  10 times, with a scalar X:'
  write ( *, * ) ' '

  do i = 1, 10
    call random_number ( x_scalar )
    write ( *, * ) ' '
    write ( *, '(f8.5)' ) x_scalar
  end do

  call random_seed ( GET = seed )

  write ( *, * ) ' '
  write ( *, * ) '  The current seed is ', seed
  write ( *, * ) '  We reset it to      ', seed_save
     
  call random_seed ( PUT = seed_save )

  write ( *, * ) ' '
  write ( *, * ) '  five times with a vector X of length 2:'
  write ( *, * ) ' '

  do i = 1, 5
    call random_number ( x_vector )
    write ( *, * ) ' '
    write ( *, '(2f8.5)' ) x_vector(1:2)
  end do

  call random_seed ( GET = seed )

  write ( *, * ) ' '
  write ( *, * ) '  The current seed is ', seed
  write ( *, * ) '  We reset it to      ', seed_save
     
  call random_seed ( PUT = seed_save )

  write ( *, * ) ' '
  write ( *, * ) '  or once with a 5 by 2 X array:'
  write ( *, * ) ' '

  call random_number ( x_array )

  do i = 1, 5
    write ( *, '(2f8.5)' ) x_array(i,1:2)
  end do

  call random_seed ( GET = seed )

  write ( *, * ) ' '
  write ( *, * ) '  The current seed is ', seed

  return
end subroutine test02


