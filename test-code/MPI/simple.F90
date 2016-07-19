
   program simple
   include 'mpif.h'

   integer numtasks, rank, len, ierr  
   character(MPI_MAX_PROCESSOR_NAME) hostname
   
   integer a(10), i, total, gtotal
 
   a=-10
   total = 2

   call MPI_INIT(ierr)
   if (ierr .ne. MPI_SUCCESS) then
      print *,'Error starting MPI program. Terminating.'
      call MPI_ABORT(MPI_COMM_WORLD, rc, ierr)
   end if

   call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
   call MPI_COMM_SIZE(MPI_COMM_WORLD, numtasks, ierr)
   call MPI_GET_PROCESSOR_NAME(hostname, len, ierr)

   if (rank .eq. 0) then 
     write(*, *) "Hey, I am the master processs. numtasks= ",  numtasks
     do i=1, 10
        a(i) = i
     end do 
   end if 

   if (rank .eq. 1) then 
     write(*, *) "Hey, I am #1 before bcast" 
     do i=1, 10
       write(*, *) i,  a(i) 
     end do 
   end if 

   call MPI_Bcast(a, 10, MPI_INT, 0, MPI_COMM_WORLD, ierr)

   call MPI_Reduce(total, gtotal, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD, ierr)

   if (rank .eq. 1) then 
     write(*, *) "Hey, I am #1 after bcast" 
     do i=1, 10
       write(*, *) i,  a(i) 
     end do 
   end if 

   if (rank .eq. 0 ) & 
   write(*, *) "rank=", rank, "gtotal=", gtotal 

!C ****** do some work ******

   call MPI_FINALIZE(ierr)

   end

