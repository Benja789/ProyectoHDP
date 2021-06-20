# -*- coding: utf-8 -*-
"""
Created on Sat Jun 19 19:52:56 2021

@author: wal
"""



"""
 PC = PCIF + CI + FL + MM + MMin + T
 
     PCIF = PFOB + AC + FM + PT + SM
""" 
#Variables de control
i = 0
j = 0

#Varaibles de entrada

pfob = float(input("Ingrese el precio del FOB : "))
unl87 = float(input("Ingrese el precio promedio de 6 meses del Platt´s UNL-87 : "))
unl93 = float(input("Ingrese el precio promedio de 6 meses del Platt´s UNL-93 : "))
butane = float(input("Ingrese el precio promedio de 6 meses Platt´s butano normal Mt.Belvieu : "))
fm = float(input("Ingrese el el monto del flete maritimo : "))
mm = float(input("Ingrese el el monto del margen mayorista : "))
mmin = float(input("Ingrese el el monto del margen minorista : "))

#Precio del consumidor con la forma

#     [Especial, Regular, Diesel]
PC = [[    0   ,    0   ,   0   ],   # Zona central
      [    0   ,    0   ,   0   ],   # Zona occidental
      [    0   ,    0   ,   0   ]]  # Zona oriental
      
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
fl = [0.036,0.044,0.074] 

#Costos de internacion 
ci = 0.03

#Tributos (impuestos asociados al combustible)
t = [0,0,0]
t[0] = float(0.20 + 0.10 + 0.1591)
t[1] = t[0]
t[2] = float(0.20 + 0.10)


for i in range(3):
    
    for j in range(3):
        pcif[j] = (pfob) + ac[j] + fm + pt + sm
        pc = (pcif[j] + ci + fl[i] + mm + mmin + t[j])
        PC [i][j] = pc + (pc*0.13)

print(PC)   
    
    
    
    