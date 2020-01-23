Shell answers should be shared in the one liner format.

1) Extract the list of all the status returned, count and sort them. Find two ways to achieve this, one using `jq` + one using standard tools available on UNIX systems. Expected output:
```
<Number of events> <status code>
<Number of events> <status code>
...
```
2) How many GET events came on `api.sendinblue.com/users`?
3) Do a reverse DNS resolution for all IPs (excluding local IPs) listed in the log file. Expected output:
```
IP: xxx.xxx.xxx.xxx / Reverse: foo.example.net
IP: xxx.xxx.xxx.xxy / Reverse: bar.example.net
...
```

Bonus: Which request is an April joke? Why?
