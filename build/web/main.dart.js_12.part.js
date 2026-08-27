((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,B,C,A={
aEJ(d,e,f){var x,w,v,u,t
if(f<=C.b.ga1(e))return C.b.ga1(d)
if(f>=C.b.gar(e))return C.b.gar(d)
x=C.b.ar3(e,new A.atF(f))
w=d[x]
v=x+1
u=d[v]
t=e[x]
t=B.x(w,u,(f-t)/(e[v]-t))
t.toString
return t},
aRb(d,e,f,g,h){var x,w,v=D.ago(null,null,y.b)
v.U(0,e)
v.U(0,g)
x=B.a0(v,v.$ti.c)
x.$flags=1
w=x
x=B.a3(w).i("a8<1,B>")
x=B.a0(new B.a8(w,new A.atb(d,e,f,g,h),x),x.i("aq.E"))
x.$flags=1
return new A.aki(x,w)},
aAV(d,e,f){var x,w,v,u,t
if(d==e)return d
if(d==null)return e.aO(f)
if(e==null)return d.aO(1-f)
x=A.aRb(d.a,d.EP(),e.a,e.EP(),f)
w=B.rt(d.d,e.d,f)
w.toString
v=B.rt(d.e,e.e,f)
v.toString
u=f<0.5
t=u?d.f:e.f
u=u?d.c:e.c
return new A.jV(w,v,t,x.a,x.b,u)},
aki:function aki(d,e){this.a=d
this.b=e},
atF:function atF(d){this.a=d},
atb:function atb(d,e,f,g,h){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h},
a5a:function a5a(){},
jV:function jV(d,e,f,g,h,i){var _=this
_.d=d
_.e=e
_.f=f
_.a=g
_.b=h
_.c=i},
a6Z:function a6Z(d){this.a=d}},D
J=c[1]
B=c[0]
C=c[2]
A=a.updateHolder(c[18],A)
D=c[32]
A.aki.prototype={}
A.a5a.prototype={
EP(){var x,w,v,u=this.b
if(u!=null)return u
u=this.a.length
x=1/(u-1)
w=J.aAH(u,y.b)
for(v=0;v<u;++v)w[v]=v*x
return w}}
A.jV.prototype={
Vz(d,e){var x=this,w=x.d.P(e).ZW(d),v=x.e.P(e).ZW(d),u=x.EP()
return B.avL(w,v,x.a,u,x.f,null)},
aO(d){var x=this,w=x.a,v=B.a3(w).i("a8<1,B>")
w=B.a0(new B.a8(w,new A.a6Z(d),v),v.i("aq.E"))
return new A.jV(x.d,x.e,x.f,w,x.b,x.c)},
WQ(d){var x=this
return new A.jV(x.d,x.e,x.f,B.bv(x.a.length,d,!1,y.o),x.b,x.c)},
cT(d,e){var x=A.aAV(d,this,e)
return x},
cU(d,e){var x=A.aAV(this,d,e)
return x},
j(d,e){var x=this
if(e==null)return!1
if(x===e)return!0
if(J.M(e)!==B.v(x))return!1
return e instanceof A.jV&&e.d.j(0,x.d)&&e.e.j(0,x.e)&&e.f===x.f&&B.cf(e.a,x.a)&&B.cf(e.b,x.b)},
gC(d){var x=this,w=B.bq(x.a),v=x.b
v=v==null?null:B.bq(v)
return B.J(x.d,x.e,x.f,x.c,w,v,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a,C.a)},
k(d){var x=this,w=B.b(["begin: "+x.d.k(0),"end: "+x.e.k(0),"colors: "+B.j(x.a)],y.h),v=x.b
if(v!=null)w.push("stops: "+B.j(v))
w.push("tileMode: "+x.f.k(0))
return"LinearGradient("+C.b.bk(w,", ")+")"}}
var z=a.updateTypes([])
A.atF.prototype={
$1(d){return d<=this.a},
$S:501}
A.atb.prototype={
$1(d){var x=this,w=B.x(A.aEJ(x.a,x.b,d),A.aEJ(x.c,x.d,d),x.e)
w.toString
return w},
$S:502}
A.a6Z.prototype={
$1(d){var x=B.x(null,d,this.a)
x.toString
return x},
$S:70};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.E,[A.aki,A.a5a])
x(B.d3,[A.atF,A.atb,A.a6Z])
w(A.jV,A.a5a)})()
var y={o:B.V("B"),h:B.V("m<t>"),b:B.V("z")}};
(a=>{a["FtDGRXs5GMgiIMIj9CswcCnEvkw="]=a.current})($__dart_deferred_initializers__);