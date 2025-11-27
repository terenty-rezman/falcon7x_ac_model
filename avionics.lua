size = {2048, 1024}

-- Z
z_eng1_oil_press_override = createGlobalPropertyi(
                                "sim/custom/7x/z_eng1_oil_press_override", 0)

createProp("sim/custom/7x/z_syn_eng_start1", "int")
createProp("sim/custom/7x/z_syn_eng_start2", "int")
createProp("sim/custom/7x/z_syn_eng_start3", "int")
defineProperty("z_syn_eng_start1",
               globalPropertyi("sim/custom/7x/z_syn_eng_start1"))
defineProperty("z_syn_eng_start2",
               globalPropertyi("sim/custom/7x/z_syn_eng_start2"))
defineProperty("z_syn_eng_start3",
               globalPropertyi("sim/custom/7x/z_syn_eng_start3"))

createProp("sim/custom/7x/z_syn_eng_ign1", "int")
createProp("sim/custom/7x/z_syn_eng_ign2", "int")
createProp("sim/custom/7x/z_syn_eng_ign3", "int")

defineProperty("z_syn_eng_ign1",
               globalPropertyi("sim/custom/7x/z_syn_eng_ign1"))
defineProperty("z_syn_eng_ign2",
               globalPropertyi("sim/custom/7x/z_syn_eng_ign2"))
defineProperty("z_syn_eng_ign3",
               globalPropertyi("sim/custom/7x/z_syn_eng_ign3"))

createProp("sim/custom/7x/z_syn_eng_ab1", "int")
createProp("sim/custom/7x/z_syn_eng_ab2", "int")
createProp("sim/custom/7x/z_syn_eng_ab3", "int")
defineProperty("z_syn_eng_ab1",
               globalPropertyi("sim/custom/7x/z_syn_eng_ab1"))
defineProperty("z_syn_eng_ab2",
               globalPropertyi("sim/custom/7x/z_syn_eng_ab2"))
defineProperty("z_syn_eng_ab3",
               globalPropertyi("sim/custom/7x/z_syn_eng_ab3"))

createProp("sim/custom/7x/z_line_gen2_on", "int")
createProp("sim/custom/7x/z_line_bat2_ratgen_on", "int")
createProp("sim/custom/7x/z_line_apu_bat1_on", "int")
createProp("sim/custom/7x/z_line_gen1_gen3_on", "int")
defineProperty("z_line_gen2_on",
               globalPropertyi("sim/custom/7x/z_line_gen2_on"))
defineProperty("z_line_bat2_ratgen_on",
               globalPropertyi("sim/custom/7x/z_line_bat2_ratgen_on"))
defineProperty("z_line_apu_bat1_on",
               globalPropertyi("sim/custom/7x/z_line_apu_bat1_on"))
defineProperty("z_line_gen1_gen3_on",
               globalPropertyi("sim/custom/7x/z_line_gen1_gen3_on"))

z_eng1_oil_press = createGlobalPropertyf("sim/custom/7x/z_eng1_oil_press", 0)
z_original_eng1_oil_press = globalPropertyf(
                                "sim/cockpit2/engine/indicators/oil_pressure_psi")

z_apu_startup_stage = createGlobalPropertyi("sim/custom/7x/z_apu_startup_stage", 0)

z_oil_min_height_1 = createGlobalPropertyi("sim/custom/7x/z_oil_min_height_1", 0)
z_oil_min_height_2 = createGlobalPropertyi("sim/custom/7x/z_oil_min_height_2", 0)
z_oil_min_height_3 = createGlobalPropertyi("sim/custom/7x/z_oil_min_height_3", 0)

z_left_black_screen = createGlobalPropertyi("sim/custom/7x/z_left_black_screen", 0)
z_right_black_screen = createGlobalPropertyi("sim/custom/7x/z_right_black_screen", 0)
z_middle_up_black_screen = createGlobalPropertyi("sim/custom/7x/z_middle_up_black_screen", 0)
z_middle_down_black_screen = createGlobalPropertyi("sim/custom/7x/z_middle_down_black_screen", 0)
z_mini_black_screen = createGlobalPropertyi("sim/custom/7x/z_mini_black_screen", 0)

-- disable & enable fuel flow to engines from python
defineProperty("z_fuel_digital_1", createGlobalPropertyi("sim/custom/7x/z_fuel_digital_1", 1))
defineProperty("z_fuel_digital_2", createGlobalPropertyi("sim/custom/7x/z_fuel_digital_2", 1))
defineProperty("z_fuel_digital_3", createGlobalPropertyi("sim/custom/7x/z_fuel_digital_3", 1))

-- max thrust purple circle for synoptic indicator in degrees
defineProperty("z_thrust_purple_max_deg_1", createGlobalPropertyi("sim/custom/7x/z_thrust_purple_max_deg_1", 75))
defineProperty("z_thrust_purple_max_deg_2", createGlobalPropertyi("sim/custom/7x/z_thrust_purple_max_deg_2", 75))
defineProperty("z_thrust_purple_max_deg_3", createGlobalPropertyi("sim/custom/7x/z_thrust_purple_max_deg_3", 75))

-- ads
defineProperty("z_ads_pilot", createGlobalPropertyi("sim/custom/7x/z_ads_pilot", 1))
defineProperty("z_ads_copilot", createGlobalPropertyi("sim/custom/7x/z_ads_copilot", 2))
defineProperty("z_ads_fail_id", createGlobalPropertyi("sim/custom/7x/z_ads_fail", 0))
-- irs
defineProperty("z_irs_pilot", createGlobalPropertyi("sim/custom/7x/z_irs_pilot", 1))
defineProperty("z_irs_copilot", createGlobalPropertyi("sim/custom/7x/z_irs_copilot", 2))
-- fms
defineProperty("z_fms_pilot", createGlobalPropertyi("sim/custom/7x/z_fms_pilot", 1))
defineProperty("z_fms_copilot", createGlobalPropertyi("sim/custom/7x/z_fms_copilot", 2))
-- ra
defineProperty("z_ra_pilot", createGlobalPropertyi("sim/custom/7x/z_ra_pilot", 1))
defineProperty("z_ra_copilot", createGlobalPropertyi("sim/custom/7x/z_ra_copilot", 2))
-- vor
defineProperty("z_vor_pilot", createGlobalPropertyi("sim/custom/7x/z_vor_pilot", 1))
defineProperty("z_vor_copilot", createGlobalPropertyi("sim/custom/7x/z_vor_copilot", 2))
-- no slip compensation ads number
defineProperty("z_no_slip_comp", createGlobalPropertyi("sim/custom/7x/z_no_slip_comp", 0))
-- fuel tab valves, boost & pipes
defineProperty("z_fuel_xtk_13", createGlobalPropertyi("sim/custom/7x/z_fuel_xtk_13", 3))
defineProperty("z_fuel_xtk_23", createGlobalPropertyi("sim/custom/7x/z_fuel_xtk_23", 3))
defineProperty("z_fuel_xtk_12", createGlobalPropertyi("sim/custom/7x/z_fuel_xtk_12", 3))
defineProperty("z_fuel_xbp_12", createGlobalPropertyi("sim/custom/7x/z_fuel_xbp_12", 3))
defineProperty("z_fuel_xbp_13", createGlobalPropertyi("sim/custom/7x/z_fuel_xbp_13", 3))
defineProperty("z_fuel_xbp_23", createGlobalPropertyi("sim/custom/7x/z_fuel_xbp_23", 3))
defineProperty("z_fuel_boost1", createGlobalPropertyi("sim/custom/7x/z_fuel_boost1", 3))
defineProperty("z_fuel_boost2", createGlobalPropertyi("sim/custom/7x/z_fuel_boost2", 3))
defineProperty("z_fuel_boost3", createGlobalPropertyi("sim/custom/7x/z_fuel_boost3", 3))
defineProperty("z_fuel_pipe_t1t3", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_t1t3", 3))
defineProperty("z_fuel_pipe_t2t3", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_t2t3", 3))
defineProperty("z_fuel_pipe_t1t2", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_t1t2", 3))
defineProperty("z_fuel_pipe_t2apu", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_t2apu", 3))
defineProperty("z_fuel_pipe_xbp12", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_xbp12", 3))
defineProperty("z_fuel_pipe_xbp23", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_xbp23", 3))
defineProperty("z_fuel_pipe_xbp13", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_xbp13", 3))
defineProperty("z_fuel_pipe_t1e1", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_t1e1", 3))
defineProperty("z_fuel_pipe_t2e2", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_t2e2", 3))
defineProperty("z_fuel_pipe_t3e3", createGlobalPropertyi("sim/custom/7x/z_fuel_pipe_t3e3", 3))
defineProperty("z_fuel_eng1", createGlobalPropertyi("sim/custom/7x/z_fuel_eng1", 0))
defineProperty("z_fuel_eng2", createGlobalPropertyi("sim/custom/7x/z_fuel_eng2", 0))
defineProperty("z_fuel_eng3", createGlobalPropertyi("sim/custom/7x/z_fuel_eng3", 0))
defineProperty("z_fuel_apu", createGlobalPropertyi("sim/custom/7x/z_fuel_apu", 0))
defineProperty("z_rat_manual", createGlobalPropertyi("sim/custom/7x/z_rat_manual", 0))
-- Z

createProp("sim/custom/7x/checklist", "int")
defineProperty("checklist", globalPropertyi("sim/custom/7x/checklist"))
createProp("sim/custom/7x/spot", "float")
defineProperty("spot", globalPropertyf("sim/custom/7x/spot"))
defineProperty("spot1", globalPropertyf(
                   "sim/cockpit2/switches/panel_brightness_ratio[0]"));
defineProperty("spot2", globalPropertyf(
                   "sim/cockpit2/switches/panel_brightness_ratio[1]"));
defineProperty("spot3", globalPropertyf(
                   "sim/cockpit2/switches/panel_brightness_ratio[2]"));
defineProperty("lumpanel", globalPropertyf(
                   "sim/cockpit2/switches/instrument_brightness_ratio[0]"));
defineProperty("spoti", globalPropertyf(
                   "sim/cockpit2/switches/instrument_brightness_ratio[1]"));
defineProperty("spothead", globalPropertyf(
                   "sim/cockpit2/switches/instrument_brightness_ratio[4]")); -- ##### 
defineProperty("lumBU", globalPropertyf(
                   "sim/cockpit2/switches/instrument_brightness_ratio[3]"));
createProp("sim/custom/7x/paxlum", "int")
defineProperty("paxlum", globalPropertyi("sim/custom/7x/paxlum"))
defineProperty("flash",
               globalPropertyi("sim/flightmodel2/lights/strobe_flash_now"));
defineProperty("llsd", globalPropertyf(
                   "sim/cockpit2/switches/landing_lights_switch[1]"));
defineProperty("lld", globalPropertyf("sim/weapons/warhead_type[10]"))
defineProperty("llsg", globalPropertyf(
                   "sim/cockpit2/switches/landing_lights_switch[2]"));
defineProperty("llg", globalPropertyf("sim/weapons/warhead_type[11]"))
defineProperty("rat",
               globalPropertyi("sim/cockpit2/switches/ram_air_turbine_on"));
defineProperty("debuter", globalPropertyi("sim/operation/prefs/startup_running"));
defineProperty("bleedAPU", globalPropertyi(
                   "sim/cockpit2/pressurization/actuators/bleed_air_mode"))
defineProperty("SOV0", globalPropertyi("sim/weapons/warhead_type[0]")) -- shut off fuel valve
defineProperty("SOV1", globalPropertyi("sim/weapons/warhead_type[1]"))
defineProperty("SOV2", globalPropertyi("sim/weapons/warhead_type[2]"))
defineProperty("FireSOV0", globalPropertyi("sim/weapons/warhead_type[4]")) -- 
defineProperty("FireSOV1", globalPropertyi("sim/weapons/warhead_type[5]"))
defineProperty("FireSOV2", globalPropertyi("sim/weapons/warhead_type[6]"))
defineProperty("indicN10",
               globalPropertyf("sim/cockpit2/engine/indicators/N1_percent[0]"))
defineProperty("indicN11",
               globalPropertyf("sim/cockpit2/engine/indicators/N1_percent[1]"))
defineProperty("indicN12",
               globalPropertyf("sim/cockpit2/engine/indicators/N1_percent[2]"))
defineProperty("starteng", globalPropertyi("sim/weapons/warhead_type[3]")) -- bouton de start engine
defineProperty("starteng1",
               globalPropertyi("sim/cockpit2/engine/actuators/ignition_key[0]"))
defineProperty("starteng2",
               globalPropertyi("sim/cockpit2/engine/actuators/ignition_key[1]"))
defineProperty("starteng3",
               globalPropertyi("sim/cockpit2/engine/actuators/ignition_key[2]"))
createProp("sim/custom/7x/flageng0", "int")
defineProperty("flageng0", globalPropertyi("sim/custom/7x/flageng0"))
createProp("sim/custom/7x/flageng1", "int")
defineProperty("flageng1", globalPropertyi("sim/custom/7x/flageng1"))
createProp("sim/custom/7x/flageng2", "int")
defineProperty("flageng2", globalPropertyi("sim/custom/7x/flageng2"))
createProp("sim/custom/7x/fpump0", "int")
defineProperty("fpump0", globalPropertyi("sim/custom/7x/fpump0")) -- action
createProp("sim/custom/7x/fpump1", "int")
defineProperty("fpump1", globalPropertyi("sim/custom/7x/fpump1"))
createProp("sim/custom/7x/fpump2", "int")
defineProperty("fpump2", globalPropertyi("sim/custom/7x/fpump2"))
defineProperty("initfuel0",
               globalPropertyi("sim/cockpit2/fuel/fuel_tank_pump_on[0]"));
defineProperty("initfuel1",
               globalPropertyi("sim/cockpit2/fuel/fuel_tank_pump_on[1]"));
defineProperty("initfuel2",
               globalPropertyi("sim/cockpit2/fuel/fuel_tank_pump_on[2]"));
defineProperty("apun1",
               globalPropertyf("sim/cockpit2/electrical/APU_N1_percent"));
defineProperty("apu",
               globalPropertyi("sim/cockpit2/electrical/APU_generator_on"));
defineProperty("apurun",
               globalPropertyi("sim/cockpit2/electrical/APU_starter_switch"));
defineProperty("apuON", globalPropertyi("sim/cockpit2/electrical/APU_running"))
defineProperty("dump", globalPropertyf(
                   "sim/cockpit2/pressurization/actuators/dump_to_altitude_on"));
defineProperty("clim", globalPropertyi("sim/weapons/target_index[0]"));
defineProperty("oxy", globalPropertyi("sim/weapons/target_index[1]"));
defineProperty("bleedr", globalPropertyi("sim/weapons/mis_thrust2[19]"));
defineProperty("bleedl", globalPropertyi("sim/weapons/mis_thrust2[18]"));
defineProperty("bleedc", globalPropertyi("sim/weapons/mis_thrust2[17]"));
defineProperty("xbleedR", globalPropertyi("sim/weapons/mis_thrust2[1]"));
createProp("sim/custom/7x/xbleedrs", "int") -- statu
defineProperty("xbleedrs", globalPropertyi("sim/custom/7x/xbleedrs"))
defineProperty("xbleedL", globalPropertyi("sim/weapons/mis_thrust2[2]"));
createProp("sim/custom/7x/xbleedls", "int") -- statu
defineProperty("xbleedls", globalPropertyi("sim/custom/7x/xbleedls"))
defineProperty("xbleed3", globalPropertyi("sim/weapons/mis_thrust2[20]"));
defineProperty("ventg", globalPropertyi("sim/weapons/mis_thrust3[0]"));
defineProperty("ventb", globalPropertyi("sim/weapons/mis_thrust2[0]"));
createProp("sim/custom/7x/xbleedpipe", "int")
defineProperty("xbleedpipe", globalPropertyi("sim/custom/7x/xbleedpipe"))
createProp("sim/custom/7x/xbleedpipel", "int")
defineProperty("xbleedpipel", globalPropertyi("sim/custom/7x/xbleedpipel"))
createProp("sim/custom/7x/xbleedpiper", "int")
defineProperty("xbleedpiper", globalPropertyi("sim/custom/7x/xbleedpiper"))
createProp("sim/custom/7x/hp1", "int")
defineProperty("hp1", globalPropertyi("sim/custom/7x/hp1"))
createProp("sim/custom/7x/hp2", "int")
defineProperty("hp2", globalPropertyi("sim/custom/7x/hp2"))
createProp("sim/custom/7x/hp3", "int")
defineProperty("hp3", globalPropertyi("sim/custom/7x/hp3"))
createProp("sim/custom/7x/lp2", "int")
defineProperty("lp2", globalPropertyi("sim/custom/7x/lp2"))
defineProperty("AIeng2", globalPropertyi(
                   "sim/cockpit2/ice/ice_inlet_heat_on_per_engine[1]"));
defineProperty("AIwing", globalPropertyi("sim/cockpit2/ice/ice_surfce_heat_on"));
createProp("sim/custom/7x/AIwingY", "int")
defineProperty("AIwingY", globalPropertyi("sim/custom/7x/AIwingY")) -- pour aile jaune
createProp("sim/custom/7x/AIengcentre", "int")
defineProperty("AIengcentre", globalPropertyi("sim/custom/7x/AIengcentre"))
createProp("sim/custom/7x/AIwingsel", "int")
defineProperty("AIwingsel", globalPropertyi("sim/custom/7x/AIwingsel"))
createProp("sim/custom/7x/overAPU", "int")
defineProperty("overAPU", globalPropertyi("sim/custom/7x/overAPU")) -- bouton display Bleed APU overhead
createProp("sim/custom/7x/overAPUaction", "int")
defineProperty("overAPUaction", globalPropertyi("sim/custom/7x/overAPUaction")) -- bouton action Bleed APU overhead

createProp("sim/custom/7x/flagn1y", "int") -- pour affichage N1 sur fond amber
defineProperty("flagn1y", globalPropertyi("sim/custom/7x/flagn1y"))
createProp("sim/custom/7x/AIN1", "float")
defineProperty("AIN1", globalPropertyf("sim/custom/7x/AIN1"))
createProp("sim/custom/xap/ISA", "float")
defineProperty("isa", globalPropertyf("sim/custom/xap/ISA"))
defineProperty("TAT", globalPropertyf("sim/weather/temperature_le_c"))
defineProperty("TAMB", globalPropertyf("sim/weather/temperature_ambient_c"))
createProp("sim/custom/7X/TBAT", "float")
defineProperty("TBAT", globalPropertyf("sim/custom/7X/TBAT"))
defineProperty("pitot1",
               globalPropertyi("sim/cockpit2/ice/ice_pitot_heat_on_pilot"));
defineProperty("pitot2",
               globalPropertyi("sim/cockpit2/ice/ice_pitot_heat_on_copilot"));
defineProperty("pitot3", globalPropertyi("sim/cockpit2/ice/ice_AOA_heat_on"));
defineProperty("heatwind",
               globalPropertyi("sim/cockpit2/ice/ice_window_heat_on"));
defineProperty("AIAOAcop",
               globalPropertyi("sim/cockpit2/ice/ice_AOA_heat_on_copilot"));
defineProperty("icedetect",
               globalPropertyi("sim/cockpit/warnings/annunciators/ice"));
defineProperty("cabmaster", globalPropertyi("sim/weapons/mis_thrust2[4]"));
defineProperty("galmaster", globalPropertyi("sim/weapons/mis_thrust2[5]"));
defineProperty("pagebas1", globalPropertyi("sim/cockpit/weapons/firing_rate"));
defineProperty("autobrak",
               globalPropertyf("sim/cockpit2/controls/speedbrake_ratio"));
defineProperty("sova1", globalPropertyi("sim/weapons/mis_thrust2[22]"));
defineProperty("sova3", globalPropertyi("sim/weapons/mis_thrust2[23]"));
defineProperty("sovb2", globalPropertyi("sim/weapons/mis_thrust2[24]"));
defineProperty("sovb3", globalPropertyi("sim/weapons/mis_thrust3[2]"));
defineProperty("sovc2", globalPropertyi("sim/weapons/mis_thrust3[3]"));
defineProperty("hydratio", globalPropertyf("sim/operation/failures/rel_hydpmp"))
defineProperty("hydratio2",
               globalPropertyf("sim/operation/failures/rel_hydpmp2"))
defineProperty("hydratio3",
               globalPropertyf("sim/operation/failures/rel_hydpmp3"))
defineProperty("gearfail",
               globalPropertyf("sim/cockpit2/controls/gear_handle_down"))
defineProperty("hyd1", globalPropertyf(
                   "sim/cockpit2/hydraulics/indicators/hydraulic_pressure_1")); -- systeme A
defineProperty("hyd2", globalPropertyf(
                   "sim/cockpit2/hydraulics/indicators/hydraulic_pressure_2")); -- systeme B
createProp("sim/custom/7x/hyd3", "float")
defineProperty("hyd3", globalPropertyf("sim/custom/7x/hyd3")) -- system C � utiliser fonction N1
createProp("sim/custom/7x/hyd11", "float")
defineProperty("hyd11", globalPropertyf("sim/custom/7x/hyd11")) -- system C � utiliser fonction N1
createProp("sim/custom/7x/hyd22", "float")
defineProperty("hyd22", globalPropertyf("sim/custom/7x/hyd22")) -- system C � utiliser fonction N1
createProp("sim/custom/7x/wheels", "int")
defineProperty("wheels", globalPropertyi("sim/custom/7x/wheels"))
defineProperty("buhydro", globalPropertyf(
                   "sim/cockpit2/switches/electric_hydraulic_pump_on")); -- OFF / ON
createProp("sim/custom/7x/selecthyd", "int") -- overhead elect hyd pump 0= off, 1 =auto, 2= ON
defineProperty("selecthyd", globalPropertyi("sim/custom/7x/selecthyd"))
defineProperty("flap0", globalPropertyi(
                   "sim/flightmodel2/controls/flap_handle_deploy_ratio")); -- ########### TEST pour FLAP N/A
createProp("sim/custom/7x/genhyd", "int")
defineProperty("genhyd", globalPropertyi("sim/custom/7x/genhyd")) -- piping hydrau
createProp("sim/custom/7x/temphyd1", "float")
defineProperty("temphyd1", globalPropertyf("sim/custom/7x/temphyd1")) -- temperature hydrau
createProp("sim/custom/7x/temphyd2", "float")
defineProperty("temphyd2", globalPropertyf("sim/custom/7x/temphyd2"))
createProp("sim/custom/7x/temphyd3", "float")
defineProperty("temphyd3", globalPropertyf("sim/custom/7x/temphyd3"))
createProp("sim/custom/7x/lum1", "int")
defineProperty("lum1", globalPropertyi("sim/custom/7x/lum1"))
createProp("sim/custom/7x/lum2", "int")
defineProperty("lum2", globalPropertyi("sim/custom/7x/lum2"))
defineProperty("emrglight", globalPropertyi("sim/weapons/warhead_type[7]"));
defineProperty("emrglightb", globalPropertyi(
                   "sim/cockpit2/switches/generic_lights_switch[0]"));
defineProperty("bat", globalPropertyi("sim/cockpit2/electrical/battery_on[0]"));
defineProperty("batt0",
               globalPropertyi("sim/cockpit/electrical/battery_array_on[0]"));
defineProperty("batt1",
               globalPropertyi("sim/cockpit/electrical/battery_array_on[1]"));
defineProperty("inverter",
               globalPropertyi("sim/cockpit2/electrical/inverter_on"));
defineProperty("avionic",
               globalPropertyi("sim/cockpit2/switches/avionics_power_on"));
defineProperty("crosstie", globalPropertyi("sim/cockpit2/electrical/cross_tie"));
defineProperty("gen0",
               globalPropertyi("sim/cockpit2/electrical/generator_on[0]"));
defineProperty("gen1",
               globalPropertyi("sim/cockpit2/electrical/generator_on[1]"));
defineProperty("gen2",
               globalPropertyi("sim/cockpit2/electrical/generator_on[2]"));
createProp("sim/custom/7x/lhmaster", "int")
defineProperty("lhmaster", globalPropertyi("sim/custom/7x/lhmaster"))
createProp("sim/custom/7x/lhinit", "int")
defineProperty("lhinit", globalPropertyi("sim/custom/7x/lhinit"))
createProp("sim/custom/7x/rhinit", "int")
defineProperty("rhinit", globalPropertyi("sim/custom/7x/rhinit"))
createProp("sim/custom/7x/rhmaster", "int")
defineProperty("rhmaster", globalPropertyi("sim/custom/7x/rhmaster"))
createProp("sim/custom/7x/rhisol", "int")
defineProperty("rhisol", globalPropertyi("sim/custom/7x/rhisol"))
createProp("sim/custom/7x/lhisol", "int")
defineProperty("lhisol", globalPropertyi("sim/custom/7x/lhisol"))
defineProperty("hsimode", globalPropertyi("sim/cockpit2/EFIS/map_mode_is_HSI"));
defineProperty("mapmode", globalPropertyi("sim/cockpit2/EFIS/map_mode"))
defineProperty("TOT", globalPropertyf("sim/cockpit2/controls/elevator_trim"));
defineProperty("temps", globalPropertyf("sim/time/total_flight_time_sec"));
defineProperty("altlimit", globalPropertyf(
                   "sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot"));
defineProperty("m_total", globalPropertyf("sim/flightmodel/weight/m_total"));
defineProperty("flapmax", globalPropertyf(
                   "sim/flightmodel2/controls/flap_handle_deploy_ratio"));
defineProperty("flapdeg", globalPropertyf("sim/flightmodel2/wing/flap1_deg[1]"))
defineProperty("alttod", globalPropertyf(
                   "sim/cockpit2/gauges/indicators/altitude_ft_pilot"))
defineProperty("airspeed", globalPropertyf(
                   "sim/cockpit2/gauges/indicators/airspeed_kts_pilot"))
defineProperty("airspeedAP",
               globalPropertyf("sim/cockpit2/autopilot/airspeed_dial_kts_mach"))
defineProperty("groundspd",
               globalPropertyf("sim/flightmodel/position/groundspeed"))
defineProperty("hdgpa", globalPropertyf(
                   "sim/cockpit2/autopilot/heading_dial_deg_mag_pilot")) -- #### pour mon test de guidage heading avec PA
defineProperty("direction", globalPropertyf(
                   "sim/cockpit2/gauges/indicators/heading_electric_deg_mag_pilot"));
defineProperty("hdgtrk", globalPropertyf("sim/flightmodel/position/hpath")); -- new
createProp("sim/custom/xap/vref", "float")
createProp("sim/custom/xap/vrefb", "float")
createProp("sim/custom/xap/aproch", "float")
createProp("sim/custom/xap/aprochb", "float")
createProp("sim/custom/xap/VFTO", "float")
createProp("sim/custom/7x/VFTOb", "float")
createProp("sim/custom/7x/Vr", "float")
createProp("sim/custom/7x/Vrb", "float")
createProp("sim/custom/xap/VFR", "float")
createProp("sim/custom/7x/VFRb", "float")
createProp("sim/custom/7x/Vstall", "float")
createProp("sim/custom/7x/ROT", "float")
createProp("sim/custom/7x/pathread", "float")
createProp("sim/custom/7x/hdgtrkr", "float")
createProp("sim/custom/7x/altcruise", "int")
defineProperty("vref", globalPropertyf("sim/custom/xap/vref"));
defineProperty("vrefb", globalPropertyf("sim/custom/xap/vrefb"));
defineProperty("aproch", globalPropertyf("sim/custom/xap/aproch"));
defineProperty("aprochb", globalPropertyf("sim/custom/xap/aprochb"));
defineProperty("VFTO", globalPropertyf("sim/custom/xap/VFTO"));
defineProperty("VFTOb", globalPropertyf("sim/custom/7x/VFTOb"));
defineProperty("vitr", globalPropertyf("sim/custom/7x/Vr"))
defineProperty("vitrb", globalPropertyf("sim/custom/7x/Vrb"))
defineProperty("VFR", globalPropertyf("sim/custom/xap/VFR"));
defineProperty("VFRb", globalPropertyf("sim/custom/7x/VFRb"));
defineProperty("Vstall", globalPropertyf("sim/custom/7x/Vstall"));
defineProperty("ROT", globalPropertyf("sim/custom/7x/ROT"));
defineProperty("pathread", globalPropertyf("sim/custom/7x/pathread"));
defineProperty("hdgtrkr", globalPropertyf("sim/custom/7x/hdgtrkr"));
defineProperty("altcruise", globalPropertyi("sim/custom/7x/altcruise")); -- cruise altitude
defineProperty("Gforce", globalPropertyf("sim/flightmodel2/misc/gforce_normal"))
defineProperty("accelere", globalPropertyf(
                   "sim/cockpit2/gauges/indicators/airspeed_acceleration_kts_sec_pilot"))
createProp("sim/custom/7x/accelereb", "float")
defineProperty("accelereb", globalPropertyf("sim/custom/7x/accelereb"))
defineProperty("pitchdeg", globalPropertyf(
                   "sim/cockpit2/gauges/indicators/pitch_AHARS_deg_pilot"))
defineProperty("angleattack",
               globalPropertyf("sim/flightmodel2/misc/AoA_angle_degrees")) -- autre dataref a essayer sim/flightmodel/position/alpha
defineProperty("vpath", globalPropertyf("sim/flightmodel/position/vpath"))
defineProperty("pathcommand", globalPropertyf("sim/weapons/targ_h[0]")) -- bone du PA 
defineProperty("posivvi", globalPropertyf("sim/cockpit2/autopilot/vvi_status"))
defineProperty("actualvvi",
               globalPropertyf("sim/cockpit2/gauges/indicators/vvi_fpm_pilot"))
defineProperty("requetevvi",
               globalPropertyf("sim/cockpit2/autopilot/vvi_dial_fpm"))
createProp("sim/custom/7x/FPS", "float")
defineProperty("FPS", globalPropertyf("sim/custom/7x/FPS"));
createProp("sim/custom/7x/dirpitch", "float")
defineProperty("dirpitch", globalPropertyf("sim/custom/7x/dirpitch"));
createProp("sim/custom/7x/dirth", "float")
defineProperty("dirth", globalPropertyf("sim/custom/7x/dirth"));
defineProperty("pitchdir", globalPropertyf(
                   "sim/cockpit2/autopilot/flight_director_pitch_deg"))
defineProperty("pitchdirb",
               globalPropertyf("sim/cockpit2/autopilot/sync_hold_pitch_deg"))
defineProperty("rolldir", globalPropertyf(
                   "sim/cockpit2/autopilot/flight_director_roll_deg"))
defineProperty("roll", globalPropertyf(
                   "sim/cockpit2/gauges/indicators/roll_AHARS_deg_copilot"))
defineProperty("dialaltpa",
               globalPropertyf("sim/cockpit2/autopilot/altitude_dial_ft"))
defineProperty("paaltholdb",
               globalPropertyi("sim/cockpit2/autopilot/altitude_hold_status"))
defineProperty("paalthold",
               globalPropertyf("sim/cockpit2/autopilot/altitude_hold_ft"))
defineProperty("altpacommand", globalPropertyf("sim/weapons/warhead_type[20]")) -- pour bouton commande de ALT PA (quad dans PM)
defineProperty("syncroalt", globalPropertyi("sim/weapons/warhead_type[21]")); -- sur bouton alt pour syncro Alt
createProp("sim/custom/7x/valaltc", "int")
defineProperty("valaltc", globalPropertyi("sim/custom/7x/valaltc")) -- pour affichage ALT dans PA
createProp("sim/custom/7x/flydir", "int")
defineProperty("flydir", globalPropertyi("sim/custom/7x/flydir")) -- pour swich fly director
defineProperty("xpflydir",
               globalPropertyi("sim/cockpit2/autopilot/flight_director_mode")) -- pour set � 1 au d�part et minimum
createProp("sim/custom/xap/sendv", "int")
defineProperty("sendv", globalPropertyi("sim/custom/xap/sendv")) -- flag d'affichage EFIS AP RF
defineProperty("fuel_total",
               globalPropertyf("sim/flightmodel/weight/m_fuel_total"))
createProp("sim/custom/7x/fuel_used", "float")
defineProperty("fuel_used", globalPropertyf("sim/custom/7x/fuel_used"))
createProp("sim/custom/7x/fuel_used1", "float")
defineProperty("fuel_used1", globalPropertyf("sim/custom/7x/fuel_used1"))
createProp("sim/custom/7x/fuel_used2", "float")
defineProperty("fuel_used2", globalPropertyf("sim/custom/7x/fuel_used2"))
createProp("sim/custom/7x/fuel_used3", "float")
defineProperty("fuel_used3", globalPropertyf("sim/custom/7x/fuel_used3"))
createProp("sim/custom/7x/fuel_reset", "int")
defineProperty("fuel_reset", globalPropertyi("sim/custom/7x/fuel_reset"))
createProp("sim/custom/7x/sheme", "int")
defineProperty("sheme", globalPropertyi("sim/custom/7x/sheme"))
createProp("sim/custom/xap/fuelreserve", "int")
defineProperty("fuelreserve", globalPropertyi("sim/custom/xap/fuelreserve"))
createProp("sim/custom/xap/setfuel", "int")
defineProperty("setfuel", globalPropertyi("sim/custom/xap/setfuel"))
defineProperty("m_fuel1", globalPropertyf("sim/flightmodel/weight/m_fuel1"));
defineProperty("m_fuel2", globalPropertyf("sim/flightmodel/weight/m_fuel2"));
defineProperty("m_fuel3", globalPropertyf("sim/flightmodel/weight/m_fuel3"));
createProp("sim/custom/xap/altpisteD", "float")
defineProperty("altpisteD", globalPropertyf("sim/custom/xap/altpisteD"))
createProp("sim/custom/xap/dist_destination", "float") -- longueur de la piste
defineProperty("dist_destination",
               globalPropertyf("sim/custom/xap/dist_destination"))
createProp("sim/custom/xap/latdepart", "float")
defineProperty("latdepart", globalPropertyf("sim/custom/xap/latdepart"))
createProp("sim/custom/xap/longdepart", "float")
defineProperty("longdepart", globalPropertyf("sim/custom/xap/longdepart"))
createProp("sim/custom/xap/distancetrip", "float")
defineProperty("distancetrip", globalPropertyf("sim/custom/xap/distancetrip"))
createGlobalPropertys("sim/custom/7x/TOD", 10, "  ")
defineProperty("TOD", globalPropertys("sim/custom/7x/TOD", "string"))
createProp("sim/custom/7x/latarrive", "float")
defineProperty("latarrive", globalPropertyf("sim/custom/7x/latarrive"))
createProp("sim/custom/7x/longarrive", "float")
defineProperty("longarrive", globalPropertyf("sim/custom/7x/longarrive"))
createProp("sim/7x/selils", "int")
defineProperty("selils", globalPropertyi("sim/7x/selils"))
createProp("sim/7x/voiselils", "int")
defineProperty("voiselils", globalPropertyi("sim/7x/voiselils"))
defineProperty("backcourse",
               globalPropertyi("sim/cockpit/autopilot/backcourse_on"))
defineProperty("grs", globalPropertyf("sim/flightmodel/position/groundspeed"))
createProp("sim/custom/xap/spddescente", "float")
defineProperty("spddescente", globalPropertyf("sim/custom/xap/spddescente"))
defineProperty("payload", globalPropertyf("sim/flightmodel/weight/m_fixed"))
createProp("sim/custom/xap/pax", "int")
defineProperty("pax", globalPropertyi("sim/custom/xap/pax"))
createProp("sim/custom/xap/paxm", "int")
defineProperty("paxm", globalPropertyi("sim/custom/xap/paxm"))
createProp("sim/custom/xap/cargo", "int")
defineProperty("cargo", globalPropertyi("sim/custom/xap/cargo"))
createProp("sim/custom/xap/resfuel", "int")
defineProperty("resfuel", globalPropertyi("sim/custom/xap/resfuel"))
createProp("sim/custom/xap/nbaa", "float")
defineProperty("nbaa", globalPropertyf("sim/custom/xap/nbaa"))
createProp("sim/custom/xap/vfrres", "float")
defineProperty("vfrres", globalPropertyf("sim/custom/xap/vfrres"))
createProp("sim/custom/xap/fuelreslb", "float")
defineProperty("fuelreslb", globalPropertyf("sim/custom/xap/fuelreslb"))
createProp("sim/custom/xap/fueltrip", "float")
defineProperty("fueltrip", globalPropertyf("sim/custom/xap/fueltrip"))
createProp("sim/custom/xap/poidstempos", "float")
defineProperty("poidstempos", globalPropertyf("sim/custom/xap/poidstempos"))
defineProperty("latactuel", globalPropertyf("sim/flightmodel/position/latitude"))
defineProperty("longactuel",
               globalPropertyf("sim/flightmodel/position/longitude"))
defineProperty("varcapmagnet",
               globalPropertyf("sim/flightmodel/position/magnetic_variation")) -- ##### variation magn�tique sue le globe 
createProp("sim/custom/7x/rwyvisu", "int") -- heading de la piste
defineProperty("rwyvisu", globalPropertyi("sim/custom/7x/rwyvisu"))
defineProperty("nav1", globalPropertyf(
                   "sim/cockpit2/radios/actuators/nav1_frequency_hz"))
defineProperty("com1", globalPropertyf(
                   "sim/cockpit2/radios/actuators/com1_frequency_hz"))
defineProperty("com2", globalPropertyf(
                   "sim/cockpit2/radios/actuators/com2_frequency_hz"))
defineProperty("com1stby", globalPropertyf(
                   "sim/cockpit2/radios/actuators/com1_standby_frequency_hz"))
defineProperty("com2stby", globalPropertyf(
                   "sim/cockpit2/radios/actuators/com2_standby_frequency_hz"))
createProp("sim/custom/7x/com18", "int")
defineProperty("com18", globalPropertyi("sim/custom/7x/com18"))
createProp("sim/custom/7x/com28", "int")
defineProperty("com28", globalPropertyi("sim/custom/7x/com28"))
defineProperty("setils", globalPropertyf("sim/weapons/target_index[6]"))
defineProperty("rangils", globalPropertyf("sim/weapons/target_index[7]"))
defineProperty("freqils", globalPropertyf("sim/weapons/target_index[8]"))
defineProperty("truebear", globalPropertyf("sim/weapons/target_index[9]"))
createGlobalPropertys("sim/custom/xap/catils", 200, "  ")
defineProperty("catils", globalPropertys("sim/custom/xap/catils", "string")) -- perso
createProp("sim/custom/7x/choixmap", "float")
defineProperty("choixmap", globalPropertyf("sim/custom/7x/choixmap"))
createProp("sim/custom/xap/larpisteD", "float") -- largeur de la piste depart
defineProperty("larpisteD", globalPropertyf("sim/custom/xap/larpisteD"))
createProp("sim/custom/xap/hdgrwyD", "float") -- heading de la piste depart
defineProperty("hdgrwyD", globalPropertyf("sim/custom/xap/hdgrwyD"))
createProp("sim/custom/7x/latPdep", "float") -- #
defineProperty("latPdep", globalPropertyf("sim/custom/7x/latPdep"))
createProp("sim/custom/7x/longPdep", "float") -- ####
defineProperty("longPdep", globalPropertyf("sim/custom/7x/longPdep"))
createProp("sim/custom/xap/cap", "float") -- 
defineProperty("cap", globalPropertyf("sim/custom/xap/cap"))
createGlobalPropertys("sim/custom/7x/mapd", 50, "      ") -- perso
defineProperty("mapd", globalPropertys("sim/custom/7x/mapd", "string"))
defineProperty("commandelitmap")
createGlobalPropertys("sim/custom/7x/reecriture", 50, "      ") -- nom aeroport depart LFML
defineProperty("reecriture",
               globalPropertys("sim/custom/7x/reecriture", "string")) -- perso
createProp("sim/custom/xap/pointeur31", "float")
defineProperty("pointeur31", globalPropertyf("sim/custom/xap/pointeur31"))
createProp("sim/custom/xap/pointeur41", "float")
defineProperty("pointeur41", globalPropertyf("sim/custom/xap/pointeur41"))
defineProperty("closeImage", loadImage("close.png"))
defineProperty("window_height",
               globalPropertyi("sim/graphics/view/window_height"))
createProp("sim/7x/menu", "int")
defineProperty("menu", globalPropertyi("sim/7x/menu")) -- fenetre pour choix INAV ect..
createProp("sim/7x/cmenud", "int")
defineProperty("cmenud", globalPropertyi("sim/7x/cmenud")) -- pour detail du choix
createProp("sim/7x/fmssetup", "int")
defineProperty("fmssetup", globalPropertyi("sim/7x/fmssetup"))
createProp("sim/custom/7x/valeurstall", "float")
defineProperty("valeurstall", globalPropertyf("sim/custom/7x/valeurstall"))
createProp("sim/custom/7x/testvalalt", "float")
defineProperty("testvalalt", globalPropertyf("sim/custom/7x/testvalalt"))
createProp("sim/custom/7x/testvaleur", "int")
defineProperty("testvaleur", globalPropertyi("sim/custom/7x/testvaleur")) -- provisoire
createProp("sim/custom/7x/smap", "int")
defineProperty("smap", globalPropertyi("sim/custom/7x/smap")) -- provisoire pour test map switch NON UTILIS�
createProp("sim/custom/7x/testval114", "int")
defineProperty("testval114", globalPropertyi("sim/custom/7x/testval114")) -- provisoire
createGlobalPropertys("sim/custom/7x/teststring114", 200, "  ")
defineProperty("teststring114",
               globalPropertys("sim/custom/7x/teststring114", "string"))
defineProperty("cabinaltcible", globalPropertyf(
                   "sim/cockpit2/pressurization/actuators/cabin_altitude_ft"))
createGlobalPropertys("sim/custom/xap/decollage", 200, "        ") -- ################  MARSEILLE 
defineProperty("decollage",
               globalPropertys("sim/custom/xap/decollage", "string")) -- perso
createProp("sim/7x/choixtcas", "int") -- new
defineProperty("choixtcas", globalPropertyf("sim/7x/choixtcas"))
createProp("sim/7x/flagclimb", "int")
defineProperty("flagclimb", globalPropertyi("sim/7x/flagclimb"))
createProp("sim/7x/climb1", "int")
defineProperty("climb1", globalPropertyi("sim/7x/climb1"))
createProp("sim/7x/climb2", "int")
defineProperty("climb2", globalPropertyi("sim/7x/climb2"))
createProp("sim/7x/climb2M", "float")
defineProperty("climb2M", globalPropertyf("sim/7x/climb2M"))
defineProperty("speedinmach", globalPropertyf("sim/flightmodel/misc/machno")); -- new
defineProperty("machsw",
               globalPropertyf("sim/cockpit2/autopilot/airspeed_is_mach"));
defineProperty("altmod", globalPropertyi("sim/cockpit2/autopilot/altitude_mode"));
defineProperty("throttle", globalPropertyf(
                   "sim/cockpit2/engine/actuators/throttle_ratio_all"))
createProp("sim/7x/autoclimb", "int")
defineProperty("autoclimb", globalPropertyi("sim/7x/autoclimb"))
defineProperty("autothrottle",
               globalPropertyi("sim/cockpit2/autopilot/autothrottle_on"))
createProp("sim/custom/7x/hsi", "int")
defineProperty("hsi", globalPropertyi("sim/custom/7x/hsi"))
createProp("sim/custom/7x/seldata", "int")
defineProperty("seldata", globalPropertyi("sim/custom/7x/seldata"))
createProp("sim/custom/7x/sellss", "int")
defineProperty("sellss", globalPropertyi("sim/custom/7x/sellss"))
defineProperty("afttemp", globalPropertyi("sim/weapons/mis_thrust2[9]"));
defineProperty("crwtemp", globalPropertyi("sim/weapons/mis_thrust2[11]"));
defineProperty("fwdtemp", globalPropertyi("sim/weapons/mis_thrust2[10]"));
defineProperty("rattemp", globalPropertyi("sim/weapons/mis_thrust3[20]"));
defineProperty("tempssec", globalPropertyf("sim/time/total_running_time_sec"))
defineProperty("radio", globalPropertyf("sim/cockpit/weapons/firing_mode"))
defineProperty("WX", globalPropertyf("sim/cockpit2/EFIS/EFIS_weather_on"))
createProp("sim/7x/selcrzspdb", "float")
defineProperty("selcrzspdb", globalPropertyf("sim/7x/selcrzspdb"))
createProp("sim/7x/selcrzmanb", "int")
defineProperty("selcrzmanb", globalPropertyi("sim/7x/selcrzmanb"))
createProp("sim/7x/selcrzvb", "float")
defineProperty("selcrzvb", globalPropertyf("sim/7x/selcrzvb"))

local coef = get(window_height) / 1024
if coef > 1 then coef = 1 end
-- #######################################
set(altpisteD, get(alttod))

-- set(mapmode,1)
set(selcrzmanb, 80)
set(hsimode, 1)
set(dialaltpa, 37000)
set(oxy, 1)
set(autobrak, -0.5)
set(afttemp, -1)
set(fwdtemp, -1)
set(crwtemp, -1)
set(rattemp, -1)
set(climb2M, .80)
set(climb2, 300)
set(lumBU, 1)
set(pitot1, 1)
set(pitot2, 1)
set(pitot3, 1)
set(overAPUaction, 1)
set(lumpanel, 1)
set(clim, 1)
set(rat, 0)
set(pax, 8)
set(paxm, 170)
set(cargo, 500)
set(fuel_used1, 0)
set(fuel_used2, 0)
set(fuel_used3, 0)
set(radio, 1)
set(sellss, 1)
set(WX, 1)
set(z_syn_eng_start1, 0)
set(z_syn_eng_start2, 0)
set(z_syn_eng_start3, 0)
set(z_syn_eng_ign1, 0)
set(z_syn_eng_ign2, 0)
set(z_syn_eng_ign3, 0)
set(z_syn_eng_ab1, 0)
set(z_syn_eng_ab2, 0)
set(z_syn_eng_ab3, 0)

set(z_line_gen2_on, 0)
set(z_line_bat2_ratgen_on, 0)
set(z_line_apu_bat1_on, 0)
set(z_line_gen1_gen3_on, 0)
set(z_apu_startup_stage, 0)
set(z_oil_min_height_1, 0)
set(z_oil_min_height_2, 0)
set(z_oil_min_height_3, 0)
set(z_left_black_screen, 0)
set(z_right_black_screen, 0)
set(z_middle_up_black_screen, 0)
set(z_middle_down_black_screen, 0)
set(z_mini_black_screen, 0)
set(z_fuel_digital_1, 1)
set(z_fuel_digital_2, 1)
set(z_fuel_digital_3, 1)

if get(debuter) == 0 then
    set(gen0, 1)
    set(gen1, 1)
    set(gen2, 1)
    set(apu, 0)
    set(xbleedR, 2)
    set(xbleedL, 2)
    set(bleedAPU, 0)
    set(SOV0, 0)
    set(SOV1, 0)
    set(SOV2, 0)
    set(spot2, 1)
    set(selecthyd, 1)
    set(initfuel0, 0)
    set(initfuel1, 0)
    set(initfuel2, 0)
    set(dump, 1)
    set(fuel_used, 0)
    set(spoti, 0)
    set(xpflydir, 1)
    set(batt0, 0)
    set(batt1, 0)
    set(lld, 0)
    set(llg, 0)
end
if get(debuter) == 1 then
    set(xpflydir, 1)
    set(spot2, 1)
    set(bat, 1)
    set(selecthyd, 1)
    set(initfuel0, 1)
    set(fpump0, 2)
    set(initfuel1, 1)
    set(fpump1, 2)
    set(initfuel2, 1)
    set(fpump2, 2)
    set(bleedAPU, 2)
    set(bleedr, 1)
    set(bleedl, 1)
    set(bleedc, 1)
    set(heatwind, 1)
    set(AIAOAcop, 1)
    set(xbleedR, 2)
    set(xbleedL, 2)
    set(xbleed3, 2)
    set(ventg, 1)
    set(ventb, 3)
    set(pagebas1, 1)
    set(emrglight, 2)
    set(lhisol, 1)
    set(rhisol, 1)
    set(lhmaster, 1)
    set(rhmaster, 1)
    set(lhinit, 1)
    set(rhinit, 1)
    set(cabmaster, 2)
    set(galmaster, 2)
    set(dump, 1)
    set(TOT, .5)
    set(fuel_used, 0)
    set(fuelreslb, 500)
    set(lum1, 2)
    set(lum2, 2)
    set(SOV0, 1)
    set(SOV1, 1)
    set(SOV2, 1)
    set(lld, 2)
    set(llg, 2)
    set(spoti, 2)
    set(spot1, 2)
    set(altpacommand, 100)
    set(sendv, 1)
    set(cabinaltcible, get(alttod))
    set(apu, 0)
    set(apurun, 0)
    set(airspeedAP, 156)
end
components = {
    altcible {}, fuel {}, autospeed {}, visudir {position = {0, 210, 300, 210}}

}
