program example_concurrent
  use, intrinsic :: iso_c_binding
  use :: uuid_now_concurrent
  implicit none

  call initialize_uuid_concurrent()

  do

    ! Pretend this is running in a thread.
    print*,new_uuid_concurrent()

  end do

  call destroy_uuid_concurrent()

end program example_concurrent
