program example
  use, intrinsic :: iso_c_binding
  use :: uuid_now
  implicit none

  if (.true.) return
  do

    print*,new_uuid()

  end do

end program example
