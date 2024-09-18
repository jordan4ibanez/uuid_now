module uuid_now
  implicit none
  private

  public :: say_hello
contains
  subroutine say_hello
    print *, "Hello, uuid_now!"
  end subroutine say_hello
end module uuid_now
