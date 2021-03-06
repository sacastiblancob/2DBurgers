	MODULE aetas
! 	-------------------------------------------------
! 	This module contains the information related with
! 	time steps
! 	
! 	Jorge Escobar-Vargas
! 	Cornell University
! 	February 2008
! 	-------------------------------------------------
	implicit none
	save
	
! 	1. Size of the time step
	real :: dT 
	
! 	2. Maximum number of time steps (segundos, tiempo REAL)
!	Modificado para que corra con los datos de NU (marzo 2020)
	integer :: tmax = 105
	
! 	3. Courant Number
!	real, parameter :: CN
        real :: CN

	END MODULE aetas
