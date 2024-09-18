module uuid_now
  use, intrinsic :: iso_c_binding
  implicit none


  ! private

  ! Starts at [UINT64_T] 0
  integer(c_int64_t), parameter :: MIN_64 = -9223372036854775807_8 - 1


  integer(c_int64_t) :: current = MIN_64

  interface


    ! smol debug
    subroutine print_bits(int) bind(c, name = "print_bits")
      use, intrinsic :: iso_c_binding
      !! Wrap the function internal to make raw binding.
      implicit none

      ! Value because it is const char *

      integer(c_int64_t), intent(in), value :: int
    end subroutine print_bits


  end interface


contains

  subroutine debug
    implicit none

    call print_bits(current)

  end subroutine debug


end module uuid_now
