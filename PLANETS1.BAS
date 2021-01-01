'Change to graphics mode

SCREEN 9

'Scale duration and zoom

zoom = 33
years = 1


massE = 1!
massM = .107
massJ = 317.898
massS = 95.21896

dk = 1.0005
deltat = .001
deltat2 = deltat * deltat

'T : Earth
'M : Mars
'J : Jupiter
'S : Saturn

'Initial positions in astronomical units

xT0 = 1!
xM0 = 1.523
xJ0 = 5.202
xS0 = 9.536

yT0 = 0!
yM0 = 0!
yJ0 = 0!
yS0 = 0!

'Speed on each coordinate as a ratio of the speed of Earth

vxT0 = 0!
vxM0 = 0!
vxJ0 = 0!
vxS0 = 0!

vyT0 = -1!
vyM0 = -.8084
vyJ0 = -.4599
vyS0 = -.324

'Initial time
t = 0!
duration = years * 6.304

'loop times
k = 1

CIRCLE (320, 175), 5, 14
PAINT (320, 175), 14, 14


rT = SQR(xT0 * xT0 + yT0 * yT0)
rM = SQR(xM0 * xM0 + yM0 * yM0)
rJ = SQR(xJ0 * xJ0 + yJ0 * yJ0)
rS = SQR(xS0 * xS0 + yS0 * yS0)

elapsed = t / 6.304

LOCATE 1, 1

PRINT "Planet Distance to the sun in UA  ";

LOCATE 3, 1

PRINT USING "Earth       ###.#####     "; rT
PRINT USING "Mars        ###.#####     "; rM
PRINT USING "Jupiter     ###.####     "; rJ
PRINT USING "Saturn      ###.#####     "; rS
PRINT ""
PRINT USING "Elapsed time ##.##### years"; elapsed


'Principal loop
WHILE t < duration

'Distance to the sun

rT = SQR(xT0 * xT0 + yT0 * yT0)
rM = SQR(xM0 * xM0 + yM0 * yM0)
rJ = SQR(xJ0 * xJ0 + yJ0 * yJ0)
rS = SQR(xS0 * xS0 + yS0 * yS0)


'Store distances for efficiency

rT3 = rT * rT * rT
rM3 = rM * rM * rM
rJ3 = rJ * rJ * rJ
rS3 = rS * rS * rS

'Force on each coordinate

fxT = -dk * massE * xT0 / rT3
fxM = -dk * massM * xM0 / rM3
fxJ = -dk * massJ * xJ0 / rJ3
fxS = -dk * massS * xS0 / rS3

fyT = -dk * massE * yT0 / rT3
fyM = -dk * massM * yM0 / rM3
fyJ = -dk * massJ * yJ0 / rJ3
fyS = -dk * massS * yS0 / rS3

'Aceleration on each coordinate

axT = fxT / massE
axM = fxM / massM
axJ = fxJ / massJ
axS = fxS / massS

ayT = fyT / massE
ayM = fyM / massM
ayJ = fyJ / massJ
ayS = fyS / massS

'Positions

xT = xT0 + vxT0 * deltat + .5 * axT * deltat2
xM = xM0 + vxM0 * deltat + .5 * axM * deltat2
xJ = xJ0 + vxJ0 * deltat + .5 * axJ * deltat2
xS = xS0 + vxS0 * deltat + .5 * axS * deltat2

yT = yT0 + vyT0 * deltat + .5 * ayT * deltat2
yM = yM0 + vyM0 * deltat + .5 * ayM * deltat2
yJ = yJ0 + vyJ0 * deltat + .5 * ayJ * deltat2
yS = yS0 + vyS0 * deltat + .5 * ayS * deltat2

'Speed

vxT = vxT0 + axT * deltat
vxM = vxM0 + axM * deltat
vxJ = vxJ0 + axJ * deltat
vxS = vxS0 + axS * deltat

vyT = vyT0 + ayT * deltat
vyS = vyS0 + ayS * deltat
vyM = vyM0 + ayM * deltat
vyJ = vyJ0 + ayJ * deltat


'Coordinate storage

xT0 = xT: yT0 = yT: vxT0 = vxT: vyT0 = vyT
xM0 = xM: yM0 = yM: vxM0 = vxM: vyM0 = vyM
xJ0 = xJ: yJ0 = yJ: vxJ0 = vxJ: vyJ0 = vyJ
xS0 = xS: yS0 = yS: vxS0 = vxS: vyS0 = vyS

ixT = INT(xT0 * zoom) + 320
ixM = INT(xM0 * zoom) + 320
ixJ = INT(xJ0 * zoom) + 320
ixS = INT(xS0 * zoom) + 320

iyT = INT(yT0 * zoom) + 175
iyM = INT(yM0 * zoom) + 175
iyJ = INT(yJ0 * zoom) + 175
iyS = INT(yS0 * zoom) + 175

CIRCLE (ixT, iyT), 1, 9
CIRCLE (ixM, iyM), 1, 12
CIRCLE (ixJ, iyJ), 1, 6
CIRCLE (ixS, iyS), 1

m = k MOD 100
IF m = 0 THEN
elapsed = t / 6.304

LOCATE 1, 1

PRINT "Planet Distance to the sun in UA  ";

LOCATE 3, 1

PRINT USING "Earth       ###.#####   "; rT
PRINT USING "Mars        ###.#####     "; rM
PRINT USING "Jupiter     ###.#####     "; rJ
PRINT USING "Saturn      ###.#####     "; rS
PRINT ""
PRINT USING "Elapsed time ##.##### years"; elapsed

END IF

k = k + 1
t = t + deltat
WEND

elapsed = years

LOCATE 1, 1

PRINT "Planet Distance to the sun in UA  ";

LOCATE 3, 1

PRINT USING "Earth       ###.#####   "; rT
PRINT USING "Mars        ###.#####     "; rM
PRINT USING "Jupiter     ###.#####     "; rJ
PRINT USING "Saturn      ###.#####     "; rS
PRINT ""
PRINT USING "Elapsed time ##.##### years"; elapsed


