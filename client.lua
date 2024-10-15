RegisterKeyMapping('rockstar_editor', 'Rockstar Editor', 'keyboard', 'F4')
RegisterCommand('rockstar_editor', function()
    local options = {}
    if not IsRecording() then
        table.insert(options, {label = "Lancer l'enregistrement", args = {action = 'start'}, icon = 'video'})
    else
        table.insert(options, {label = "Arrêter l'enregistrement", values = {"Arrêter et sauvegarder", "Arrêter sans sauvegarder"}, args = {action = 'stop'}, icon = 'video'})
    end
    table.insert(options, {label = "Fermer", args = {action = 'close'}, icon = 'close'})
    lib.registerMenu({
        id = 'rockstar_editor',
        title = 'Rockstar Editor',
        position = 'top-left',
        onSideScroll = function(selected, scrollIndex, args)
        end,
        onSelected = function(selected, secondary, args)
        end,
        options = options
    }, function(selected, scrollIndex, args)
        if args.action == 'start' then
            StartRecording(1)
        elseif args.action == 'stop' then
            if selected == 1 then
                StopRecordingAndSaveClip()
            else
                StopRecordingAndDiscardClip()
            end
        elseif args.action == 'close' then
            lib.hideMenu('rockstar_editor')
        end
    end)
    lib.showMenu('rockstar_editor')
end, false)