.NH
fact 3
.RS
.IP continue:
fact-done
.RE
.NH
fact-loop
.RS
.IP stack:
.RS
.IP continue:
fact-done
.IP n:
3
.RE
.IP continue:
after-fact
.IP n:
2
.RE
.NH
fact-loop
.RS
.IP stack:
.RS
.IP continue:
after-fact fact-done
.IP n:
3 2
.RE
.IP continue:
after-fact
.IP n:
1
.RE
.NH
base-case
.RS
.IP val:
1
.RE
.NH
after-fact
.RS
.IP n:
2
.IP continue:
after-fact
.IP val:
2
.RE
.NH
after-fact
.RS
.IP n:
3
.IP continue:
fact-done
.IP val:
6
.RE
.NH
fact-done
