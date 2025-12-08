-- 23000
defineProperty("xbp0", globalPropertyi("sim/weapons/mis_thrust3[21]"))
defineProperty("xbp1", globalPropertyi("sim/weapons/mis_thrust3[22]"))
defineProperty("xbp2", globalPropertyi("sim/weapons/mis_thrust3[23]"))
defineProperty("mix0", globalPropertyf("sim/flightmodel/engine/ENGN_mixt[0]"))
defineProperty("mix1", globalPropertyf("sim/flightmodel/engine/ENGN_mixt[1]"))
defineProperty("mix2", globalPropertyf("sim/flightmodel/engine/ENGN_mixt[2]"))
defineProperty("saisie")

-- NEW
defineProperty("ftf",
               globalPropertyi("sim/cockpit2/fuel/fuel_tank_transfer_from")) --
defineProperty("ftt", globalPropertyi("sim/cockpit2/fuel/fuel_tank_transfer_to"))
createProp("sim/7x/bt1f3", "int") -- bouton transfer from tk3 to tk1
defineProperty("bt1f3", globalPropertyi("sim/7x/bt1f3"))
createProp("sim/7x/bt1f2", "int")
defineProperty("bt1f2", globalPropertyi("sim/7x/bt1f2"))
createProp("sim/7x/bt2f1", "int")
defineProperty("bt2f1", globalPropertyi("sim/7x/bt2f1"))
createProp("sim/7x/bt2f3", "int")
defineProperty("bt2f3", globalPropertyi("sim/7x/bt2f3"))
createProp("sim/7x/bt3f1", "int")
defineProperty("bt3f1", globalPropertyi("sim/7x/bt3f1"))
createProp("sim/7x/bt3f2", "int")
defineProperty("bt3f2", globalPropertyi("sim/7x/bt3f2"))
createProp("sim/7x/bk13", "int")
defineProperty("bk13", globalPropertyi("sim/7x/bk13"))
createProp("sim/7x/cruisealtopt", "int")
defineProperty("cruisealtopt", globalPropertyf("sim/7x/cruisealtopt"))
createProp("sim/7x/cropt", "float")
defineProperty("cropt", globalPropertyf("sim/7x/cropt"))

local th1 = math.random(1, 8)
local th2 = math.random(1, 12)
local th3 = math.random(1, 5)
local fuelactuel = 0
local fuelstart = 0
local fuelutilise = 0
fuelstart = get(fuel_total)
set(fuel_used, 0)
set(fuel_reset, 1)
local prA = 0
local flagAIwing = 0 -- 
local flagapu1 = 0
local tempapu1 = 0
local tempapu2 = 0
local tempapudif = 0
local apuqrate = 2 / 60
local vpresel = 0
local pfuelpax = 0
local distance = 0
local distcruise = 0
local fuelcruises = 0
local p = 0
local p1 = 0
local po = 0

function fueltransfer()
    if get(bt1f3) == 1 then
        set(bt1f2, 0);
        set(bt2f1, 0);
        set(bt2f3, 0);
        set(bt3f1, 0);
        set(bt3f2, 0)
        set(ftf, 3)
        set(ftt, 1)

    elseif get(bt1f2) == 1 then
        set(bt1f3, 0);
        set(bt2f1, 0);
        set(bt2f3, 0);
        set(bt3f1, 0);
        set(bt3f2, 0)
        set(ftf, 2)
        set(ftt, 1)

    elseif get(bt2f1) == 1 then
        set(bt1f3, 0);
        set(bt1f2, 0);
        set(bt2f3, 0);
        set(bt3f1, 0);
        set(bt3f2, 0)
        set(ftf, 1)
        set(ftt, 2)

    elseif get(bt2f3) == 1 then
        set(bt1f3, 0);
        set(bt1f2, 0);
        set(bt2f1, 0);
        set(bt3f1, 0);
        set(bt3f2, 0)
        set(ftf, 3)
        set(ftt, 2)

    elseif get(bt3f1) == 1 then
        set(bt1f3, 0);
        set(bt1f2, 0);
        set(bt2f1, 0);
        set(bt2f3, 0);
        set(bt3f2, 0)
        set(ftf, 1)
        set(ftt, 3)

    elseif get(bt3f2) == 1 then
        set(bt1f3, 0);
        set(bt1f2, 0);
        set(bt2f1, 0);
        set(bt2f3, 0);
        set(bt3f1, 0)
        set(ftf, 2)
        set(ftt, 3)
    end
    if get(bk13) == 1 then --

        if get(m_fuel3) > (get(m_fuel1) * 1.005) or get(m_fuel1) >
            (get(m_fuel3) * 1.005) then -- 
            if get(m_fuel3) > (get(m_fuel1) * 1.05) then
                set(ftf, 3)
                set(ftt, 1)
            elseif get(m_fuel1) > (get(m_fuel3) * 1.05) then
                set(ftf, 1)
                set(ftt, 3)
            end
        else
            set(ftf, 0)
            set(ftt, 0)
            set(bk13, 0)
        end
    end
end -- 

function fuelAPU()
    if get(apuON) == 0 then flagapu1 = 0 end
    local Qth2 = get(m_fuel2)
    if flagapu1 == 0 then
        if get(apuON) == 1 then
            tempapu1 = get(tempssec)
            flagapu1 = 1
        end
    end
    if get(apuON) == 1 then
        tempapu2 = get(tempssec)
        tempapudif = (tempapu2 - tempapu1) -- temps run APU en min
        local q1 = tempapudif * apuqrate
        set(m_fuel2, Qth2 - q1)
        tempapu1 = get(tempssec)
    end
end --

function PAX()
    local paxn = get(pax)
    local paxmass = get(paxm)
    local cargom = get(cargo)
    local paxp = (paxn * paxmass) + cargom

    set(payload, (paxp + 1072) / 2.2046)
    local ppax = paxp - 670 -- refernce 1pax � 170lb + 500lb cargo

    if vpresel <= 0.80 then
        pfuelpax = ppax / 990 *
                       ((0.0000065015 * distance ^ 2) +
                           (0.1058871472 * distance) - 20.7)
    elseif vpresel > 0.80 then
        local apax = 0.0000065015 + (0.00000050544 * ((vpresel * 100) - 80))
        local bpax = 0.1058871472 + (0.000980348 * ((vpresel * 100) - 80))
        local cpax = 20.7 + (0.4 * ((vpresel * 100) - 80))
        pfuelpax = ppax / 990 *
                       ((apax * distance ^ 2) + (bpax * distance) - cpax)
    end

end -- 

function selcruisespeed()
    local vitp = 0 -- 
    local vmanu = 0 -- 
    local v0 = 0
    vitp = get(selcrzspdb)
    vmanu = get(selcrzmanb) / 100 --
    if vitp == 0 then
        v0 = vmanu
    elseif vitp == 1 then
        v0 = .77
    elseif vitp == 2 then
        v0 = .83
    elseif vitp == 3 then
        v0 = .87
    end
    vpresel = v0
    set(selcrzvb, v0)
end

function update()

    -- ######si j'actionne un bouton de transfertFuel transfert 
    if get(bt1f3) == 1 or get(bt1f2) == 1 or get(bt2f1) == 1 or get(bt2f3) == 1 or
        get(bt3f1) == 1 or get(bt3f2) == 1 or get(bk13) == 1 then
        fueltransfer()
    else
        set(ftf, 0)
        set(ftt, 0)
    end

    fuelAPU()
    if get(lhinit) == 1 or get(rhinit) == 1 or get(lhmaster) == 1 then
        set(avionic, 1)
        set(inverter, 1)
    else
        set(avionic, 0)
    end

    if get(emrglight) == 1 then
        set(emrglightb, 1)
    else
        set(emrglightb, 0)
    end
    if get(FireSOV0) == 1 then set(sova1, 1) end
    if get(FireSOV1) == 1 then
        set(sovb2, 1);
        set(sovc2, 1)
    end
    if get(FireSOV2) == 1 then
        set(sovb3, 1);
        set(sova3, 1)
    end
    local hyd = get(selecthyd) --  
    local N1gauche = get(indicN10) --
    local N1central = get(indicN11) --
    local N1droit = get(indicN12) --
    local isah = get(isa)
    local valpydM1 = ((710.64 * math.log(N1gauche)) + 24.559)
    if valpydM1 < 1 then valpydM1 = 1 end
    local valpydM2 = ((710.64 * math.log(N1central)) + 24.559)
    if valpydM2 < 1 then valpydM2 = 1 end

    local phydM1 = valpydM1 -- 
    local phydM2 = get(hyd1)
    local phydM3 = get(hyd2) --
    local phydBU = get(buhydro)
    local flagM = 0
    local flagB = 0
    set(temphyd1, (get(hyd11) / 100) + isah + 15 + th1)
    set(temphyd2, (get(hyd22) / 100) + isah + 15 + th2)
    set(temphyd3, (get(hyd3) / 100) + isah + 15 + th3)
    if phydM1 > 500 or phydM2 > 500 or phydM3 > 500 then
        set(genhyd, 1) -- 
    else
        set(genhyd, 0) -- 
    end
    if get(sovc2) == 1 then -- si moteur arrete ou sov activ�, pr = 0
        set(hyd3, 1) -- set pr dans systeme hyd3
    else
        set(hyd3, valpydM2)
    end
    if (N1droit < 15 and N1gauche < 15) or (get(sova1) == 1 and get(sova3) == 1) or
        (N1droit < 15 and get(sova1) == 1) or
        (N1gauche < 15 and get(sova3) == 1) then -- s
        flagM = 1
    else
        flagM = 0
    end
    if phydM1 > phydM3 then
        set(hyd11, phydM1)
    else
        set(hyd11, phydM3)
    end
    if flagM == 1 then set(hyd11, 1) end
    if (N1central > 15 and get(sovb2) == 0) or
        (N1droit > 15 and get(sovb3) == 0) or hyd == 0 or hyd == 1 then
        set(buhydro, 0) -- electric pump off
    end
    if hyd == 1 and N1central < 15 and N1droit < 15 then
        set(buhydro, 1) -- electric pump on si moteur arrete
    end
    if (get(sovb2) == 1 and get(sovb3) == 1 and hyd == 1 or hyd == 2) or
        (get(sovb2) == 1 and N1droit < 15 and hyd == 1 or hyd == 2) or
        (get(sovb3) == 1 and N1central < 15 and hyd == 1 or hyd == 2) then -- s
        set(hyd22, 2900) -- pr elect pump
        set(hydratio2, 0)
        set(hydratio3, 0)
        set(buhydro, 1)
        flagB = 0
    end
    if (N1central < 15 and get(sovb3) == 1 and hyd == 0) or
        (N1droit < 15 and get(sovb2) == 1 and hyd == 0) or
        (N1central < 15 and N1droit < 15 and hyd == 0) or
        (get(sovb2) == 1 and get(sovb3) == 1 and hyd == 0) then
        flagB = 1 -- arret du circuit
    else
        flagB = 0
    end
    if phydM2 > phydM3 then
        set(hyd22, phydM2)
        set(hydratio2, 0)
        set(hydratio3, 0)
    else
        set(hyd22, phydM3)
        set(hydratio2, 0)
        set(hydratio3, 0)
    end
    if flagB == 1 then
        set(hyd22, 1) -- pr B =0
        set(flap0, 0)
        set(hydratio2, 6)
        set(hydratio3, 6)
    end
    set(testvalalt, flagB)
    if (get(initfuel0) == 0 and get(xbp0) == 0 and get(xbp1) == 0) or
        (get(initfuel0) == 0 and get(xbp1) == 1 and get(initfuel2) == 0) or
        (get(initfuel0) == 0 and get(xbp0) == 1 and get(initfuel1) == 0) or
        get(FireSOV0) == 1 then
        set(mix0, 0)
    else
        set(mix0, 1)
    end
    if (get(initfuel1) == 0 and get(xbp0) == 0 and get(xbp2) == 0) or
        (get(initfuel1) == 0 and get(xbp0) == 1 and get(initfuel0) == 0) or
        (get(initfuel1) == 0 and get(xbp2) == 1 and get(initfuel2) == 0) or
        get(FireSOV1) == 1 then
        set(mix1, 0)
    else
        set(mix1, 1)
    end
    if (get(initfuel2) == 0 and get(xbp1) == 0 and get(xbp2) == 0) or
        (get(initfuel2) == 0 and get(xbp1) == 1 and get(initfuel0) == 0) or
        (get(initfuel2) == 0 and get(xbp2) == 1 and get(initfuel1) == 0) or
        get(FireSOV2) == 1 then
        set(mix2, 0)
    else
        set(mix2, 1)
    end

    if get(z_fuel_digital_1) == 0 then set(mix0, 0) end
    if get(z_fuel_digital_2) == 0 then set(mix1, 0) end
    if get(z_fuel_digital_3) == 0 then set(mix2, 0) end
    if get(SOV0) == 0 then set(mix0, 0) end
    if get(SOV1) == 0 then set(mix1, 0) end
    if get(SOV2) == 0 then set(mix2, 0) end

    if get(fuel_reset) == 1 then
        fuelstart = get(fuel_total)
        set(fuel_reset, 0)
    else
        fuelactuel = get(fuel_total)
        fuelutilise = fuelstart - fuelactuel
        set(fuel_used, fuelutilise)
        set(fuel_used1, fuelutilise / 3)
        set(fuel_used2, fuelutilise / 3)
        set(fuel_used3, fuelutilise / 3)
    end
    distance = get(distancetrip) * 10
    selcruisespeed()
    PAX()
    local ZFW = 33200 + (get(payload) * 2.2046) -- je retranche 1072lb � 34272
    set(nbaa, (0.035 * ZFW) + 1130)
    set(vfrres, (0.014 * ZFW) + 290)
    local reservefuel = 0
    if get(resfuel) == 0 then
        reservefuel = get(nbaa)
    elseif get(resfuel) == 1 then
        reservefuel = get(vfrres)
    elseif get(resfuel) == 2 then
        reservefuel = get(fuelreslb)
    end
    set(fuelreserve, reservefuel)
    local ptempfuel = (0.0003818684 * distance ^ 2) + (2.561714 * distance) +
                          4449
    local ptempo1 = ZFW + ptempfuel -- z�ro fuel weight + reservenbaa + fuel trip
    local distmonte = (-0.0000000723 * ptempo1 ^ 2) + (0.010410686 * ptempo1) -
                          226.19
    -- verif MAi 2018 ptempo1 ok

    local fuel_to_alt = 0
    if ptempo1 <= 55000 then
        fuel_to_alt = (ptempo1 * 0.0282) + 280.77 -- verif ok en Mai 2018
    end
    if ptempo1 > 55000 then
        fuel_to_alt = (ptempo1 * 0.0404) - 487.75 -- verif ok en Mai 2018
    end
    local cruisedist = distance - 225
    local fuelcruise = 0
    if distance <= 2000 then
        fuelcruise = (0.00022084 * cruisedist ^ 2) + (3.09071725 * cruisedist) +
                         16
    end
    if distance > 2000 and distance <= 4000 then
        fuelcruise = (0.0003187 * cruisedist ^ 2) + (2.8244443 * cruisedist) +
                         150
    end
    if distance > 4000 then
        fuelcruise = (0.00027098 * cruisedist ^ 2) + (2.9649112 * cruisedist) +
                         390
    end
    distcruise = distance - distmonte - 160
    if vpresel >= 0.75 and vpresel <= 0.8 then
        local acr = (0.00967022 * vpresel ^ 2) - (0.014973343 * vpresel) +
                        0.0060414442
        local bcr = (30.67927942 * vpresel ^ 2) - (47.277374419 * vpresel) +
                        21.2658229979
        local ccr = (4374 * vpresel ^ 2) - (6675.3 * vpresel) + 2686.1
        fuelcruises = (acr * distcruise ^ 2) + (bcr * distcruise) + ccr
    end
    if vpresel == 0.81 then
        fuelcruises = (0.0002578357 * distcruise ^ 2) +
                          (3.0925877126 * distcruise) + 151.956
    elseif vpresel == 0.82 then
        fuelcruises = (0.0002641606 * distcruise ^ 2) +
                          (3.1065663362 * distcruise) + 158.781
    elseif vpresel == 0.83 then
        fuelcruises = (0.0002744741 * distcruise ^ 2) +
                          (3.1364673276 * distcruise) + 165.975
    elseif vpresel == 0.84 then
        fuelcruises = (0.0002778217 * distcruise ^ 2) +
                          (3.2147568436 * distcruise) + 155.14
    elseif vpresel == 0.85 then
        fuelcruises = (0.0003008366 * distcruise ^ 2) +
                          (3.2458341227 * distcruise) + 172, 32
    end
    if vpresel > 0.85 then
        local acrb = (0.0095591667 * vpresel ^ 2) - (0.014741275 * vpresel) +
                         0.0059244224
        local bcrb = (82.6080205 * vpresel ^ 2) - (133.313134685 * vpresel) +
                         56.8777
        local ccrb = (-13391 * vpresel ^ 2) + (22814.51 * vpresel) - 9545.008
        fuelcruises = (acrb * distcruise ^ 2) + (bcrb * distcruise) + ccrb
    end
    local down_et_taxi = (-0.1144 * distance) + 340.68 + 1035
    set(fueltrip,
        reservefuel + fuel_to_alt + fuelcruises + pfuelpax + down_et_taxi)
    if get(setfuel) == 1 then
        set(m_fuel1, get(fueltrip) * .14968548)
        set(m_fuel2, get(fueltrip) * .15422141)
        set(m_fuel3, get(fueltrip) * .14968548)
    end
    local p = get(m_total) * 2.20462
    p1 = p + ((vpresel * 150000) - 120000)
    if p1 >= 67000 then
        set(cruisealtopt, 35000)
    elseif p1 >= 63000 and p1 < 67000 then
        set(cruisealtopt, 37000)
    elseif p1 >= 60000 and p1 < 63000 then
        set(cruisealtopt, 39000)
    elseif p1 >= 55000 and p1 < 60000 then
        set(cruisealtopt, 41000)
    elseif p1 >= 50000 and p1 < 55000 then
        set(cruisealtopt, 43000)
    elseif p1 >= 45000 and p1 < 50000 then
        set(cruisealtopt, 45000)
    elseif p1 < 45000 then
        set(cruisealtopt, 47000)
    end
    if distance <= 400 then set(cruisealtopt, 37000) end
    if get(speedinmach) >= .7 then
        po = p + ((get(speedinmach) * 150000) - 120000)
        if po >= 67000 then
            set(cropt, 35000)
        elseif po >= 63000 and po < 67000 then
            set(cropt, 37000)
        elseif po >= 60000 and po < 63000 then
            set(cropt, 39000)
        elseif po >= 55000 and po < 60000 then
            set(cropt, 41000)
        elseif po >= 50000 and po < 55000 then
            set(cropt, 43000)
        elseif po >= 45000 and po < 50000 then
            set(cropt, 45000)
        elseif po < 45000 then
            set(cropt, 47000)
        end
    end
    if get(apu) == 1 then
        set(fpump1, 1)
        if N1central > 15 then set(fpump1, 2) end
    end
    if get(SOV0) == 1 and N1gauche < 5 and get(starteng) == 1 then
        set(flageng0, 1) -- un flag
    end
    if get(flageng0) == 1 then
        set(bleedAPU, 4) -- b
        set(initfuel0, 1) -- f
        set(starteng1, 4) -- d 
        set(fpump0, 1) -- s
        if N1gauche > 15 then
            -- set(fpump0, 2) -- s
            set(bleedl, 1) -- s
            set(flageng0, 0)
        end
    end
    if get(fpump0) == 0 then
        set(initfuel0, 0) -- p
    else
        set(initfuel0, 1)
    end
    if get(SOV1) == 1 and N1central < 5 and get(starteng) == 1 then
        set(flageng1, 1)
    end
    if get(flageng1) == 1 then
        set(bleedAPU, 4)
        set(initfuel1, 1)
        set(starteng2, 4)
        set(fpump1, 1)
        if N1central > 15 then
            -- set(fpump1, 2)
            set(bleedc, 1)
            set(flageng1, 0)
            -- flag = 1
        end
    end
    if get(fpump1) == 0 then
        set(initfuel1, 0)
    else
        set(initfuel1, 1)
    end
    if get(SOV2) == 1 and N1droit < 5 and get(starteng) == 1 then
        set(flageng2, 1)
    end
    if get(flageng2) == 1 then
        set(bleedAPU, 4)
        set(initfuel2, 1)
        set(starteng3, 4)
        set(fpump2, 1)
        if N1droit > 15 then
            -- set(fpump2, 2)
            set(bleedr, 1)
            set(flageng2, 0)
        end
    end
    if get(fpump2) == 0 then
        set(initfuel2, 0)
    else
        set(initfuel2, 1)
    end
    local oapu = get(overAPUaction)
    local selwing = get(AIwingsel) -- o
    local selengc = get(AIengcentre) -- o
    local AIdetect = get(icedetect) -- a
    if selwing == 1 then -- s
        if AIdetect == 1 then flagAIwing = 1 end
    end
    if selwing == 2 then -- s
        flagAIwing = 1
    end
    if selwing == 0 then
        flagAIwing = 0
        set(AIwing, 0)
        set(AIwingY, 0)
    end
    if selengc == 1 then if AIdetect == 1 then set(AIeng2, 1) end end
    if selengc == 2 then set(AIeng2, 1) end
    if selengc == 0 then set(AIeng2, 0) end
    if oapu == 1 then -- m
        set(overAPU, 1)
        if get(apun1) > 98 then
            set(xbleedpipe, 1) -- l
            set(xbleedpipel, 1)
            set(xbleedpiper, 1)
            set(bleedAPU, 4)
        else
            set(xbleedpipe, 0)
            set(xbleedpipel, 0)
            set(xbleedpiper, 0)
            set(bleedAPU, 2) -- ici bug si set(bleedAPU, 3)
        end
    end
    if oapu == 0 then -- m
        set(overAPU, 0)
        set(bleedAPU, 5) -- #########
        set(xbleedpipe, 0)
        set(xbleedpipel, 0)
        set(xbleedpiper, 0)
    end
    if oapu == 2 then -- m
        set(bleedAPU, 4)
        set(overAPU, 2)
    end
    if get(xbleedR) == 0 then -- a
        set(xbleedrs, 1) -- sy
    end
    if get(xbleedR) == 1 then
        set(xbleedrs, 2) -- s
    end
    if get(xbleedR) == 2 then -- a
        set(xbleedrs, 0) -- s

        if get(apun1) > 98 or flagAIwing == 1 then
            set(xbleedrs, 3) -- s
        end
    end
    if get(xbleedL) == 0 then
        set(xbleedls, 1) -- s
    end
    if get(xbleedL) == 1 then
        set(xbleedls, 2) -- s
    end
    if get(xbleedL) == 2 then -- a
        set(xbleedls, 0) -- synop on
        if get(apun1) > 98 or flagAIwing == 1 then
            set(xbleedls, 3) -- c
        end
    end
    if get(bleedl) == 1 then
        set(xbleedpipel, 1)
        if get(altlimit) > 10 then set(hp1, 1) end
    end
    if get(bleedr) == 1 then
        set(xbleedpiper, 1)
        if get(altlimit) > 10 then set(hp3, 1) end
    end
    if get(bleedc) == 1 and get(AIeng2) == 1 then
        set(lp2, 1)
    else
        set(lp2, 0)
    end
    if get(bleedc) == 1 and flagAIwing == 1 then
        set(lp2, 1)
        set(xbleedpipe, 1)
        set(xbleedrs, 3)
        set(xbleedls, 3)
    end

    local altAI = get(alttod)
    if altAI > 18000 then altAI = 18000 end
    local n1mini = (altAI * 0.00126) + 42.361 + (get(TAT) * -.266)
    if n1mini > 70 then n1mini = 70 end
    set(AIN1, n1mini) -- a
    -- AIdetect == 1 and 
    local indicn1 = get(indicN10)
    if flagAIwing == 1 and indicn1 < n1mini then
        set(flagn1y, 1)
        if indicn1 < (n1mini - 5) then
            set(AIwing, 0)
            set(AIwingY, 1)
        end
    else
        set(flagn1y, 0)
    end
    if flagAIwing == 1 and get(indicN10) > n1mini then
        set(AIwing, 1)
        set(AIwingY, 0)
    end
end

