'Cambio al modo de pantalla grafico
SCREEN 9

'Escala pantalla
ratio = 30

dmasaT = 1!
dmasaM = .107
dmasaJ = 317.898
dmasaS = 95.21896

dk = .1245
deltat = .005
deltat2 = deltat * deltat
'T : Tierra
'M : Marte
'J : Jupiter
'S : Saturno

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


'Bucle principal
WHILE t < 2!


'Distancia de cada planeta

rT = SQR(xT0 * xT0 + yT0 * yT0)
rM = SQR(xM0 * xM0 + yM0 * yM0)
rJ = SQR(xJ0 * xJ0 + yJ0 * yJ0)
rS = SQR(xS0 * xS0 + yS0 * yS0)

'Distancia al cubo
rT3 = rT * rT * rT
rM3 = rM * rM * rM
rJ3 = rJ * rJ * rJ
rS3 = rS * rS * rS

'Fuerza en cada coordenada
'fxT = -dk * xT0 / rT3 ?

fxT = -dk * dmasaT * xT0 / rT3
fxM = -dk * dmasaM * xM0 / rM3
fxJ = -dk * dmasaJ * xJ0 / rJ3
fxS = -dk * dmasaS * xS0 / rS3

fyT = -dk * yT0 / rT3
fyM = -dk * yM0 / rM3
fyJ = -dk * yJ0 / rJ3
fyS = -dk * yS0 / rS3

axT = fxT / dmasaT
axM = fxM / dmasaM
axJ = fxJ / dmasaJ
axS = fxS / dmasaS

ayT = fyT / dmasaT
ayM = fyM / dmasaM
ayJ = fyJ / dmasaJ
ayS = fyS / dmasaS


xT = xT0 + vxT0 * deltat + .5 * axT * deltat2
xM = xM0 + vxM0 * deltat + .5 * axM * deltat2
xJ = xJ0 + vxJ0 * deltat + .5 * axJ * deltat2
xS = xS0 + vxS0 * deltat + .5 * axS * deltat2

yT = yT0 + vyT0 * deltat + .5 * ayT * deltat2
yM = yM0 + vyM0 * deltat + .5 * ayM * deltat2
yJ = yJ0 + vyJ0 * deltat + .5 * ayJ * deltat2
yS = yS0 + vyS0 * deltat + .5 * ayS * deltat2

vxT = vxT0 + axT * deltat
vxM = vxM0 + axM * deltat
vxJ = vxJ0 + axJ * deltat
vxS = vxS0 + axS * deltat

vyT = vyT0 + ayT * deltat
vyS = vyS0 + ayS * deltat
vyM = vyM0 + ayM * deltat
vyJ = vyJ0 + ayJ * deltat


'Guardar las coordenadas

xT0 = xT: yT0 = yT: vxT0 = vxT: vyT0 = vyT
xM0 = xM: yM0 = yM: vxM0 = vxM: vyM0 = vyM
xJ0 = xJ: yJ0 = yJ: vxJ0 = vxJ: vyJ0 = vyJ
xS0 = xS: yS0 = yS: vxS0 = vxS: vyS0 = vyS

ixT = INT(xT0 * ratio) + 320
ixM = INT(xM0 * ratio) + 320
ixJ = INT(xJ0 * ratio) + 320
ixS = INT(xS0 * ratio) + 320

iyT = INT(yT0 * ratio) + 175
iyM = INT(yM0 * ratio) + 175
iyJ = INT(yJ0 * ratio) + 175
iyS = INT(yS0 * ratio) + 175

CIRCLE (ixT, iyT), 1, 9
CIRCLE (ixM, iyM), 1, 4
CIRCLE (ixJ, iyJ), 1, 6
CIRCLE (ixS, iyS), 1, 8


t = t + deltat
WEND

'Calculo de energias

ekinT = .5 * dmasaT * (vxT * vxT + vyT * vyT)
ekinM = .5 * dmasaM * (vxM * vxM + vyM * vyM)
ekinJ = .5 * dmasaJ * (vxJ * vxJ + vyJ * vyJ)
ekinS = .5 * dmasaS * (vxS * vxS + vyS * vyS)

epotT = -dk / rT
epotM = -dk / rM
epotJ = -dk / rJ
epotS = -dk / rS

etotT = ekinT + epotT
etotM = ekinM + epotM
etotJ = ekinJ + epotJ
etotS = ekinS + epotS

rT = SQR(xT0 * xT0 + yT0 * yT0)
rM = SQR(xM0 * xM0 + yM0 * yM0)
rJ = SQR(xJ0 * xJ0 + yJ0 * yJ0)
rS = SQR(xS0 * xS0 + yS0 * yS0)


LOCATE 1, 1
PRINT "Planeta Distancia E. inicial E. final ";
LOCATE 3, 1
PRINT USING "Tierra     ###.##     ###.##   ###.##"; rT; etotT0; etotT
PRINT USING "Marte      ###.##     ###.##   ###.##"; rM; etotM0; etotM
PRINT USING "Jupiter    ###.##     ###.##   ###.##"; rJ; etotJ0; etotJ
PRINT USING "Saturno    ###.##     ###.##   ###.##"; rS; etotS0; etotS
