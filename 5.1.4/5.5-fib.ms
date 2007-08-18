.NH
fib 3
.RS
.IP continue:
fib-done
.RE
.NH
fib-loop
.RS
.IP stack:
.RS
.IP continue:
fib-done
.IP n:
3
.RE
.IP continue:
after-fib-n-1
.IP n:
2
.RE
.NH
fib-loop
.RS
.IP stack:
.RS
.IP continue:
after-fib-ni-1 fib-done
.IP n:
2 3
.RE
.IP continue:
afterfib-n-1
.IP n:
1
.RE
.NH
immediate answer
.RS
.IP val:
1
.RE
.NH
after-fib-n-1
.RS
.IP val:
1
.IP continue:
afterfib-n-1
.IP stack:
.RS
.IP continue:
afterfib-n-1 fib-done
.IP n:
3
.IP val:
1
.RE
.IP n:
0
.IP continue:
afterfib-n-2
.RE
.NH
immediate-answer
.RS
.IP val:
0
.RE
.NH
afterfib-n-2
.RS
.IP n:
0
.IP val:
1
.IP contiune:
afterfib-n-1
.IP stack:
.RS
.IP continue:
fib-done
.IP n:
3
.RE
.RE
.NH
afterfib-n-1
.NH
immediate-answer
.RS
.IP val:
0
.RE
.NH
afterfib-n-1
.RS
.IP stack:
.RS
.IP continue:
fib-done
.IP val:
0
.IP n:
1
.RE
.IP continue:
afterfib-n-2
.IP val:
0
.RE
.NH
immediate-answer
.RS
.IP val:
1
.RE
.NH
afterfib-n-2
.RS
.IP n:
1
.IP continue:
fib-done
.IP val:
1
.RE
.NH
fib-done
