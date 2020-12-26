'Posiciones iniciales en unidades astronomicas
xT0 = 1!
xM0 = 1.523
xJ0 = 5.202
xS0 = 9.536

yT0 = 0!
yM0 = 0!
yJ0 = 0!
yS0 = 0!

'Velocidades en cada coordenada

vxT0 = 0!
vxM0 = 0!
vxJ0 = 0!
vxS0 = 0!

vyT0 = -1!
vyM0 = -.80849
vyJ0 = -.43881
vyS0 = -.03247

'Tiempo inicial
t = 0!

'Calculo de energias inicial

rT = SQR(xT0 * xT0 + yT0 * yT0)
rM = SQR(xM0 * xM0 + yM0 * yM0)
rJ = SQR(xJ0 * xJ0 + yJ0 * yJ0)
rS = SQR(xS0 * xS0 + yS0 * yS0)

ekinT = .5 * dmasaT * (vxT * vxT + vyT * vyT)
ekinM = .5 * dmasaM * (vxM * vxM + vyM * vyM)
ekinJ = .5 * dmasaJ * (vxJ * vxJ + vyJ * vyJ)
ekinS = .5 * dmasaS * (vxS * vxS + vyS * vyS)

epotT = -dk / rT
epotM = -dk / rM
epotJ = -dk / rJ
epotS = -dk / rS

etotT0 = ekinT + epotT
etotM0 = ekinM + epotM
etotJ0 = ekinJ + epotJ
etotS0 = ekinS + epotS

LOCATE 1, 1
PRINT "Planeta Distancia E. inicial E. final ";
LOCATE 3, 1
PRINT USING "Tierra     ###.##     ###.##   ###.##"; rT; etotT0; 0
PRINT USING "Marte      ###.##     ###.##   ###.##"; rM; etotM0; 0
PRINT USING "Jupiter    ###.##     ###.##   ###.##"; rJ; etotJ0; 0
PRINT USING "Saturno    ###.##     ###.##   ###.##"; rS; etotS0; 0

CIRCLE (320, 175), 5, 14
PAINT (320, 175), 14, 14
