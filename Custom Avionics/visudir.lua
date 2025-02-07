size = {300, 210}
defineProperty("Ffirector", loadImage("cadre.png", 230, 494, 81, 17))
defineProperty("pathact", loadImage("cadre.png", 230, 476, 81, 17))
defineProperty("thrustb", loadImage("cadre.png", 230, 451, 15, 25))
defineProperty("accelb", loadImage("cadre.png", 230, 426, 81, 25))
function draw()
    local il = get(lumpanel)
    drawAll(components)
    if get(flydir) > 0 then
        drawRotatedTexture(get(Ffirector), get(rolldir) - get(roll), 155,
                           (get(dirpitch) * 4.5) + 102, 81, 17, il, il, il)
        drawRotatedTexture(get(pathact), 0, 155, (get(FPS) * 4.5) + 102, 81, 17,
                           il, il, il)
        drawRotatedTexture(get(accelb), 0, 155, (get(accelereb) * 4.5) + 98, 81,
                           25, il, il, il)
    end
    if get(flydir) > 1 then
        drawRotatedTexture(get(thrustb), 0, 155, (get(dirth) * 4.5) + 98, 15,
                           25, il, il, il)
    end
end
