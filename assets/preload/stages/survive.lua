function onCreate()
    makeLuaSprite('bg','bg',-65,-350)
    setScrollFactor('bg', 1.1, 1.1);
    scaleObject('bg', 1.7,1.7)
    addLuaSprite('bg')
    
    makeLuaSprite('favelachique','favelachique',-65,-350)
    scaleObject('favelachique', 1.7,1.7)
    addLuaSprite('favelachique')
    
    makeLuaSprite('pisowsangue','pisowsangue',-65,-350)
    scaleObject('pisowsangue', 1.7,1.7)
    addLuaSprite('pisowsangue')
    
    makeLuaSprite('poste','poste',-65,-250)
    scaleObject('poste', 1.7,1.7)
    addLuaSprite('poste')
    
    makeAnimatedLuaSprite('gf-bf','gf-bf',1275,375)
    addAnimationByPrefix('gf-bf','gf-bf','Bf and GF Speaker Idle',24,true)
    addLuaSprite('gf-bf',true)
    
    close(true)
end