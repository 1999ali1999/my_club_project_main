((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var A,C,B={
aAe(d){var x,w,v=A.e0()
for(x=d.length-1;x>0;--x){w=d[x]
if(w!=null)w.qj(d[x-1],v)}return v},
a4z(d,e,f,g){var x,w
if(d==null||e==null)return null
if(d===e)return d
x=d.z
w=e.z
if(x<w){g.push(e.r)
return B.a4z(d,e.r,f,g)}else if(x>w){f.push(d.r)
return B.a4z(d.r,e,f,g)}f.push(d.r)
g.push(e.r)
return B.a4z(d.r,e.r,f,g)},
tB:function tB(){this.d=this.a=null},
z3:function z3(d,e,f,g,h,i){var _=this
_.k3=d
_.k4=e
_.ok=f
_.p1=g
_.p4=_.p3=_.p2=null
_.R8=!0
_.ay=_.ax=null
_.a=h
_.b=0
_.e=i
_.f=0
_.r=null
_.w=!0
_.y=_.x=null
_.z=0
_.as=_.Q=null},
Nn:function Nn(d,e,f,g){var _=this
_.t=d
_.N=null
_.v$=e
_.dy=f
_.b=_.fy=null
_.c=0
_.y=_.d=null
_.z=!0
_.Q=null
_.as=!1
_.at=null
_.ay=$
_.ch=g
_.CW=!1
_.cx=$
_.cy=!0
_.db=!1
_.dx=$},
Nj:function Nj(d,e,f,g,h,i,j,k){var _=this
_.t=d
_.N=e
_.a8=f
_.bf=g
_.bA=h
_.v$=i
_.dy=j
_.b=_.fy=null
_.c=0
_.y=_.d=null
_.z=!0
_.Q=null
_.as=!1
_.at=null
_.ay=$
_.ch=k
_.CW=!1
_.cx=$
_.cy=!0
_.db=!1
_.dx=$},
act:function act(d){this.a=d},
avf(d,e,f,g){return new B.Js(e,g,f,d,null)},
oz:function oz(d,e,f){this.e=d
this.c=e
this.a=f},
Js:function Js(d,e,f,g,h){var _=this
_.e=d
_.f=e
_.x=f
_.c=g
_.a=h},
t0(d){var x=d.ap(y.n),w=x==null?null:x.w.c
return(w==null?C.c1:w).cl(d)},
a5e(){var x=0,w=A.Q(y.v)
var $async$a5e=A.R(function(d,e){if(d===1)return A.N(e,w)
for(;;)switch(x){case 0:x=2
return A.L(C.aO.cF("HapticFeedback.vibrate","HapticFeedbackType.selectionClick",y.v),$async$a5e)
case 2:return A.O(null,w)}})
return A.P($async$a5e,w)}},E,D
A=c[0]
C=c[2]
B=a.updateHolder(c[14],B)
E=c[71]
D=c[59]
B.tB.prototype={
Rg(d){this.a=d},
Td(d){if(this.a===d)this.a=null},
k(d){var x=A.bd(this),w=this.a!=null?"<linked>":"<dangling>"
return"<optimized out>#"+x+"("+w+")"}}
B.z3.prototype={
G9(d){var x,w,v,u,t=this
if(t.R8){x=t.L_()
x.toString
t.p4=A.px(x)
t.R8=!1}if(t.p4==null)return null
w=new A.lJ(new Float64Array(4))
w.LF(d.a,d.b,0,1)
x=t.p4.ab(w).a
v=x[0]
u=t.p1
return new A.h(v-u.a,x[1]-u.b)},
hE(d,e,f,g){var x,w=this
if(w.k3.a==null){if(w.k4)return w.lW(d,e.Y(0,w.ok),!0,g)
return!1}x=w.G9(e)
if(x==null)return!1
return w.lW(d,x,!0,g)},
L_(){var x,w
if(this.p3==null)return null
x=this.p2
w=A.pw(-x.a,-x.b,0)
x=this.p3
x.toString
w.dQ(x)
return w},
a8L(){var x,w,v,u,t,s,r=this
r.p3=null
x=r.k3.a
if(x==null)return
w=y.A
v=A.b([x],w)
u=A.b([r],w)
B.a4z(x,r,v,u)
t=B.aAe(v)
x.qj(null,t)
w=r.p1
t.dK(w.a,w.b,0,1)
s=B.aAe(u)
if(s.fY(s)===0)return
s.dQ(t)
r.p3=s
r.R8=!0},
gqg(){return!0},
hx(d){var x,w,v=this
if(v.k3.a==null&&!v.k4){v.p2=v.p3=null
v.R8=!0
v.sfE(null)
return}v.a8L()
x=v.p3
w=y.y
if(x!=null){v.p2=v.ok
v.sfE(d.vU(x.a,w.a(v.x)))
v.iL(d)
d.ei()}else{v.p2=null
x=v.ok
v.sfE(d.vU(A.pw(x.a,x.b,0).a,w.a(v.x)))
v.iL(d)
d.ei()}v.R8=!0},
qj(d,e){var x=this.p3
if(x!=null)e.dQ(x)
else{x=this.ok
e.dQ(A.pw(x.a,x.b,0))}}}
B.Nn.prototype={
soM(d){var x=this,w=x.t
if(w===d)return
w.d=null
x.t=d
w=x.N
if(w!=null)d.d=w
x.aw()},
gjl(){return!0},
bi(){var x=this
x.nA()
x.N=x.gu()
x.t.d=x.gu()},
aC(d,e){var x=this.ch,w=x.a,v=this.t
if(w==null)x.saF(A.a6Y(v,e))
else{y.t.a(w)
w.soM(v)
w.sit(e)}x=x.a
x.toString
d.lA(x,A.ez.prototype.geh.call(this),C.f)}}
B.Nj.prototype={
soM(d){if(this.t===d)return
this.t=d
this.aw()},
sa0w(d){if(this.N===d)return
this.N=d
this.aw()},
sit(d){if(this.a8.j(0,d))return
this.a8=d
this.aw()},
sar5(d){if(this.bf.j(0,d))return
this.bf=d
this.aw()},
saoM(d){if(this.bA.j(0,d))return
this.bA=d
this.aw()},
a9(){this.ch.saF(null)
this.kT()},
gjl(){return!0},
KU(){var x=y.s.a(A.n.prototype.gaF.call(this))
x=x==null?null:x.L_()
return x==null?A.e0():x},
ce(d,e){if(this.t.a==null&&!this.N)return!1
return this.cE(d,e)},
cE(d,e){return d.GH(new B.act(this),e,this.KU())},
aC(d,e){var x,w=this,v=w.t.d,u=v==null?w.a8:w.bf.yW(v).Y(0,w.bA.yW(w.gu())).T(0,w.a8),t=y.s
if(t.a(A.n.prototype.gaF.call(w))==null)w.ch.saF(new B.z3(w.t,w.N,e,u,A.w(y.e,y.k),A.a7()))
else{x=t.a(A.n.prototype.gaF.call(w))
if(x!=null){x.k3=w.t
x.k4=w.N
x.p1=u
x.ok=e}}t=t.a(A.n.prototype.gaF.call(w))
t.toString
d.r9(t,A.ez.prototype.geh.call(w),C.f,E.OH)},
cN(d,e){e.dQ(this.KU())}}
B.oz.prototype={
aD(d){var x=new B.Nn(this.e,null,new A.aD(),A.a7())
x.aA()
x.saQ(null)
return x},
aK(d,e){e.soM(this.e)}}
B.Js.prototype={
aD(d){var x=new B.Nj(this.e,this.f,this.x,D.de,D.de,null,new A.aD(),A.a7())
x.aA()
x.saQ(null)
return x},
aK(d,e){e.soM(this.e)
e.sa0w(this.f)
e.sit(this.x)
e.sar5(D.de)
e.saoM(D.de)}}
var z=a.updateTypes([])
B.act.prototype={
$2(d,e){return this.a.wN(d,e)},
$S:16};(function inheritance(){var x=a.inherit,w=a.inheritMany
x(B.tB,A.E)
x(B.z3,A.ea)
w(A.j3,[B.Nn,B.Nj])
x(B.act,A.eM)
w(A.aG,[B.oz,B.Js])})()
A.dy(b.typeUniverse,JSON.parse('{"z3":{"ea":[],"dG":[]},"Nn":{"u":[],"ar":["u"],"n":[],"aa":[]},"Nj":{"u":[],"ar":["u"],"n":[],"aa":[]},"oz":{"aG":[],"ab":[],"e":[]},"Js":{"aG":[],"ab":[],"e":[]}}'))
var y={n:A.V("pb"),A:A.V("m<ea>"),t:A.V("zM"),e:A.V("r"),s:A.V("z3?"),y:A.V("ahY?"),v:A.V("~"),k:A.V("~()")};(function constants(){E.OH=new A.p(-1/0,-1/0,1/0,1/0)})()};
(a=>{a["72TmRSppHjLULHUsLXCp5uzwVtA="]=a.current})($__dart_deferred_initializers__);