	program geometry

! 	This program creates the input file for the solution of
! 	Helmholtz or Advection equation via Spectral Multidomain methods
! 	2D Equidistant Structured mesh
! 	Jorge Escobar - Cornell University
! 	June 2006

! 	=======================================================================
!	Cambiado a unstructured mesh en direccion z por Antonio Preziosi 
!	Diciembre 2016 (version ok 1 dic/2016)
! 	=======================================================================

!	Actualizados para un dominio de 60 x 28 cm 
	real, parameter :: x = 60
	real, parameter :: z = 0.0
	real, parameter :: x0 = 0.0
	real, parameter :: z0 =  -28
! 	Actualizados para el nuevo dominio 2019
	integer, parameter :: nx = 30 ! Pone el numero de subdominios en x
	integer, parameter :: nz = 15 ! Pone el numero de subdominios en z
	integer, parameter :: numsub = nx * nz
	integer, dimension(numsub,4) :: C
	real :: dx, dz, z1
	integer :: ngp,s
	real, dimension(nz + 1):: pz 
	open(10,file='PruebaGeom.dat')

!	This is the old pz, when the original domain had 40 cm instead of 60 cm 
! 	corresponding to the new numerical model
!	pz = (/ -20.,-18.75,-17.5,-15.,-10.,-5.,-2.5,-1.25,-0.625,-0.3125,0. /)

!	This is a new inserition for the current domain size of 60 cm x 28 cm
!	pz = (/-28., -26.75, -25.5, -23., -18., -15., -10., -7.5, -5., &
!			-2.5, -2., -1.25, -1., -0.525, -0.3125, 0./)

!	This is a new inserition for the current domain size of 60 cm x 28 cm
	pz = (/-28., -27., -26., -24., -22., -20., -18., -16., -14., -12., &
      		-10., -8., -6., -4., -2., 0./) 

	dx=(x - x0) / nx ! Cambiado por diferencia entre xmax y xmin
!	Este pedazo de dz se quita porque es el que voy a volver variable, el 
!	dx va a ser constante para los casos que estoy analizando
	
	dz = z - z0 ! Cambiado por diferencia entre zmax y zmin

	ngp = (nx + 1) * (nz + 1)
	write(*,*)'NGP is: ', ngp
	write(*,*)'Maximo de z es', z 
	write(*,*)'Numero de elementos', numsub 

! 	Creating coordinates of grid points
	do i = 1,(nz + 1)
	 do j = 0, nx
	  write(10,*) x0 + (j * dx), pz(i)
	 enddo
	enddo

! 	Creating subdomains
	s = 0
	do i = 1, nz
	 do j = 1, nx
	  s= s + 1
	  C(s,1) = ((nx + 1) * (i - 1)) + j
	  C(s,2) = ((nx + 1) * (i - 1)) + j + 1
	  C(s,3) = ((nx + 1) * i) + j + 1
	  C(s,4) = ((nx + 1) * i) + j
          enddo

	enddo

        do i=1,numsub
	 write(10,*)(C(i, j),j = 1, 4)
        enddo

! 	Type of boundary condition
	write(10,*) 1, 3, 1, 3

        write(10,*) 0, 0, 0, 0

 
        close(10)
        
	end program geometry
