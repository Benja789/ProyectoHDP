(this.webpackJsonptemplates=this.webpackJsonptemplates||[]).push([[0],{100:function(e,a,t){},130:function(e,a,t){"use strict";t.r(a);var i=t(0),n=t.n(i),c=t(11),r=t.n(c),l=(t(99),t(100),t(39)),s=t(15),o=t(9),j=t.n(o),b=t(19),d=t(14),h=t(30),x=t(83),O=t(45),p=t.n(O),u=t(184),g=t(54),m=t(161),f=t(175),v=t(176),y=t(172),N=t(185),D=t(177),w=t(163),C=t(165),z=t(166),S=t(85),k=t(167),E=t(168),F=t(169),M=t(170),I=t(171),B=t(2),G=Object(m.a)({root:{display:"block",padding:"6px"},div:{display:"inline-block",width:"30%",padding:"6px"},bullet:{display:"inline-block",margin:"0 2px",transform:"scale(0.8)"},title:{fontSize:14},pos:{marginBottom:12},table:{minWidth:"25%"}}),P=function(e){var a=G(),t=new Date(e.zona.inicio),i=new Date(e.zona.fin),n=["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];return Object(B.jsx)("div",{className:a.div,children:Object(B.jsx)(w.a,{className:a.root,children:Object(B.jsxs)(C.a,{children:[Object(B.jsxs)(g.a,{className:a.title,color:"textSecondary",gutterBottom:!0,children:[t.getDate()," ",n[t.getMonth()]," ",t.getFullYear()," a"," "+i.getDate()," ",n[i.getMonth()]," ",i.getFullYear()]}),Object(B.jsxs)(g.a,{variant:"h5",component:"h2",children:["Zona ",e.zona.nombrezona]}),Object(B.jsx)(g.a,{className:a.pos,color:"textSecondary",children:"Tipo de gasolina"}),Object(B.jsx)(z.a,{component:S.a,children:Object(B.jsxs)(k.a,{className:a.table,"aria-label":"simple table",children:[Object(B.jsx)(E.a,{children:Object(B.jsxs)(F.a,{children:[Object(B.jsx)(M.a,{children:"Tipo"}),Object(B.jsx)(M.a,{align:"left",children:"Precio"}),Object(B.jsx)(M.a,{align:"left",children:"Variacion"})]})}),Object(B.jsxs)(I.a,{children:[Object(B.jsxs)(F.a,{children:[Object(B.jsx)(M.a,{align:"left",children:"Especial"}),Object(B.jsxs)(M.a,{align:"left",children:["$ ",e.zona.especial,"  "]}),Object(B.jsxs)(M.a,{align:"left",children:["$ ",e.zona.variacion_e]})]},e.zona.idzona),Object(B.jsxs)(F.a,{children:[Object(B.jsx)(M.a,{align:"left",children:"Regular"}),Object(B.jsxs)(M.a,{align:"left",children:["$ ",e.zona.regular]}),Object(B.jsxs)(M.a,{align:"left",children:["$ ",e.zona.variacion_r]})]},e.zona.idzona),Object(B.jsxs)(F.a,{children:[Object(B.jsx)(M.a,{align:"left",children:"Disiel"}),Object(B.jsxs)(M.a,{align:"left",children:["$ ",e.zona.diesel]}),Object(B.jsxs)(M.a,{align:"left",children:["$ ",e.zona.variacion_d]})]},e.zona.idzona)]})]})})]})})})},R=t(81),T=t(174),Z=Object(m.a)({table:{minWidth:650},button:{display:"block",position:"absolute",width:"40%",right:"20px",top:"150px"}}),$=function(e){var a=Z(),t=e.prediccion,c=e.periodo,r=n.a.useState(1),l=Object(d.a)(r,2),s=l[0],o=(l[1],["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"]),h=Object(i.useState)(null),x=Object(d.a)(h,2),O=x[0],u=x[1],m=function(){var a=Object(b.a)(j.a.mark((function a(t){var i;return j.a.wrap((function(a){for(;;)switch(a.prev=a.next){case 0:(i=new FormData).append("idperiodo",c[t].idperiodo),i.append("fechainicio",c[t].fechainicio),i.append("fechafin",c[IDBIndex].fechafin),p()({method:"POST",url:e.url+"/jsonhistorial",data:c[t]});case 5:case"end":return a.stop()}}),a)})));return function(e){return a.apply(this,arguments)}}(),f=function(e,a){u(null),m()};return Object(B.jsxs)("div",{children:[Object(B.jsx)(g.a,{variant:"h5",children:"Tabla del historial de los precios"}),Object(B.jsx)(y.a,{className:a.button,"aria-controls":"simple-menu","aria-haspopup":"true",onClick:function(e){u(e.currentTarget)},children:"Selecciona Periodo"}),Object(B.jsx)(R.a,{id:"simple-menu",anchorEl:O,keepMounted:!0,open:Boolean(O),onClose:f,children:c.map((function(e,a){return Object(B.jsxs)(T.a,{selected:a===s,onClick:function(e){m(e,a),f()},children:[new Date(e.fechainicio).getDate()+" "+o[new Date(e.fechainicio).getMonth()]+" "+new Date(e.fechainicio).getFullYear()," -"," "+new Date(e.fechafin).getDate()+" "+o[new Date(e.fechafin).getMonth()]+" "+new Date(e.fechafin).getFullYear()]},e.idperiodo)}))}),Object(B.jsx)(z.a,{component:S.a,children:Object(B.jsxs)(k.a,{className:a.table,"aria-label":"simple table",children:[Object(B.jsx)(E.a,{children:Object(B.jsxs)(F.a,{children:[Object(B.jsx)(M.a,{children:"Fecha Inicio"}),Object(B.jsx)(M.a,{align:"left",children:"Fecha Fin"}),Object(B.jsx)(M.a,{align:"left",children:"Zona"}),Object(B.jsx)(M.a,{align:"left",children:"Tipo Combusitible"}),Object(B.jsx)(M.a,{align:"right",children:"Precio"}),Object(B.jsx)(M.a,{align:"right",children:"Variacion"})]})}),Object(B.jsx)(I.a,{children:t.map((function(e){return Object(B.jsxs)(F.a,{children:[Object(B.jsxs)(M.a,{align:"left",children:[new Date(e.fechainicio).getDate()," ",o[new Date(e.fechainicio).getMonth()]," ",new Date(e.fechainicio).getFullYear()]}),Object(B.jsxs)(M.a,{align:"left",children:[new Date(e.fechafin).getDate()," ",o[new Date(e.fechafin).getMonth()]," ",new Date(e.fechafin).getFullYear()]}),"ZORI"===e.idzona_id&&Object(B.jsx)(M.a,{align:"left",children:"Oriental"}),"ZOCC"===e.idzona_id&&Object(B.jsx)(M.a,{align:"left",children:"Occidental"}),"ZCEN"===e.idzona_id&&Object(B.jsx)(M.a,{align:"left",children:"Central"}),"DI03"===e.idgasolina_id&&Object(B.jsx)(M.a,{align:"left",children:"Disiel"}),"RE02"===e.idgasolina_id&&Object(B.jsx)(M.a,{align:"left",children:"Regular"}),"ES01"===e.idgasolina_id&&Object(B.jsx)(M.a,{align:"left",children:"Super"}),Object(B.jsxs)(M.a,{align:"right",children:["$ ",e.precio]}),e.variacion>0&&Object(B.jsxs)(M.a,{style:{color:"#B03A2E"},align:"right",children:["$ ",e.variacion]}),e.variacion<0&&Object(B.jsxs)(M.a,{style:{color:"#1D8348"},align:"right",children:["$ ",e.variacion]}),0===e.variacion&&Object(B.jsx)(M.a,{align:"right",children:e.variacion})]},e.idprediccion)}))})]})})]})},_=t.p+"static/media/MapaSalvadorZonas.dd82f534.png",A=["children","value","index"];function W(e){var a=e.children,t=e.value,i=e.index,n=Object(x.a)(e,A);return Object(B.jsx)("div",Object(h.a)(Object(h.a)({role:"tabpanel",hidden:t!==i,id:"simple-tabpanel-".concat(i),"aria-labelledby":"simple-tab-".concat(i)},n),{},{children:t===i&&Object(B.jsx)(u.a,{p:3,children:Object(B.jsx)(g.a,{children:a})})}))}function J(e){return{id:"simple-tab-".concat(e),"aria-controls":"simple-tabpanel-".concat(e)}}var Y=Object(m.a)((function(e){return{root:{flexGrow:1,backgroundColor:e.palette.background.paper},button:{position:"absolute",width:"10%",right:"50px",top:"25px",background:"#E5ECFF"},media:{display:"block",position:"relative",width:"40%",top:"30%",left:"28%"}}})),q=function(e){var a=Y(),t=Object(i.useState)(0),n=Object(d.a)(t,2),c=n[0],r=n[1],s=Object(i.useState)([]),o=Object(d.a)(s,2),x=o[0],O=o[1],u=Object(i.useState)([]),g=Object(d.a)(u,2),m=g[0],w=g[1],C=Object(i.useState)([]),z=Object(d.a)(C,2),S=z[0],k=z[1],E=function(){var a=Object(b.a)(j.a.mark((function a(){return j.a.wrap((function(a){for(;;)switch(a.prev=a.next){case 0:p.a.get(e.url+"/jsonhistorial").then((function(e){O(e.data)})),p.a.get(e.url+"/jsonperiodo").then((function(e){w(e.data)}));case 2:case"end":return a.stop()}}),a)})));return function(){return a.apply(this,arguments)}}(),F=function(){var a=Object(b.a)(j.a.mark((function a(){return j.a.wrap((function(a){for(;;)switch(a.prev=a.next){case 0:p.a.get(e.url+"/jsonpreciosvigentes").then((function(e){var a=e.data;k(a)}));case 1:case"end":return a.stop()}}),a)})));return function(){return a.apply(this,arguments)}}();Object(i.useEffect)((function(){document.title="Inicio",F()}),[]);return Object(B.jsxs)("div",{className:a.root,children:[Object(B.jsxs)(f.a,{position:"static",style:{background:"#303F9F"},children:[Object(B.jsxs)(v.a,{className:a.toolbar,children:[Object(B.jsx)("h1",{className:a.h1,align:"center",children:"Precios de los combustibles El Salvador"}),Object(B.jsx)(l.b,{to:"/login",children:Object(B.jsx)(y.a,{className:a.button,variant:"contained",children:"Iniciar sesion"})}),Object(B.jsx)("hr",{})]}),Object(B.jsxs)(N.a,{value:c,onChange:function(e,a){r(a)},"aria-label":"simple tabs example",align:"center",children:[Object(B.jsx)(D.a,Object(h.a)({label:"Precios por zona"},J(0))),Object(B.jsx)(D.a,Object(h.a)({label:"Historial de precios",onClick:E},J(1))),Object(B.jsx)(D.a,Object(h.a)({label:"Graficos"},J(2)))]})]}),Object(B.jsxs)(W,{value:c,index:0,children:[Object(B.jsx)("img",{className:a.media,src:_,alt:"Mapa de El Salvador"}),Object(B.jsx)("br",{}),Object(B.jsx)("br",{}),void 0!==S[0]&&Object(B.jsx)(P,{zona:S[0]}),void 0!==S[1]&&Object(B.jsx)(P,{zona:S[1]}),void 0!==S[2]&&Object(B.jsx)(P,{zona:S[2]})]}),Object(B.jsx)(W,{value:c,index:1,children:Object(B.jsx)($,{prediccion:x,periodo:m,url:e.url})}),Object(B.jsx)(W,{value:c,index:2,children:"Graficos"})]})},H=t(17),L=t(187),U=t(183),V=t(178),K=t(186),Q=t(82),X=Object(m.a)((function(e){return{root:{width:"350px",display:"inline-block",position:"center"},avatar:{display:"flex",backgroundColor:"#3055a7",margin:e.spacing(4)},title:{display:"block",postion:"right",margin:"-70px 0 0 95px"},button:{display:"flex",margin:e.spacing(3),minWidth:"300px"},div:{position:"absolute",top:"40%",left:"44%",margin:"-100px 0 0 -100px"},textf:{display:"flex",position:"relative",margin:e.spacing(2),minWidth:"300px"},fieldBox:{transform:"scale(0.8)",margin:e.spacing(1)}}})),ee=function(){var e,a,t=X(),n=Object(Q.a)(),c=n.register,r=n.formState.errors,s=n.handleSubmit,o=Object(i.useState)({nombre:"","contrase\xf1a":""}),j=Object(d.a)(o,2),b=j[0],x=j[1],O=function(e,a){console.log(e),x([].concat(Object(H.a)(b),Object(H.a)(e)))};return Object(i.useEffect)((function(){document.title="Iniciar sesion"})),Object(B.jsx)("div",{className:t.div,children:Object(B.jsx)(w.a,{className:t.root,children:Object(B.jsxs)("form",{onSubmit:s(O),children:[Object(B.jsx)(L.a,{className:t.avatar}),Object(B.jsx)(g.a,{className:t.title,variant:"h5",children:"Iniciar sesion"}),Object(B.jsx)(U.a,Object(h.a)({className:t.textf,label:"Usuario"},c("usuario",{required:{value:!0,message:"Campo obligatorio"}}))),Object(B.jsx)("p",{children:null===r||void 0===r||null===(e=r.nombre)||void 0===e?void 0:e.message}),Object(B.jsx)(U.a,Object(h.a)({className:t.textf,label:"Contrase\xf1a"},c("contrase\xf1a",{required:{value:!0,message:"Campo obligatorio"}}))),Object(B.jsx)("p",{children:null===r||void 0===r||null===(a=r.nombre)||void 0===a?void 0:a.message}),Object(B.jsx)(V.a,{control:Object(B.jsx)(K.a,{className:t.fieldBox,name:"checkedB",color:"primary"}),label:"Recordar Contrase\xf1a"}),Object(B.jsx)(y.a,{className:t.button,type:"submit",color:"primary",variant:"contained",onClick:O,children:"Ingresar"}),Object(B.jsx)(l.b,{to:"/inicio",children:Object(B.jsx)(y.a,{className:t.button,type:"submit",color:"primary",variant:"contained",children:"Cancelar"})})]})})})},ae=t(179),te=t(173),ie=t(132),ne=t(180),ce=t(181),re=Object(m.a)((function(e){return{root:{main:"#ff3d00"},paper:{padding:20,height:"115vh",width:"90%",margin:"20px auto"},Button:{position:"relative",margin:e.spacing(3)},Contenido:{flexGrow:1},paperData:{padding:e.spacing(1),textAlign:"center",color:e.palette.text.secondary,margin:e.spacing(3)},table:{margin:e.spacing(5),minWidth:600},list:{width:"100%",maxWidth:360,backgroundColor:e.palette.background.paper}}})),le=function(){var e=re(),a=n.a.useState(2),t=Object(d.a)(a,2),i=t[0],c=t[1];function r(e,a,t,i,n){return{name:e,calories:a,fat:t,carbs:i,protein:n}}var l=[r("Frozen yoghurt",159,6,24,4),r("Ice cream sandwich",237,9,37,4.3),r("Eclair",262,16,24,6),r("Cupcake",305,3.7,67,4.3),r("Gingerbread",356,16,49,3.9)];return Object(B.jsxs)(ae.a,{container:"fixed",fullWidth:!0,children:[Object(B.jsx)(f.a,{color:"primary",position:"static",children:Object(B.jsxs)(g.a,{variant:"h4",className:e.title,children:[Object(B.jsx)(L.a,{className:e.avatar}),"Historial de Usuarios"]})}),Object(B.jsxs)("div",{className:e.Button,children:[Object(B.jsx)(y.a,{variant:"contained",color:"primary",children:"Ingresar Precio "}),Object(B.jsx)(y.a,{variant:"contained",color:"primary",children:"Salir "})]}),Object(B.jsxs)(S.a,{className:e.paper,elevation:10,children:[Object(B.jsx)(ae.a,{children:Object(B.jsx)(S.a,{square:!0,children:Object(B.jsxs)(N.a,{value:i,indicatorColor:"primary",textColor:"primary",onChange:function(e,a){c(a)},"aria-label":"disabled tabs example",children:[Object(B.jsx)(D.a,{label:"Modelo Calculado"}),Object(B.jsx)(D.a,{label:"Graficos"})]})})}),Object(B.jsxs)("div",{className:e.Contenido,children:[Object(B.jsxs)(ae.a,{container:!0,spacing:3,children:[Object(B.jsx)(ae.a,{item:!0,xs:!0,children:Object(B.jsxs)(S.a,{className:e.paperData,children:["Zona Occidental",Object(B.jsxs)(te.a,{component:"nav",className:e.list,"aria-label":"mailbox folders",children:[Object(B.jsx)(ie.a,{button:!0,children:Object(B.jsx)(ne.a,{primary:"Diesel"})}),Object(B.jsx)(ce.a,{}),Object(B.jsx)(ie.a,{button:!0,divider:!0,children:Object(B.jsx)(ne.a,{primary:"Gasolina Regular"})}),Object(B.jsx)(ie.a,{button:!0,children:Object(B.jsx)(ne.a,{primary:"Gasolina Especial"})}),Object(B.jsx)(ce.a,{light:!0})]})]})}),Object(B.jsx)(ae.a,{item:!0,xs:!0,children:Object(B.jsxs)(S.a,{className:e.paperData,children:["Zona Central",Object(B.jsxs)(te.a,{component:"nav",className:e.list,"aria-label":"mailbox folders",children:[Object(B.jsx)(ie.a,{button:!0,children:Object(B.jsx)(ne.a,{primary:"Diesel"})}),Object(B.jsx)(ce.a,{}),Object(B.jsx)(ie.a,{button:!0,divider:!0,children:Object(B.jsx)(ne.a,{primary:"Gasolina Regular"})}),Object(B.jsx)(ie.a,{button:!0,children:Object(B.jsx)(ne.a,{primary:"Gasolina Especial"})}),Object(B.jsx)(ce.a,{light:!0})]})]})}),Object(B.jsx)(ae.a,{item:!0,xs:!0,children:Object(B.jsxs)(S.a,{className:e.paperData,children:["Zona Oriental",Object(B.jsxs)(te.a,{component:"nav",className:e.list,"aria-label":"mailbox folders",children:[Object(B.jsx)(ie.a,{button:!0,children:Object(B.jsx)(ne.a,{primary:"Diesel"})}),Object(B.jsx)(ce.a,{}),Object(B.jsx)(ie.a,{button:!0,divider:!0,children:Object(B.jsx)(ne.a,{primary:"Gasolina Regular"})}),Object(B.jsx)(ie.a,{button:!0,children:Object(B.jsx)(ne.a,{primary:"Gasolina Especial"})}),Object(B.jsx)(ce.a,{light:!0})]})]})})]}),Object(B.jsx)(ae.a,{container:!0,spacing:3})]}),Object(B.jsxs)("div",{className:e.Contenido,children:[Object(B.jsx)("h4",{children:"Historial de Ajuste"}),Object(B.jsx)(z.a,{component:S.a,children:Object(B.jsxs)(k.a,{className:e.table,size:"small","aria-label":"a dense table",children:[Object(B.jsx)(E.a,{children:Object(B.jsxs)(F.a,{children:[Object(B.jsx)(M.a,{children:"Dessert (100g serving)"}),Object(B.jsx)(M.a,{align:"right",children:"Calories"}),Object(B.jsx)(M.a,{align:"right",children:"Fat\xa0(g)"}),Object(B.jsx)(M.a,{align:"right",children:"Carbs\xa0(g)"}),Object(B.jsx)(M.a,{align:"right",children:"Protein\xa0(g)"})]})}),Object(B.jsx)(I.a,{children:l.map((function(e){return Object(B.jsxs)(F.a,{children:[Object(B.jsx)(M.a,{component:"th",scope:"row",children:e.name}),Object(B.jsx)(M.a,{align:"right",children:e.calories}),Object(B.jsx)(M.a,{align:"right",children:e.fat}),Object(B.jsx)(M.a,{align:"right",children:e.carbs}),Object(B.jsx)(M.a,{align:"right",children:e.protein})]},e.name)}))})]})})]}),Object(B.jsxs)("div",{className:e.Button,children:[Object(B.jsx)(y.a,{variant:"contained",color:"primary",children:"Crear Modelos"}),Object(B.jsx)(y.a,{variant:"contained",color:"primary",children:"Eliminar Entradas"})]})]})]})},se=t(182),oe=Object(m.a)((function(e){return{root:{display:"flex",alignItems:"center"},circular:{position:"absolute",top:"50%",left:"50%",margin:"-25px 0 0 -25px"},wrapper:{margin:e.spacing(1),position:"relative"}}}));function je(){var e=oe(),a=Object(i.useState)(!1),t=Object(d.a)(a,2),n=t[0],c=t[1],r=Object(i.useState)(!1),l=Object(d.a)(r,2),o=l[0],j=l[1],b=Object(i.useRef)();Object(i.useEffect)((function(){h()}));var h=function(){n||(c(!0),b.current=setTimeout((function(){c(!1),j(!0)}),500))};return Object(B.jsxs)("div",{className:e.root,children:[n&&Object(B.jsx)(se.a,{className:e.circular}),o&&Object(B.jsx)(s.a,{to:"/inicio"})]})}var be=function(){return Object(B.jsx)(l.a,{children:Object(B.jsx)("div",{children:Object(B.jsxs)(s.d,{children:[Object(B.jsx)(s.b,{exact:!0,path:"/",children:Object(B.jsx)(je,{})}),Object(B.jsx)(s.b,{exact:!0,path:"/inicio",children:Object(B.jsx)(q,{url:"http://localhost:8000"})}),Object(B.jsx)(s.b,{exact:!0,path:"/login",children:Object(B.jsx)(ee,{})}),Object(B.jsx)(s.b,{exact:!0,path:"/usuario",children:Object(B.jsx)(le,{})})]})})})},de=function(e){e&&e instanceof Function&&t.e(3).then(t.bind(null,189)).then((function(a){var t=a.getCLS,i=a.getFID,n=a.getFCP,c=a.getLCP,r=a.getTTFB;t(e),i(e),n(e),c(e),r(e)}))};r.a.render(Object(B.jsx)(n.a.StrictMode,{children:Object(B.jsx)(be,{})}),document.getElementById("root")),de()},99:function(e,a,t){}},[[130,1,2]]]);
//# sourceMappingURL=main.8484a605.chunk.js.map