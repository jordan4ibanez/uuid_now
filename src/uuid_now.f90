module uuid_now
  use, intrinsic :: iso_c_binding
  implicit none


  ! private

  ! Starts at [UINT64_T] 0
  integer(c_int64_t), parameter :: MIN_64 = -9223372036854775807_8 - 1





contains

  subroutine debug
    implicit none

    call print_bits(current)

  end subroutine debug


end module uuid_now
