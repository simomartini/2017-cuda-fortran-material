program example_vector_add
use vector_add_m
real, allocatable:: a(:)
real, allocatable,device:: a_d(:)
integer:: i, N

N=32
allocate(a(N))

a=1.
allocate(a_d,source=a)

print *,"doing sum on cpu"
call vector_add(a,10.,N)


if(any(a /= 11.) )  then
  print *,"Vector add failed"
  print *,a
else
  print *,"Vector add passed"
  print *,a
end if 

print *,"doing sum on gpu"
a=0.
call vector_add(a_d,10.,N)
a=a_d

if(any(a /= 11.) )  then
  print *,"Vector add failed"
  print *,a
else
  print *,"Vector add passed"
  print *,a
end if 

end program example_vector_add
