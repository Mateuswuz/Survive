function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Dodge_Note2' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Dodge_Note2'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1); 

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

local shootAnims = {"shot", "shot", "shot", "shot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Dodge_Note2' then
		if difficulty == 2 then
			playSound('Dodged', 1.0);-----------put your custom sound here
		end
		characterPlayAnim('dad', 'shot' , true);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Dodge_Note2' and difficulty == 2 then
		setProperty('health', -1);
		playSound('Dodged', 1.0); -----------put your custom sound here
	elseif noteType == 'Dodge_Note' and difficulty == 1 then
		setProperty('health', getProperty('health')-0.8);
		runTimer('bleed', 0.2, 20);
		playSound('Dodged', 1.0);-----------put your custom sound here
		characterPlayAnim('boyfriend', 'hurt', true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end