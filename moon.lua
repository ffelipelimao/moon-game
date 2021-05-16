-- title:  moon
-- author: game developer
-- desc:   short description
-- script: lua

game = {
	width = 240,
	height = 136
}

hero = {
	x = game.width/2,
	y = game.height/2,
	width = 10,
	height = 15,
	color = 11,
	direction = 0,
	sprite = 2,
	speed = 1,
	weapon = false,
	attack = false,
}
	
function TIC()
	cls()
	draw(hero)
	movements(hero)
end

function draw(char)
	spr(char.sprite,char.x,char.y,0,1,char.direction,0)
	weapon(char)
end

function movements()
	if btn(0) and hero.y > 0 
		then hero.y = hero.y - hero.speed 
	  	hero.sprite = 1
	  	weapon(hero)
    end
	if btn(1) and hero.y + hero.height < game.height 
		then hero.y = hero.y + hero.speed
	  	hero.sprite = 2 
	  	weapon(hero)
	end
	if btn(2) and hero.x > 0 
		then hero.x = hero.x - hero.speed 
	  	hero.sprite = 0
	  	hero.direction = 1
	  	weapon(hero)
	end
	if btn(3) and hero.x + hero.width < game.width 
		then hero.x = hero.x + hero.speed
	  	hero.sprite = 0
	  	hero.direction = 0 
	  	weapon(hero)
	end
	if btn(6) then hero.weapon = true end
	if btn(7) then hero.weapon = false end
	if btn(5) and hero.weapon then hero.attack=true end
end

function weapon(hero)
	if hero.weapon and hero.attack == false  then 
		spr(3,hero.x+3,hero.y,0,1,hero.direction,0) 
				
	end 

	if hero.weapon and hero.attack then 
		spr(3,hero.x+4,hero.y,0,1,hero.direction,-3)
		hero.attack = false
	end
end

function attack()
	
end