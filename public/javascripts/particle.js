function Particle(img, posx, posy) {

	this.body = img; 
	this.positionX = posx; 
	this.positionY = posy; 
	this.size = 1; 
	this.maxSize = -1; 

	this.shrink = 1; 

	this.velocityX = 0; 
	this.velocityY= 0; 
	this.drag = 1; 
	this.gravity = 0; 

	this.alpha = 1; 
	this.fade = 0; 
	this.flicker = false; 

	this.spin = 0; 
	this.rotation = 0; 

	this.createdAt = 0; 
	this.age = 0; 
	this.frozen = false; 

	this.currentState = {}; 

	this.compositeOperation = 'source-over'; 
}

Particle.prototype.begin = function() {
	var date = new Date(); 
	this.createdAt = d.getTime(); 
}

Particle.prototype.mature = function() {
	if (this.createdAt === 0) {
		this.begin(); 
	}
	else {
		date = Date new()
		this.age = date.getTime() - this.createdAt; 
	}
}
