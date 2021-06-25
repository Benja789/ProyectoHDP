# -*- coding: utf-8 -*-
"""
Created on Sat Jun 19 19:52:56 2021

@author: wal
"""

def generacion_modelo(nombre_zona,fob, unl_87,unl_93,butano, flete_marino, margen_mayorista, margen_minorista):
    """
    PC = PCIF + CI + FL + MM + MMin + T
    
        PCIF = PFOB + AC + FM + PT + SM
    """ 
    #Variables de control
    i = 0
    j = 0

    #Varaibles de entrada
    zona=nombre_zona
    pfob=fob
    unl87=unl_87
    unl93=unl_93
    butane =butano
    fm=flete_marino
    mm=margen_mayorista
    mmin=margen_minorista
    #Variables de control

    PC =[0,0,0]
    pfob= pfob/42

    # Precio CIF para cada producto
    pcif = [0,0,0]

    # Seguro maritimo
    sm = 0.0375 * (pfob+fm)

    #Perdidas de transito
    pt = 0.13 * (pfob+fm+sm)

    # Ajuste de calidad por tipo de combustible
    ac = [0,0,0]

    ac[0] = (0.28*(unl87 - butane)) + (((unl87 - unl93)/6)*4) # Especial
    ac[1] = (0.28*(unl87 - butane)) + (((unl87 - unl93)/6)*2) # Regular
    ac[2] = 1.913                                             # Diesel

    #Flete local con orden en zonas [Central, Occidental, Oriental] (Hasta 2019)
    #fl = [0.036,0.044,0.074] 
    fl=0

    #Costos de internacion 
    ci = 0.03

    #Tributos (impuestos asociados al combustible)
    t = [0,0,0]
    t[0] = float(0.20 + 0.10 + 0.1591)
    t[1] = t[0]
    t[2] = float(0.20 + 0.10)

    if zona =="Zona Central":
        fl=0.036
    elif zona== "ZOCC":
        fl=0.44
    elif zona=="ZORI":
        fl=0.074

    for i in range(3):
        pcif[i] = (pfob) + ac[i] + fm + pt + sm
        pc = (pcif[i] + ci + fl + mm + mmin + t[i])
        PC [i] = pc + (pc*0.13)


    return PC