# uuid_now
I want a UUID int64 and I want it now!

Extremely simple. If you have one of these in your program, you'll never have overlapping UUIDS.

If you like what I do, and would like to support me: [My Patreon](https://www.patreon.com/jordan4ibanez)

### Info:

You will receive a ``c_int64_t`` value when ``new_uuid()`` is called.

There is also a concurrent version that needs to be created. (mutex creation)

### Goal:

This project is literally only aimed at game engine development.

### Add to your project:

In your fpm.toml add:

```toml
[dependencies]
uuid_now = { git = "https://github.com/jordan4ibanez/uuid_now" }
```

### Example:

Here is the single threaded example:

```fortran
program example
  use, intrinsic :: iso_c_binding
  use :: uuid_now
  implicit none

  do

    print*,new_uuid()

  end do

end program example
```

The multithreaded example:
```fortran

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
```

That's about it, really.
