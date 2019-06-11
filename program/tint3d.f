!$Id:$
      subroutine tint3d(ll,lint,s)

!      * * F E A P * * A Finite Element Analysis Program

!....  Copyright (c) 1984-2019: Regents of the University of California
!                               All rights reserved

!-----[--.----+----.----+----.-----------------------------------------]
!      Purpose: Gauss quadrature for 3-d tetrahedral element

!      Inputs:
!         ll       - Type of quadrature

!      Outputs:
!         lint     - Number of quadrature points
!         s(5,*)   - Values of volume coordinates and weights
!-----[--.----+----.----+----.-----------------------------------------]
      implicit  none

      integer       :: i, j, ll, lint
      real (kind=8) :: s(5,*)

      save

!     1 pt. quadrature O(h^2)

      if(ll.eq.1) then
        lint = 1
        do i = 1,4
          s(i,1) = 0.25d0
        end do ! i
        s(5,1) = 1.0d0/6.d0

!     4 pt. quadrature O(h^3)

      elseif(ll.eq.2) then
        lint = 4
        s(5,4) = 0.25d0/6.d0
        do i = 1,4
          do j = 1,4
            s(i,j) = 0.1381966011250105d+00
          end do ! j
          s(i,i) = 0.5854101966249658d+00
          s(5,i) = s(5,4)
        end do ! i

!     11 pt. quadrature O(h^4)

      elseif(ll.eq.3) then
        lint = 11
        do i = 1,3
          do j = 1,10
            s(i,j) = 0.0d0
          end do ! j
          s(i, i  ) = 1.00d0
          s(i, i+4) = 0.50d0
          s(i, i+7) = 0.50d0
          s(i, 11 ) = 0.25d0
        end do ! i
        s(2, 5) = 0.50d0
        s(3, 6) = 0.50d0
        s(1,10) = 0.50d0
        do j = 1,4
          s(5,j) = 1.d0/360.d0
        end do ! j
        do j = 5,10
          s(5,j) = 1.d0/90.d0
        end do ! j
        s(5,11) = 4.d0/45.d0
      else

!     16 pt. quadrature O(h^5)

        lint = 16
        s(5,4) = 0.8395632516687135d-02
        do i = 1,3
          do j = 1,4
            s(i,j) = 0.7611903264425430d-01
          end do ! j
          s(i,i) = 0.7716429020672371d+00
          s(5,i) = s(5,4)
        end do ! i
        do i = 5,16
          s(5,i) = 0.1109034477221540d-01
        end do ! i

        s(1, 5) = 0.1197005277978019d+00
        s(2, 5) = 0.7183164526766925d-01
        s(3, 5) = 0.4042339134672644d+00
        s(1, 6) = 0.4042339134672644d+00
        s(2, 6) = 0.1197005277978019d+00
        s(3, 6) = 0.7183164526766925d-01
        s(1, 7) = 0.4042339134672644d+00
        s(2, 7) = 0.4042339134672644d+00
        s(3, 7) = 0.1197005277978019d+00
        s(1, 8) = 0.7183164526766925d-01
        s(2, 8) = 0.4042339134672644d+00
        s(3, 8) = 0.4042339134672644d+00

        s(1, 9) = 0.1197005277978019d+00
        s(2, 9) = 0.4042339134672644d+00
        s(3, 9) = 0.7183164526766925d-01
        s(1,10) = 0.4042339134672644d+00
        s(2,10) = 0.1197005277978019d+00
        s(3,10) = 0.4042339134672644d+00
        s(1,11) = 0.7183164526766925d-01
        s(2,11) = 0.4042339134672644d+00
        s(3,11) = 0.1197005277978019d+00
        s(1,12) = 0.4042339134672644d+00
        s(2,12) = 0.7183164526766925d-01
        s(3,12) = 0.4042339134672644d+00

        s(1,13) = 0.1197005277978019d+00
        s(2,13) = 0.4042339134672644d+00
        s(3,13) = 0.4042339134672644d+00
        s(1,14) = 0.7183164526766925d-01
        s(2,14) = 0.1197005277978019d+00
        s(3,14) = 0.4042339134672644d+00
        s(1,15) = 0.4042339134672644d+00
        s(2,15) = 0.7183164526766925d-01
        s(3,15) = 0.1197005277978019d+00
        s(1,16) = 0.4042339134672644d+00
        s(2,16) = 0.4042339134672644d+00
        s(3,16) = 0.7183164526766925d-01

      endif

!     Compute fourth points

      do j = 1,lint
        s(4,j) = 1.d0 - (s(1,j) + s(2,j) + s(3,j))
      end do ! j

      end subroutine tint3d
