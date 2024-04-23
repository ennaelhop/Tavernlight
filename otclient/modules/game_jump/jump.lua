jumpWindow = nil
jumpMenuButton = nil
jumpPanel = nil
movingButton = nil
startingX = nil
startingY = nil

function init()
  
  jumpMenuButton = modules.client_topmenu.addRightGameToggleButton('jumpButton', 
	tr('Jump') .. '(Space)', '/images/topbuttons/jump', toggle)
	
  jumpMenuButton:setOn(false)
  
  g_keyboard.bindKeyDown('Space', toggle)
  
  jumpWindow = g_ui.loadUI('jump', modules.game_interface.getRightPanel())
  jumpWindow:hide()

  jumpPanel = jumpWindow:getChildById('contentsPanel')
  movingButton = jumpPanel:getChildById('movingButton')
  
  movingButton.onClick = onJumpButtonClick
  
  math.randomseed(os.time())
  
end

function terminate()
    g_keyboard.unbindKeyDown('Space')
	
	jumpWindow:destroy()
	jumpMenuButton:destroy()
end

function onJumpButtonClick()
	movingButton:move(getRandomPos())
end

function toggle()
	if jumpMenuButton:isOn() then
		jumpWindow:close()
		jumpMenuButton:setOn(false)
	else
		jumpWindow:open()
		jumpMenuButton:setOn(true)

		startingX = movingButton:getX()
		startingY = movingButton:getY()
		moveButton()
	end
end

function onMiniWindowClose()
  jumpMenuButton:setOn(false)
end

function moveButton()
	cycleEvent(function () 
		local decrement = 5
		local currentX = movingButton:getX()
		local newX = currentX - decrement

		if newX >= startingX + decrement then
			movingButton:setX(newX)
		else
			movingButton:move(getRandomPos())
		end
	end , 250)
end

function getRandomPos()
	local upperWidth = movingButton:getParent():getWidth() - movingButton:getWidth()
	local upperHeight = movingButton:getParent():getHeight() - movingButton:getHeight()
	
	local randomX = math.random(startingX, startingX + upperWidth)
	local randomY = math.random(startingY, startingY + upperHeight)

	return randomX, randomY
end