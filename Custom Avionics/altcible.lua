
defineProperty("cabinaltcible", globalPropertyf("sim/cockpit2/pressurization/actuators/cabin_altitude_ft"))
defineProperty("cabalt", globalPropertyf("sim/cockpit2/pressurization/indicators/cabin_altitude_ft"))
createProp("sim/custom/xap/dicabalt", "float")
defineProperty("difcabalt", globalPropertyf("sim/custom/xap/dicabalt"))
defineProperty("RATfail", globalPropertyi("sim/operation/failures/ram_air_turbine_on"))
createProp("sim/custom/xap/distance", "float")
defineProperty("distance", globalPropertyf("sim/custom/xap/distance"))
defineProperty("overrideaccel", globalPropertyi("sim/operation/override/override_throttles"))
defineProperty("throuse0", globalPropertyf("sim/flightmodel/engine/ENGN_thro_use[0]"))
defineProperty("throuse1", globalPropertyf("sim/flightmodel/engine/ENGN_thro_use[1]"))
defineProperty("throuse2", globalPropertyf("sim/flightmodel/engine/ENGN_thro_use[2]"))
defineProperty("throttle", globalPropertyf("sim/cockpit2/engine/actuators/throttle_ratio_all"))
defineProperty("altavion", globalPropertyf("sim/cockpit2/gauges/indicators/altitude_ft_pilot"))
defineProperty("tempsat", globalPropertyf("sim/cockpit2/temperature/outside_air_temp_degc"))
createProp("sim/custom/xap/maxin1", "float")
defineProperty("maxn1", globalPropertyf("sim/custom/xap/maxin1"))
createProp("sim/custom/xap/V2", "float")
defineProperty("vit2", globalPropertyf("sim/custom/xap/V2"))
createProp("sim/custom/xap/V2b", "float")
defineProperty("V2b", globalPropertyf("sim/custom/xap/V2b"))
createProp("sim/custom/xap/V1", "float")
defineProperty("V1", globalPropertyf("sim/custom/xap/V1"))
createProp("sim/custom/xap/V1b", "float")
defineProperty("V1b", globalPropertyf("sim/custom/xap/V1b"))
createProp("sim/custom/xap/climbgrad", "float")
defineProperty("climbgrad", globalPropertyf("sim/custom/xap/climbgrad"))
createProp("sim/custom/xap/pitches", "float")
defineProperty("pitches", globalPropertyf("sim/custom/xap/pitches"))
createProp("sim/custom/xap/pitchdif", "float")
defineProperty("pitchdif", globalPropertyf("sim/custom/xap/pitchdif"))
defineProperty("winddir", globalPropertyf("sim/weather/wind_direction_degt"))
defineProperty("windspeed", globalPropertyf("sim/weather/wind_speed_kt"))
createProp("sim/custom/xap/temp_alt", "float")
defineProperty("temp_alt", globalPropertyf("sim/custom/xap/temp_alt"))
defineProperty("alt_lfpn", globalPropertyf("sim/weather/wind_altitude_msl_m[2]"))
defineProperty("CG", globalPropertyf("sim/flightmodel/misc/cgz_ref_to_default"))
--defineProperty("Gforce", globalPropertyf("sim/flightmodel2/misc/gforce_normal"))
createProp("sim/custom/xap/maxGforce", "float")
defineProperty("maxGforce", globalPropertyf("sim/custom/xap/maxGforce"))
createGlobalPropertys("sim/custom/xap/month", 200, " mois       ")-- Code depart LFPO
defineProperty("month", globalPropertys("sim/custom/xap/month", "string"))--perso
defineProperty("actmonth", globalPropertyi("sim/cockpit2/clock_timer/current_month"))
defineProperty("rolldeg", globalPropertyf("sim/cockpit2/gauges/indicators/roll_AHARS_deg_pilot"))
defineProperty("rollratio", globalPropertyf("sim/flightmodel2/controls/roll_ratio"))
defineProperty("joyroll", globalPropertyf("sim/joystick/yoke_roll_ratio"))
defineProperty("joypitch", globalPropertyf("sim/joystick/yoke_pitch_ratio"))
defineProperty("pitchratio", globalPropertyf("sim/flightmodel2/controls/pitch_ratio"))
defineProperty("navlum", globalPropertyi("sim/cockpit2/switches/navigation_lights_on"));
defineProperty("beaconlum", globalPropertyi("sim/cockpit2/switches/beacon_on"));
defineProperty("strobelum", globalPropertyi("sim/cockpit2/switches/strobe_lights_on"));
defineProperty("genlum1", globalPropertyi("sim/cockpit2/switches/generic_lights_switch[1]"));

createProp("sim/7x/manualspeed", "int")
defineProperty("manualspeed", globalPropertyf("sim/7x/manualspeed"))
createProp("sim/7x/appspdsf1", "int")
defineProperty("appspdsf1", globalPropertyf("sim/7x/appspdsf1"))
createProp("sim/7x/appspdsf2", "int")
defineProperty("appspdsf2", globalPropertyf("sim/7x/appspdsf2"))
createProp("sim/7x/appspdsf3", "int")
defineProperty("appspdsf3", globalPropertyf("sim/7x/appspdsf3"))
createProp("sim/7x/appspdsf1m", "int")
defineProperty("appspdsf1m", globalPropertyf("sim/7x/appspdsf1m"))
createProp("sim/7x/appspdsf2m", "int")
defineProperty("appspdsf2m", globalPropertyf("sim/7x/appspdsf2m"))
createProp("sim/7x/appspdsf3m", "int")
defineProperty("appspdsf3m", globalPropertyf("sim/7x/appspdsf3m"))
createProp("sim/7x/appspdscl", "int")
defineProperty("appspdscl", globalPropertyf("sim/7x/appspdscl"))



local autopilot = loadSample('sounds/system/autopilote.wav')
local autothr = loadSample('sounds/system/Autothrottles.wav') -- New modif
local aprminimum = loadSample('sounds/system/appminimum.wav')
local minimums = loadSample('sounds/system/minimums.wav')
local alarm = loadSample('sounds/system/alarm.wav')

set(appspdsf1m,35)
set(appspdsf2m,25)
set(appspdsf3m,20)
set(maxGforce, 1.1)
local difpath = 0
local directionR = 0	
local hdgtrkR = 0
local difhdg = 0
local hdgtrkresult = 0	
local hdgpaR = 0
local centalt = 100
local dixalt = 0
local crisa = 0	
local cruisealt =0
local flagspilot = 0
local flagsautot = 0
local flagapmin = 0
local flagmin = 0
local ktsoumach = 0
local difspd = 0

function update()

if get(paaltholdb) > 1 then
set(pathcommand, 0)
end

if get(airspeed) < 10 and get(altlimit) < 3 then set(rat,0)
elseif (get(altlimit) > 100 and get(indicN10)<10 and get(indicN11)<10 and get(indicN12)<10) or (get(gen0)==0 and get(gen1)==0 and get(gen2)==0 ) then
	set(rat,1)
end

if get(lhmaster) == 1 then	
	-- set(cabmaster, 2)
    -- set(galmaster, 2)
    set(ventg, 1)
    set(xbleed3, 2)  
end
--экслим addons
if get(cabmaster) == 0 then
	set(galmaster, 0)
end
--

if get(rhmaster) == 1 then
	set(dump, 0)
	set(ventb, 3)
    set(AIAOAcop, 1)
    set(heatwind, 1)	
end
if get(bat) == 0 then set(flydir,0)
set(lhisol, 0)
set(rhisol, 0)
set(lhmaster,0)
set(rhmaster,0)
set(lhinit,0)
set(rhinit,0)
 end
directionR = get(direction)* math.pi / 180
hdgtrkR = get(hdgtrk)* math.pi / 180
hdgpaR = get(hdgpa)* math.pi / 180
difhdg = directionR - hdgtrkR
hdgtrkresult = hdgpaR - difhdg
hdgtrkresult = hdgtrkresult * 180 / math.pi
set(hdgtrkr,hdgtrkresult)
set(valaltc,get(dialaltpa))
if get(dialaltpa) >= 10000 then
set(valaltc,get(dialaltpa)/100)
end
if get(dialaltpa) < 10000 and get(dialaltpa) > 9900 then
set(valaltc,9900)
end
local aprochfinal = 0
local flappos = get(flapdeg)
aot = ""
local sat = get(tempsat)
local cfps = get(vpath) - get(pitchdeg)
set(FPS, cfps)
local pdir = get(pitchdir) - get(pitchdeg) - get(angleattack)
set(dirpitch, pdir)
if get(machsw) == 1 then  -- 
ktsoumach = get(speedinmach)
difspd = (get(airspeedAP) - ktsoumach)*100
else
ktsoumach = get(airspeed)
difspd = (get(airspeedAP) - ktsoumach)/3
end
if difspd > 17 then
set(dirth, 17)
elseif difspd < -17 then
set(dirth, -17)
else
set(dirth, difspd - get(angleattack))
end
set(accelereb, get(accelere) - get(angleattack))
if get(groundspd) < 5 then
set(dirpitch, 0)
set(FPS, 0)
set(accelereb, 0)
set(dirth,0)
end
local Gforces = get(Gforce)
if Gforces > get(maxGforce) then
set(maxGforce, Gforces)
end
 
	local a = get(cabinaltcible)
 	local b = get(cabalt)
 	local x = a - b
 	set(difcabalt, x)
 	
 	if get(altlimit) > 500 and get(altlimit) < 1000 then
	set(dump, 0)
	set(cabinaltcible, 6000)
	end
 	local mtotal = get(m_total)*2.2046226
 	local vrefc = (mtotal^2 * -.000000006)+(.001787*mtotal)+44.46
 	set(vref, vrefc)
 	local vitesse = get(airspeed)
 	set(vrefb, (vrefc - vitesse))
 	
if get(manualspeed) == 0 then 		 
 	if flappos < 9 then	 	
 		aprochfinal = (vrefc + 33)  --##### valeur vrai sans manoeuvre
 		
 		elseif flappos < 20 then	 	 	
 		aprochfinal = (vrefc + 15)  
 		
 		elseif flappos < 40 then	 	 	
 		aprochfinal = (vrefc + 5)  
 		
 		elseif flappos  == 40 then	 	 	
 		aprochfinal = vrefc 
 			
 	 end 
 	 set(appspdscl,(vrefc + 33))--##### valeur vrai avec manoeuvre
 	 set(appspdsf1,(vrefc + 15))
 	 set(appspdsf2,(vrefc + 5))
 	 set(appspdsf3,vrefc)
end

 if get(manualspeed) == 1 then	
 		set(appspdscl,(vrefc + 50))
 	if flappos < 9 then	 	
 		aprochfinal = (vrefc + 50)--##### valeur vrai avec maneuvre
 		--set(appspdscl,aprochfinal)
 		elseif flappos < 20 then	 	 	
 		aprochfinal = (vrefc + get(appspdsf1m))  
 		
 		elseif flappos < 40 then	 	 	
 		aprochfinal = (vrefc + get(appspdsf2m))  
 		
 		elseif flappos  == 40 then	 	 	
 		aprochfinal = (vrefc + get(appspdsf3m)) 
 			
 	 end 
 
 end
 	
		 
 	 	  	 	 			
 	set(aproch, aprochfinal)
 	set(aprochb, aprochfinal - vitesse)	 		 	
 	local viter = (mtotal * 0.00103) + 56.87 -- calcul Vr
 	if viter < 101 then viter = 101
 	end	
 	set(vitr, viter)
 	set(vitrb, viter - vitesse)
 	local vite2 = (mtotal * 0.0009) + 80.04	-- calcul V2
 	set(vit2, vite2)
 	set(V2b, vite2 - vitesse)
	local altD = get(altpisteD) / 2000
	local v1 = (0.001186 * mtotal) + 38 + altD + (sat/20)
 	set(V1, v1)
	set(V1b, v1 - vitesse)
 	set(VFR, vite2 + 30)
 	set(VFRb, (vite2 + 30)-vitesse)
 	local vft = 85.33 + (mtotal * 0.0017)
	set(VFTO, vft)
	set(VFTOb, vft - vitesse)
	local climgrad = ((0.0000000098 * mtotal ^2) -(0.00145835 * mtotal) + 59.645) - (altD/5000) - (sat/30)	
	if climgrad > 15 then
	climgrad = 15
	end
	if climgrad < -15 then climgrad = -15
	end
	set(climbgrad, climgrad)		
	local pitche = (0.5957 * climgrad) + 10.793 + (((mtotal - 50000)/4000) * 0.4)
	if pitche > 20 then pitche = 20
	end
	if pitche < -20 then pitche = -20
	end
	local pitcnow = get(pitchdeg)
	set(pitches, pitche)	
	local pitchedif = pitche - pitcnow
	set(pitchdif, pitchedif)
	local rotsym = pitche - get(pitchdeg) - get(angleattack)
	set(ROT, rotsym)
	local pathc = get(pathcommand)-- c
	local gvpath = get(vpath)-- le 	
	difpath =  pathc - gvpath		
	set(pitchdirb, get(angleattack)+ difpath)   -- mo
	set(pathread, (.5011*pathc) - .0285) -- pour
	if get(posivvi) == 2 then
	set(pathcommand, gvpath)	
	end
	if get(posivvi) < 2 then
	set(requetevvi, get(actualvvi))
	end  
   if get(selils) < 4 then
    set(backcourse,0)
    end 	
 	local n1 = get(indicN10)
 	local accel = get(throttle)
 	local altitude = get(altavion)
 	local n1max = 0
 	local n1tillmax = 0
 	local n1alt = 0
 	local coefalt = 0
 	local thr = 0
 	n1max = (sat * -.1743) + 97.957
 	n1tillmax = (sat * .1712) + 87.767
 	coefalt = (0.000000089 * altitude ^2) + (0.000955714 * altitude) + 0.03428
 	n1alt = n1tillmax + coefalt
 	if n1max > 99.8 then
 	n1max = 99.8
 	end
 	 	if n1alt < n1max then
 		set(maxn1, n1alt)
 		else
 		set(maxn1, n1max)
 	end
 	
 	if n1 > get(maxn1) then
 	set(overrideaccel, 1)
 	thr = get(throttle)
 	thr = thr - 0.1
 	set(throuse0, thr)
 	set(throuse1, thr)
 	set(throuse2, thr)
 	else
 	set(overrideaccel, 0)
  end		
		local stdisa = 0
		local calisa = 15 -(get(altavion) / 500)-- 
		if get(altavion) > 35750 then
		stdisa = -56.5  
		else
		stdisa = calisa -- +1 � cause de l'arrondi au chiffre sup�rieur par x-plane
		end
		set(isa, (sat - stdisa))
set(TBAT, get(TAMB))
if get(TAMB) < 12 then 
set(TBAT, 12) end						
		local tempisa = 0
		local alttop = get(alt_lfpn)-- voir weather top altitude
		alttop = alttop * 3.28
				
		if alttop > 36091 then
		tempisa = -56.5  
		else		
		tempisa = 15 - (alttop / 500)
 		end
 		set(temp_alt, tempisa)-- affich� dans page FPLN temp�rature fonction altitude top weather
if get(isa) < 10 then
crisa = 10
else crisa = get(isa)
end
crisa = crisa - 10
cruisealt = (-.35 * mtotal) + 64000 -(160 * crisa)
cruisealt = cruisealt/100
set(altcruise, cruisealt)-- valeur Init Crz Alt dans page FPLN
months = {"January","february","march","april","may","june","july","august","september","october","november","december"}
local moisactuel = get(actmonth)
set(month, string.format("%s", months[moisactuel]))
local poids = get(m_total)* 2.202
local flappos = get(flapdeg)
local V0 = 80
local vsf0 = .6297 * (poids ^.4922)
local vsf1 = .484 * (poids^.4967)
local vsf2 = .4622 * (poids^.4962)
local vsf3 = .4579 * (poids^.4947)
local vsf01 = (((-0.000026*poids)-1.4278) * flappos) + vsf0  -- p
local vsf11 = (((-0.000005001*poids)-0.220425) * (flappos - 11)) + vsf1 -- po
local vsf21 = (((-0.0000014*poids)-0.0575) * (flappos - 20)) + vsf2 -- po
if flappos <= 9 then 
V0 = vsf01
end
if flappos > 9 and flappos <= 20 then 
V0 = vsf11
end
if flappos > 20 then 
V0 = vsf21
end
set(Vstall, get(airspeed) - V0)
set(valeurstall, V0)


if get(altlimit) < 5 and get(airspeed) < 60 and get(flapdeg) >5 then
--set(TOT, .5)
set(TOT, .8)
end
if get(rolldeg) > 35   and get(joyroll) == 0 then
set(rollratio, -.1)
end
if get(rolldeg) > 50   and get(joyroll) > 0 then
	set(rollratio, 0)
		if get(rolldeg) > 54   then	
		local var= (-.0571*(get(rolldeg)^2)) + 	(6.2743 *get(rolldeg))-172.36
		set(rollratio, var)
		end	
end
if get(rolldeg) < -35   and get(joyroll) == 0 then
set(rollratio, .1)
end
if get(rolldeg) < -50   and get(joyroll) < 0 then
	set(rollratio, 0)
		if get(rolldeg) < -54   then	
		local var= (.0571*(get(rolldeg)^2)) + (6.2743 *get(rolldeg))+172.36
		set(rollratio, var)
		end	
end
if get(pitchdeg) > 20 and get(joypitch) == 0 then
set(pitchratio,-.1)
end	
if get(pitchdeg) > 25 and get(joypitch) >= 0 then
	local pr = get(pitchratio)
	set(pitchratio,pr/2)
		if get(pitchdeg) > 30   then	
		local var= (-.0571*(get(pitchdeg)^2)) + (3.4171 *get(pitchdeg))-51.13
		set(pitchratio, var)
		end		
end 
if get(pitchdeg) < -20 and get(joypitch) == 0 then
set(pitchratio,.1)
end	
if get(pitchdeg) < -25 and get(joypitch) <= 0 then
	local pr = get(pitchratio)
	set(pitchratio,pr/2)
		if get(pitchdeg) < -30   then	
		local var= (.0571*(get(pitchdeg)^2)) + (3.4171 *get(pitchdeg))+51.13
		set(pitchratio, var)
		end		
end	
local lldstatu = get(lld)
if lldstatu == 0 then
set(llsd, 0)
end
if lldstatu == 1 then
set(llsd, get(flash))
end
if lldstatu == 2 then
set(llsd, 1)
end
local lldstatug = get(llg)
if lldstatug == 0 then
set(llsg, 0)
end
if lldstatug == 1 then
set(llsg, get(flash))
end

if lldstatug == 2 then
set(llsg, 1)
end
local lumi1 = get(lum1)
if lumi1 == 0 then
set(navlum, 0) 
set(genlum1, 0)
end
if lumi1 == 1 then
set(navlum, 1) 
set(genlum1, 0)
end
if lumi1 == 2 then
set(navlum, 1) 
set(genlum1, 1)
end
local lumi2 = get(lum2)
if lumi2 == 0 then
set(beaconlum, 0) 
set(strobelum, 0)
end
if lumi2 == 1 then
set(beaconlum, 1) 
set(strobelum, 0)
end
if lumi2 == 2 then
set(beaconlum, 1) 
set(strobelum, 1)
end	
alerteland()

end
function alerteland()

	if get(altlimit) < 280  and  get(flapmax)==1 then 	
				if flagsautot == 0 and get(autothrottle) == 1 then
				playSample(autothr, 0)
				flagsautot = 1
				end
	end
	if get(altlimit) < 380  and  get(flapmax)==1 and get(xpflydir) == 2 then 
				if flagspilot == 0 then
				playSample(autopilot, 0)
				flagspilot = 1
				end
	end
	if get(altlimit) < 250  and  get(flapmax)==1 then 	
				if flagapmin == 0 then
				playSample(aprminimum, 0)
				flagapmin = 1
				end
	end
	if get(altlimit) < 190  and  get(flapmax)==1 then 	
				if flagmin == 0 then
				playSample(minimums, 0)
				flagmin = 1
				end
	end
end 