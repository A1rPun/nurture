# AT&T assembly syntax used in GNU AS
.global _start

.text
_start:
  movl $4, %eax       # system call number (sys_write)
  movl $1, %ebx       # first argument: file handle (stdout)
  movl $message, %ecx # second argument: message to write
  movl $length, %edx  # third argument: message length
  int  $0x80          # perform the system call

  movl $1, %eax       # system call number (sys_exit)
  movl $0, %ebx       # first argument: exit code
  int  $0x80          # perform the system call

.data
message:
  .ascii "Hello world!\n"
  length = .-message  # compute length of message
