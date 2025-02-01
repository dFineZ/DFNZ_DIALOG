local cam

function openDialog(ped, name, data)
    local cam = createCam(ped)
    if not cam then 
        repeat
        Wait(50)
        until cam
    end
    local options = {}
    for k, v in pairs(data) do
        table.insert(options, {
            title = v.title,
            description = v.description,
            icon = v.icon,
            iconColor = v.iconColor,
            iconAnimation = v.iconAnimation,
            image = v.image,
            arrow = v.arrow,
            readOnly = v.readOnly,
            metadata = v.metadata,
            onSelect = v.onSelect
        })
    end
    lib.registerContext({
        id = 'dialog_'..ped, 
        title = name, 
        options = options, 
        onExit = function()
            closeDialog()
        end
    })
    lib.showContext('dialog_'..ped)    
end

-- cam create
function createCam(ped)
    local coords = GetEntityCoords(ped, true)
    local x, y, z = coords.x + GetEntityForwardX(ped) * 1.2, coords.y + GetEntityForwardY(ped) * 1.2, coords.z + 0.52
    local camRot = GetEntityRotation(ped, 2)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x, y, z, camRot.x, camRot.y, camRot.z + 181.0, GetGameplayCamFov(), false, 0)

    SetCamActive(cam, true)
    RenderScriptCams(true, true, Config.CamSettings.transition, true, true)
    Wait(Config.CamSettings.transition - 300)
    return true
end

-- cam remove
function closeDialog()
    if Config.CamSettings.fast then
        RenderScriptCams(false, true, Config.CamSettings.transition, true, false)
        DestroyCam(cam, false)
    else
        RenderScriptCams(false, true, 0, true, false)
        DestroyCam(cam, false)
    end
    
end
