module uuid_now
  use, intrinsic :: iso_c_binding
  implicit none


  private

  public :: new_uuid


  ! Starts at [UINT64_T] 0
  ! bits: 1000000000000000000000000000000000000000000000000000000000000000
  integer(c_int64_t), parameter :: MIN_64 = -9223372036854775807_8 - 1

  integer(c_int64_t) :: current = MIN_64


contains


  !* I'm not sure it really needs to be said but,
  !* this is not crypographically safe, lol.
  function new_uuid() result(uuid)
    implicit none

    integer(c_int64_t) :: uuid

    uuid = current

    ! If you were to generate a new UUID every nanosecond,
    ! it will take 292.471 years to overflow this.
    current = current + 1
  end function new_uuid


end module uuid_now
