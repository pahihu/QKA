/ q wrappers 20181016
abs:{x[&x<0]-:;x}
acos:_acos
all:{&/~0=x}
and:{x&y}
any:{|/~0=x}
asc:{x@<x}
asin:_asin
atan:_atan
avg:{(+/x)%0.+#x}
avgs:{(+\x)%1.0+!#x}
bin:{if[y<*x;:-1]; :[0>4:y;x _binl y;x _bin y]}
var:{x:x[&~null x]; avg _sqr x-avg x} / D.Sasha
dev:{_sqrt var x}
cols:{!x}
cov:{avg[x*y]-avg[x]*avg[y]}
cor:{cov[x;y]%dev[x]*dev[y]}
count: #:
cos:_cos
cross:{:[0<4:y;x,\:y;,/x,/:\:y]}
csv: ","
  dqq:qq,(qq:"\"")
  quot:{:[(#x)>x?y;qq,_ssr[x;qq;dqq],qq;x]}
delim:{[sep;rows] sep/'{quot[x;sep]}'/:$rows}
prepare:{delim[x;flip y]}
cut:{:[1=4:x;(0,x*1+!(#y)%x)_ y;x _ y]}
deltas2:{-':x,y}
deltas:{deltas2[0;x]}
desc:{x@>x}
differ:{1,~~':x}
tdistinct:{(!x)!+?+x[]}
distinct:{:[5=4:x;tdistinct[x];?x]}
div:{if[3=_abs 4:x;x:_ic x]; x%y}
ema:{1_{z+y*x}\[*y;1-x;x*y]}
enlist: ,:
/ 7 - eval, 6 - val, 5 - val, 4 - val, 3 - eval...
eval0:{:[1=#x;*x;1<#x;value@eval'x;x]}
eval:{:[0=(xt:4:x);eval0 x;3<xt;value[x];x]}
value0:{:[5=xt:4:x;x[];4=xt;.:x;3=_abs xt;.:x;x]}
value:{:[0=xt:4:x;.[value0[*x];1_ x];value0[x]]}
except:{(value x)@&~in[x;y]}
exit: _exit
exp: _exp
null:{{3>(0N;0n;`)?x}'x}
fill:{[rep;val] :[~0<4:val;{fill[rep;x]}'val;:[null val;rep;val]]}
fills:{fill\x}
first:{:[5=4:x;.+(!x;first'x[]);*x]}
flip:{:[5=4:x;(,!x),+x[];+x]}
floor: _:
get: 1::
getenv: _getenv
group:{.+(`$'x@*:'r;r:=x)}
gtime: _gtime
hcount:{_ _size x}
system:{ ."\\",x}
hdel:{ system"rm ",$x}
iasc: <:
idesc: >:
in:{:[(5=4:x)|5=(yt:4:y);_lin[value x;value y];:[0=yt;:[@*y;x _lin y;x _in y];x _lin y]]}
inter:{(value x)@&in[x;y]}
inv: _inv
nx:{
  ap:(`.k)=*x
  d::[ap;*-1_ x;_d]
  if[ap;x:*-1#x]
  k:!.:d
  :[(#k)>k?x;x;()]}
key:{:[4=4:x;!value x;!:x]}
key:{if[0=(xt:4:x);:`type];if[0>xt;:xt];if[4=xt;x:nx x];if[()~x;:x];:[4=4:x;!value x;!:x]}
last:{:[5=4:x;last[x[*-1#!x]];*-1#x]}
load:{.[x;();:;1:x]} / binary
log: _log
lower: _:
lsq: _lsq
ltime: _ltime
ltrim:{:[" "=*x;(+/&\" "=x)_ x;x]}
max:{:[3=_abs 4:x;_ci|/_ic x;|/x]}
maxs:{:[3=_abs 4:x;_ci|\_ic x;|\x]}
min:{:[3=_abs 4:x;_ci&/_ic x;&/x]}
mins:{:[3=_abs 4:x;_ci&\_ic x;&\x]}
/ swin:{[w;s] {1_ x,y}\[w#0;s]}
swin:{[w;s] 1_{l:x,y; :[z>#l;l;1_ l]}\[0#0;s;1+w]}
mavg:{avg'swin[x;fills y]}
mcount:{+/'~null'swin[x;y]}
md5: _md5
mdev:{dev'swin[x;(*y),fill[0;1_ y]]}
med:{i:<x;j:(#x)%2; :[1=(#x)!2;x@i[j];avg[(x@i[j];x@i[j-1])]]}
mmax:{max'swin[x;y]}
mmin:{min'swin[x;y]}
mmu: _mul
mod:{x!y}
sum:{+/fill[0;x]}
msum:{sum'swin[x;fill[0;y]]}
neg: -:
NUL:(();0N;0n;"";`)
next:{i:1!!#x; x[0]:NUL[_abs 4:x]; x@i}
prev:{i:-1!!#x; x[-1+#x]:NUL[_abs 4:x]; x@i}
not: ~:
or:{x|y}
prd:{*/fill[1;x]}
prds:{*\fill[1;x]}
rand:{*1?x}
rank: <<:
ratios:{%':0.+(*x),x}
raze:{,/value[x]}
flatten:{,//[value[x]]}
read0:{0:x}   / (`f;offs;len) does not work!
read1:{1:x}
reciprocal: %:
reverse:{:[5=4:x;(|!x)!(|x[]);|:x]}
rotate:{:[5=4:y;(!y)!(x!'y[]);x!y]}
rtrim:{:[" "=*-1#x;|ltrim@|x;x]}
save:{x 1:.:x} / binary
scov:{cov[x;y]*(#x)%-1.+#y}
svar:{var[x]*n%-1.+n:#x}
sdev:{_sqrt svar x}
setenv: _setenv
show:{:[5=4:x;pd[x];`0:(5:x),"\n"]; x}
signum:{x[&x>0]:1; x[&x<0]:-1; x[&null x]=-1; x}
sin:_sin
sqrt:_sqrt
ss: _ss
ssr: _ssr
string: {:[5=4:x;(!x)!($x[]);$x]}
sublist1:{:[x>#y;y;x#y]}
sublist2:{:[2=#x;sublist1[x[1];x[0]_ y];sublist1[x;y]]}
sublist:{:[5=4:y;(sublist2[x;!y])!(sublist2[x;y[]]);sublist2[x;y]]}
sums:{+\fill[0;x]}
svs:{s:$*x; `$:[(#s)>s?"/";s,"/"/$1_ x;"."/$x]}
sv2:{if[`~x;x:"\n"];:[3=_abs 4:x;x/$y;x _sv y]}
sv:{:[(`~x)&-4=4:y;svs[y];sv2[x;y]]}
svc:{256_sv x!256} / cvt bytes
svb:{2_sv x!2} / cvt bits
tan:_tan
til: !:
trim:{rtrim ltrim x}
TYP:`S`C`F`I`K`i`f`c`s`d`n`x
type: 4::

tinter:{if[~(!x)~cols:!y;:`domain]; d:+x[]; cols!+d@&_lin[d;+y[]]}
tsidejoin:{if[0<#inter[!x;!y];:`domain]; ((!x),!y)!(x[]),y[]}
tjoin:{if[~(!x)~cols:!y;:`domain];cols!x[],'y[]}
join:{:[5=4:x;tjoin[x;y];x,y]}
union:{?(value x),value y}
tunion:{if[~(!x)~cols:!y;:`domain]; cols!+union[+x[];+y[]]}
upper:{i:&(123>d)&96<(d:_ic$x);d[i]-:32;:[4=4:x;`$_ci d;_ci d]}
/ (`view;_n;(+;1;`a);,`a;"1+a")
mkv:{(`view;_n;();x;y)}
view:{x[4]}
isview:{if[4:x;:0]; if[~5=#x;:0]; `view~*x}
views:{d:.`.k; v:(!d)@&isview'd[]; v[<v]}
pending:{d:.`.k; d[x;1]~\:_n}
sysB:{v:views[]; v[&pending v]};
vsp:{d:-1_ x; b:*:-1#x; `$("/"/d;b)}
vss:{s:$x; :[(#s)>s?"/";vsp@"/"\s;`$"."\$x]}
vs2:{if[`~x;x:"\n"];:[3=_abs 4:x;x\$y;(0=4:y)|-1=4:y;+x _vs ,/y;x _vs y]}
vs:{:[(`~x)&4=4:y;vss[y];vs2[x;y]]}
vsc:{256_vs x} / cvt bytes
vsb:{2_vs x} / cvt bits
wavg:{x:x[&~null x];y:y[&~null y]; (+/(x*y))%0.++/x}
where:{:[5=4:x;,/(x[])#'!x;&:x]}
within2:{(~y>x)&~x>z}
within:{:[0=4:y;x{within[x;y]}'+y;within2[x;y@0;y@1]]}
wsum:{+/x*0.+y}
xasc:{{(!x)!x[;<x@y]}/[y;|x]}
xbar:{x*_(0.+y)%x}
xcol:{(x,((#x)_!y))!y[]}
xcols:{h:(x,except[!y;x]); (h)!y[h]}
xdesc:{{(!x)!x[;>x@y]}/[y;|x]}
xexp:{x^y}
xgroup:{h:except[!y;x]; (x,h)!(,?+y[x]),y[h;=+y[x]]}

id:{((x-1)-!x)!'x#,((x-1)#0),1}

m:3 3#2 4 8 3 5 6 0 7 1.
t:.+(`a`b;(1 2 3;`x`y`z))
ra:(1 2 3;4 5;6 7 8 9;0)
rd:.+(`a`b`c;(1 2;3 4 5;"hello"))
D:.+(`sym`price`size;(`IBM`MSFT;10.2 23.45;100 100))
d1:.+(`a`b;(1 2 3;`x`y`z))
d2:.+(`a`b`c;(1 2 3;2 3 5;`x`y`z))
t0:`x`y!(2 3 5;"abc")
t1:`x`y!(2 4;"ad")
r:`a`b!(10 11;"ef")

pd:{w:|/#:'(h:$!x); `0:(w$h),'"|",'5::'x[]}
tshow:{w:1+|/ |/#:/:/:(h:$flip x); h:(,h[0]),(,(#h)#,w#"-"),1_ h; `0:""/'w$h}

/ NB.  tshow distinct join[t0;t1] rank error...
