createProp("sim/7x/climbdepkt", "int")
defineProperty("climbdepkt", globalPropertyi("sim/7x/climbdepkt")) -- p
createProp("sim/7x/climbagl", "int")
defineProperty("climbagl", globalPropertyi("sim/7x/climbagl")) -- p
createProp("sim/7x/climbnm", "int")
defineProperty("climbnm", globalPropertyi("sim/7x/climbnm")) -- p

createProp("sim/7x/desc1", "int")
defineProperty("desc1", globalPropertyi("sim/7x/desc1")) -- p
createProp("sim/7x/desc3spdkt", "int")
defineProperty("desc3spdkt", globalPropertyi("sim/7x/desc3spdkt")) -- p

createProp("sim/7x/desc3spdM", "float")
defineProperty("desc3spdM", globalPropertyf("sim/7x/desc3spdM"))

createProp("sim/7x/desc3path", "int")
defineProperty("desc3path", globalPropertyi("sim/7x/desc3path"))

createProp("sim/7x/desc2path", "int")
defineProperty("desc2path", globalPropertyi("sim/7x/desc2path"))

createProp("sim/7x/spdrest", "int") -- v en dessous de 10000
defineProperty("spdrest", globalPropertyi("sim/7x/spdrest"))
createProp("sim/7x/altrest", "int")
defineProperty("altrest", globalPropertyi("sim/7x/altrest"))

defineProperty("sbrk", globalPropertyf("sim/flightmodel/controls/sbrkrat"))
defineProperty("TAS", globalPropertyf("sim/flightmodel/position/true_airspeed"))

defineProperty("throttleon",
               globalPropertyf("sim/cockpit2/autopilot/autothrottle_enabled"))

createProp("sim/7x/prot", "int")
defineProperty("prot", globalPropertyi("sim/7x/prot"))

set(spdrest, 250)
set(altrest, 100)
set(fmssetup, 2)
set(climbdepkt, 170)
set(climbagl, 25)
set(climbnm, 4)
set(desc3spdM, .80)
set(desc3spdkt, 270)
set(desc3path, 3)
set(desc2path, 4)
set(desc1, 2)
local altpa = 0
local altmaintenant = 0
local actvvi = 0
local s = 0
local climb = 0

local altitud = 0
local mmo = 0
local difaltpa = 0
local vm = 0
local vMI = 0
local vmo = 0
local spdmach = 0
local cs = 0
local spdMKT = 0

local difpath = 0
local deltavvi = 0

local pathc = 0

local coef = 0
local a = 0
local b = 0
local c = 0

function update()

    altpa = get(dialaltpa) --
    altmaintenant = get(alttod) --
    actvvi = get(actualvvi) --
    s = get(airspeed) -- 
    climb = get(altmod) --
    spdmach = get(speedinmach)

    if altmaintenant <= 10000 then --
        b = ((20 / 10000) * altmaintenant) + 350
        a = s
        c = .1

    elseif altmaintenant > 10000 and altmaintenant < 27000 then -- 
        b = 370
        a = s
        c = .1

    elseif altmaintenant >= 27000 then
        b = .9
        a = spdmach
        c = 100
    end

    spdprotect()

    if get(xpflydir) == 2 then
        difaltpa = altpa - altmaintenant
        if difaltpa > 1 then
            set(flagclimb, 1)
        else
            set(flagclimb, 0)
        end
        if get(climb1) == 0 then
            vm = 260
            vMI = .78
        else
            vm = get(climb2) -- 
            vMI = get(climb2M)
        end
        if climb == 5 and altpa > altmaintenant then
            -- set(throttleon,1)
            pathc = 0
            path()
            if spdmach > vMI then set(machsw, 1) end
            if get(throttle) > .905 then set(throttle, .905) end

            if get(altlimit) < get(climbagl) * 100 then
                set(airspeedAP, get(climbdepkt))
            end
            if get(altlimit) > get(climbagl) * 100 then
                if altmaintenant < get(altrest) * 100 then
                    set(machsw, 0)
                    set(airspeedAP, get(spdrest))
                end
            end
            if altmaintenant > get(altrest) * 100 then
                if get(machsw) == 0 then set(airspeedAP, vm) end
                if get(machsw) == 1 then set(airspeedAP, vMI) end
            end
        end
        if get(autoclimb) == 1 then
            if get(desc1) == 0 then
                pathc = -6
                path()

                if spdmach > .74 and get(airspeed) < 300 then
                    set(machsw, 1)
                else
                    set(machsw, 0)
                end
                spdrestriction()
                if altmaintenant > (get(altrest) * 100) + 2000 then
                    if get(machsw) == 0 then
                        set(airspeedAP, 300)
                        a = s
                        b = 305
                        c = .1
                        spdprotect()

                    end

                    if get(machsw) == 1 then
                        set(airspeedAP, .8)
                        a = spdmach
                        b = .805
                        c = 100
                        spdprotect()

                    end
                end
            end
            if get(desc1) == 2 then

                pathc = get(desc3path) * -2
                path()

                if get(desc3spdkt) > s then -- ICI
                    set(machsw, 1)
                else
                    set(machsw, 0)
                end
                spdrestriction()
                if altmaintenant > (get(altrest) * 100) + 2000 then
                    if get(machsw) == 0 then
                        set(airspeedAP, get(desc3spdkt))
                        a = s - 5
                        b = get(desc3spdkt)
                        c = .1
                        spdprotect()

                    end

                    if get(machsw) == 1 then
                        set(airspeedAP, get(desc3spdM)) -- ici
                        a = spdmach - .01
                        b = get(desc3spdM)
                        c = 100
                        spdprotect()

                    end

                end
            end

            if get(desc1) == 1 then
                pathc = get(desc2path) * -2 -- ici
                path()

                spdrestriction()

            end
        end

        if climb == 6 then set(autoclimb, 0) end

    end -- 

end -- 

function spdprotect()

    if a > b then
        set(prot, 1)
        coef = (a - b) * c
        if coef > .5 then coef = .5 end
        set(sbrk, coef)

    else
        set(prot, 0)
    end

end

function spdrestriction()
    if altmaintenant < (get(altrest) * 100) + 2000 then
        set(machsw, 0)
        set(airspeedAP, get(spdrest))

        if s > get(spdrest) + 5 then
            coef = (s - get(spdrest)) * .1
            if coef > .5 then coef = .5 end
            set(sbrk, coef)
        end
    end
end

function path()
    local gvpath = get(vpath)
    difpath = pathc - gvpath
    set(pitchdirb, get(angleattack) + difpath)
    set(pathread, (.5011 * pathc) - .0285) --		
    set(pathcommand, gvpath) --
end

-- check ok le 18/7/18

