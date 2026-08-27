((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,D,F,G,A={agc:function agc(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g},agd:function agd(){},age:function age(d,e,f,g,h,i){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i},aga:function aga(){},agb:function agb(){},uL:function uL(d,e,f){var _=this
_.b=_.w=null
_.c=!1
_.qK$=d
_.c5$=e
_.an$=f
_.a=null},Nz:function Nz(d,e,f,g,h,i,j){var _=this
_.af=d
_.y1=e
_.y2=f
_.dH$=g
_.aa$=h
_.cA$=i
_.b=_.dy=null
_.c=0
_.y=_.d=null
_.z=!0
_.Q=null
_.as=!1
_.at=null
_.ay=$
_.ch=j
_.CW=!1
_.cx=$
_.cy=!0
_.db=!1
_.dx=$},
a5c(d,e,f,g,h,i){var x=null
return new A.KO(d,new H.uK(e,f,!0,!0,!0,0,D.ay_(),x),g,C.al,!1,x,x,h,x,i,x,0,x,x,f,F.fi,C.a6,x,x,C.R,C.av,x)},
KO:function KO(d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,a0){var _=this
_.to=d
_.x1=e
_.dx=f
_.c=g
_.d=h
_.e=i
_.f=j
_.r=k
_.w=l
_.x=m
_.y=n
_.z=o
_.Q=p
_.as=q
_.at=r
_.ax=s
_.ay=t
_.ch=u
_.CW=v
_.cx=w
_.cy=x
_.a=a0},
OL:function OL(d,e,f){this.f=d
this.d=e
this.a=f}},E,H
B=c[0]
C=c[2]
D=c[32]
F=c[37]
G=c[60]
A=a.updateHolder(c[26],A)
E=c[38]
H=c[31]
A.agc.prototype={
a_8(d){var x=this.c
return d.ul(this.d,x,x)},
k(d){var x=this
return"SliverGridGeometry("+C.b.bk(B.b(["scrollOffset: "+B.j(x.a),"crossAxisOffset: "+B.j(x.b),"mainAxisExtent: "+B.j(x.c),"crossAxisExtent: "+B.j(x.d)],y.x),", ")+")"}}
A.agd.prototype={}
A.age.prototype={
a_k(d){var x=this.b
if(x>0)return Math.max(0,this.a*C.c.i9(d/x)-1)
return 0},
a9F(d){var x,w,v=this
if(v.f){x=v.c
w=v.e
return v.a*x-d-w-(x-w)}return d},
C_(d){var x=this,w=x.a,v=C.i.bD(d,w)
return new A.agc(C.i.jV(d,w)*x.b,x.a9F(v*x.c),x.d,x.e)},
Vd(d){var x
if(d===0)return 0
x=this.b
return x*(C.i.jV(d-1,this.a)+1)-(x-this.d)}}
A.aga.prototype={}
A.agb.prototype={
L0(d){var x=d.w,w=Math.max(1,C.c.i9(x/166)),v=Math.max(0,x-16*(w-1))/w,u=v/0.6666666666666666
return new A.age(w,u+16,v+16,u,v,B.wN(d.x))}}
A.uL.prototype={
k(d){return"crossAxisOffset="+B.j(this.w)+"; "+this.a2X(0)}}
A.Nz.prototype={
e8(d){if(!(d.b instanceof A.uL))d.b=new A.uL(!1,null,null)},
sa_B(d){var x,w,v=this
if(v.af===d)return
x=B.v(d)
w=B.v(v.af)
if(x!==w)v.a4()
v.af=d},
qs(d){var x=d.b
x.toString
x=y.t.a(x).w
x.toString
return x},
bi(){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2,a3,a4,a5,a6=this,a7=null,a8=y.z.a(B.n.prototype.gS.call(a6)),a9=a6.y1
a9.R8=!1
x=a8.d
w=x+a8.z
v=w+a8.Q
u=a6.af.L0(a8)
t=u.b
s=t>1e-10?u.a*C.c.jV(w,t):0
r=isFinite(v)?u.a_k(v):a7
if(a6.aa$!=null){q=a6.alK(s)
a6.ux(q,r!=null?a6.alN(r):0)}else a6.ux(0,0)
p=u.C_(s)
if(a6.aa$==null)if(!a6.Um(s,p.a)){o=u.Vd(a9.guv())
a6.dy=D.ja(a7,!1,a7,a7,o,0,0,0,o,a7)
a9.uN()
return}n=p.a
m=n+p.c
t=a6.aa$
t.toString
t=t.b
t.toString
l=y.c
t=l.a(t).b
t.toString
k=t-1
t=y.t
j=a7
for(;k>=s;--k){i=u.C_(k)
h=i.c
g=a6.aqo(a8.ul(i.d,h,h))
f=g.b
f.toString
t.a(f)
e=i.a
f.a=e
f.w=i.b
if(j==null)j=g
m=Math.max(m,e+h)}if(j==null){h=a6.aa$
h.toString
h.eT(p.a_8(a8))
j=a6.aa$
h=j.b
h.toString
t.a(h)
h.a=n
h.w=p.b}h=j.b
h.toString
h=l.a(h).b
h.toString
k=h+1
h=B.l(a6).i("af.1")
f=r!=null
for(;;){if(!(!f||k<=r)){d=!1
break}i=u.C_(k)
e=i.c
a0=a8.ul(i.d,e,e)
a1=j.b
a1.toString
g=h.a(a1).an$
if(g!=null){a1=g.b
a1.toString
a1=l.a(a1).b
a1.toString
a1=a1!==k}else a1=!0
if(a1){g=a6.aqn(a0,j)
if(g==null){d=!0
break}}else g.eT(a0)
a1=g.b
a1.toString
t.a(a1)
a2=i.a
a1.a=a2
a1.w=i.b
m=Math.max(m,a2+e);++k
j=g}t=a6.cA$
t.toString
t=t.b
t.toString
t=l.a(t).b
t.toString
a3=d?m:a9.Wf(a8,s,t,n,m)
a4=a6.us(a8,Math.min(x,n),m)
a5=a6.za(a8,n,m)
a6.dy=D.ja(a5,a3>a4||x>0||a8.f!==0,a7,a7,a3,0,a4,0,a3,a7)
if(a3===m)a9.R8=!0
a9.uN()}}
A.KO.prototype={
UP(d){return new A.OL(this.to,this.x1,null)}}
A.OL.prototype={
aD(d){var x=new A.Nz(this.f,y.v.a(d),B.w(y.e,y.g),0,null,null,B.a7())
x.aA()
return x},
aK(d,e){e.sa_B(this.f)},
Il(d,e,f,g,h){var x
this.a2Y(d,e,f,g,h)
x=this.f.L0(d).Vd(this.d.gqI())
return x}}
var z=a.updateTypes([]);(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.E,[A.agc,A.agd,A.aga])
w(A.age,A.agd)
w(A.agb,A.aga)
w(A.uL,D.eT)
w(A.Nz,D.na)
w(A.KO,D.xA)
w(A.OL,D.lz)})()
B.dy(b.typeUniverse,JSON.parse('{"uL":{"eT":[],"ly":[],"ds":["u"],"iT":[],"cn":[]},"Nz":{"na":[],"c4":[],"af":["u","eT"],"n":[],"aa":[],"af.1":"eT","af.0":"u"},"KO":{"a5":[],"e":[]},"OL":{"lz":[],"ab":[],"e":[]}}'))
var y={x:B.V("m<t>"),g:B.V("u"),z:B.V("h0"),t:B.V("uL"),v:B.V("qm"),c:B.V("eT"),e:B.V("r")};(function constants(){E.fF=new A.agb()
E.Gs=new B.bT(57616,"MaterialIcons",!1)
E.GT=new B.dZ(E.Gs,null,G.fX,null,null)
E.fK=new B.f_(C.O,null,null,E.GT,null)})()};
(a=>{a["eqQjkfkmMfaVAWV6hCXq4YBITkg="]=a.current})($__dart_deferred_initializers__);