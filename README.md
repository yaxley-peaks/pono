# Arbitrary polish notation solver

You can put your operators and numbers anywhere and they will be calculated from left to right. No need to worry about things like precedence.

```shell
$ pono
Welcome to this arbitrary polish notation solver. Please enjoy your stay.
Please input 1 expression on 1 line
Press ctrl + C to exit
( ^_^)
> 2 * 4 / 8
1.0
> 8 2 / 11 3 + /
5.0
> + * / 5 5 2 4
5.0
> / 10 5 1 1 1 + + + 2 *
10.0
> / 10 5 1 1 1 + + + 2 * 2 /
5.0
```
## Installation and usage
```shell
$ git clone https://github.com/yaxley-peaks/pono.git
$ cd pono
$ cabal install
$ pono
```
