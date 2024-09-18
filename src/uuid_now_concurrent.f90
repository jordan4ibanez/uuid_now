module uuid_now_concurrent
  use, intrinsic :: iso_c_binding
  use :: thread_mutex
  implicit none


  ! private


  ! Starts at [UINT64_T] 0
  ! bits: 1000000000000000000000000000000000000000000000000000000000000000
  integer(c_int64_t), parameter :: MIN_64 = -9223372036854775807_8 - 1

  integer(c_int64_t) :: current = MIN_64

  type(mutex_rwlock), pointer :: lock => null()
  type(c_ptr) :: lock_c_loc = c_null_ptr


contains


  !* You must initialize this one!
  subroutine initialize_uuid_concurrent()
    implicit none

    lock => thread_create_mutex_pointer()
    lock_c_loc = c_loc(lock)
  end subroutine initialize_uuid_concurrent


  !* You should definitely destroy it when you're done.
  subroutine destroy_uuid_concurrent()
    implicit none

    call thread_destroy_mutex_pointer(lock)
    lock => null()
    lock_c_loc = c_null_ptr
  end subroutine destroy_uuid_concurrent


  !* I'm not sure it really needs to be said but,
  !* this is not crypographically safe, lol.
  function new_uuid() result(uuid)
    implicit none

    integer(c_int64_t) :: uuid
    integer(c_int) :: status

    status = thread_write_lock(lock_c_loc)

    uuid = current

    ! If you were to generate a new UUID every nanosecond,
    ! it will take 292.471 years to overflow this.
    current = current + 1

    status = thread_unlock_lock(lock_c_loc)
  end function new_uuid


end module uuid_now_concurrent
