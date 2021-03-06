$(document).ready ->

  letter1  = $('#order-firstLetter')
  letter2  = $('#order-secondLetter')
  material = $('#order-material')
  rerender = $('#order-rerender')
  
  wrapper  = $('.rendering-wrapper')
  letters  = $('#order-firstLetter, #order-secondLetter')

  cam      = null
  scn      = null
  currName = 'AL'
  currMat  = 'Stainless Steel'

  #-----------  Lagoa Initilizers  -----------#

  checkLoaded = ->
    lapi._embedRPC "ACTIVEAPP.getSceneLoaded();", (in_response) ->
      if in_response.data is true
        clearInterval timer
        lapi.startRender()
      return

  timer = setInterval(checkLoaded, 100)

  lapi.onSceneLoaded = ->
    setUpScene()

  #-----------  Bind Acions  -----------#

  letters.bind 'focus', ->
    $(@).val('')

  letters.bind 'keyup blur', ->
    node = $(@)
    node.val node.val().replace(/[^A-Za-z]/g,'')
    @value = @value.toUpperCase()

  rerender.bind 'click', ->
    loadInitials()

  material.bind 'change', ->
    currMat = $(@).find('option:selected').text()
    applyMaterialToAllMeshes(currMat)

  #-----------  Render Functions  -----------#

  setUpScene = ->
    scn = lapi.getActiveScene()
    setTimeout (->
      # lapi.startRender(); ///Start rendering
      lapi._embedRPC "ACTIVEAPP.vpman.setActiveIndicatorColor('" + "rgba(84,84,84,1)" + "')" #change the lagoa border color
      lapi.enableMouseInteractions false #stop mouse interations except for orbit
      lapi.orbitTool()
      cam = lapi.getCamera()
      setupStage()
      setupCam()
      return
    ), 300
    return

  loadInitials = ->
    name = letter1.val() + letter2.val()
    obj = scn.getObjectByName(name)[0]

    unless obj
      if currName
        c = scn.getObjectByName(currName)[0]
        
        # Hide C
        c.setParameters
          Visibility:
            visible: false

          RenderSettings:
            renderVisible: false
            shadowCast: false

      lapi.fetchAssets
        projects: [32777]
        datatypes: [
          14
          21
        ]
        tags: [name]
        match: true
      , loadAssets.bind(null, name)
      currName = name
    else
      if currName isnt name
        c = scn.getObjectByName(currName)[0]
        
        # Hide C
        c.setParameters
          Visibility:
            visible: false

          RenderSettings:
            renderVisible: false
            shadowCast: false

        currName = name
        n = scn.getObjectByName(name)[0]
        
        # Show N
        n.setParameters
          Visibility:
            visible: false

          RenderSettings:
            renderVisible: true
            shadowCast: true

    return

  applyMaterialToAllMeshes = (in_material) ->
    i = 0
    meshes = scn.getMeshes()

    while i < meshes.length
      objName = meshes[i].properties.getParameter("name").value
      lapi.applyMaterialToMeshByName in_material, objName
      ++i
    return

  setMaterial = (in_material) ->
    currMat = in_material
    lapi.applyMaterialToMeshByName currMat, currName
    return

  zoomPlus = (in_Direction) ->
    zoomVal = cam.getProperty("Lens").parameters.zoom.value
    if zoomVal >= 50
      false
    else
      cam.getProperty("Lens").parameters.zoom.value = 50
    return

  zoomMinus = ->
    zoomVal = cam.getProperty("Lens").parameters.zoom.value
    if zoomVal <= 24
      false
    else
      cam.getProperty("Lens").parameters.zoom.value = 24
    return

  setupStage = ->
    wrapper.addClass('is-rendered')
    return

  setupCam = ->
    cam.getProperty("Lens").parameters.zoom.value = 24
    lapi.setObjectParameters cam.guid,
      Position:
        x: -3.3
        y: 1.5
        z: 3.3

      TargetPosition:
        x: 0
        y: .22
        z: 0

    return

  cameraPerspLeft = ->
    lapi.setObjectParameters cam.guid,
      Position:
        x: -3.3
        y: 1.5
        z: 3.3

      TargetPosition:
        x: 0
        y: .22
        z: 0

    return

  cameraFront = ->
    lapi.setObjectParameters cam.guid,
      Position:
        x: 0
        y: .27
        z: 5

      TargetPosition:
        x: 0
        y: .27
        z: 0

    return

  cameraBack = ->
    lapi.setObjectParameters cam.guid,
      Position:
        x: 0
        y: .27
        z: -5

      TargetPosition:
        x: 0
        y: .27
        z: 0

    return

  loadAssets = (name, assets) ->
    objArray = []
    i = 0

    while i < assets.length
      asset = assets[i]
      obj =
        name: asset.name
        datatype: asset.latest.datatype_id
        version_guid: asset.latest.guid

      objArray.push obj
      ++i
    return  unless objArray.length
    lapi.getActiveScene().addAssets objArray, (e) ->
      guids = {}
      k = 0

      while k < e.data.length
        guids[e.data[k]] = true
        ++k
      lapi.applyMaterialToMeshByName currMat, currName
      obj = scn.getObjectByName(currName)[0]
      obj.setParameters
        Visibility:
          visible: false

        RenderSettings:
          renderVisible: true
          shadowCast: true

      applyMaterialToAllMeshes(currMat)          
      return

    return