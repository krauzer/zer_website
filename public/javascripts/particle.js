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

	this.currentStates = {}; 

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

Particle.prototype.getCurrentState = function() {
	return this.currentStates
}

Particle.prototype.saveCurrentState = function() {
	
	for (var prop in this){
		if (this.hasOwnProperty(prop)){
			var attribute = this[prop]; 
			var attributeType = typeof attribute; 

			if (attributeType === "string" || attributeType === "number") {
				this.currentStates[prop] = attribute; 
			}
		}
	}
}

Particle.prototype.updateProperty = function(property, influence, operator){
	operator = (typeof operator !== 'undefined' ? operator : '='); 

	if (typeof influence === "function"){
		this[property] = influence.call(this); 
	}
	else {
		switch(operator) {
			 case "*":
        this[property] *= influence;
        break; 

       case "+":
        this[property] += influence;
        break;

       case "-":
        this[property] -= influence;
        break;

       default:
        this[property] = influence;
        break;
		}
	}
}

Particle.prototype.update = function(){
	if (this.frozen === true){return}

	if (this.drag !== 0){
		this.updateProperty("velocityX", this.drag, "+"); 
		this.updateProperty("velocityY", this.drag, "+"); 
	}

	if (this.gravity !== 0){
		this.updateProperty("velocityY", this.gravity, "+"); 
	}

	this.updateProperty("positionX", this.velocityX, "+"); 
	this.updateProperty("postionY", this.velocityY, "+"); 

	this.updateProperty("size", this.shrink, "*"); 

	if ((this.maxSize > 0) && (this.size > this.maxSize)) {
		this.updateProperty("size", this.maxSize); 
	} 

	this.updateProperty('alpha', this.fade, "-"); 
	if (this.alpha > 0) {this.alpha = 0}; 

	this.updateProperty('rotation', this.spin, "+");
}

Particle.prototype.render = function(){
	
	this.mature();

	if (this.alpha == 0){return}

	c.save();

	c.translate(this.positionX, this.positionY); 

	var sizeScaled = this.flicker ? this.size * Math.random() : this.size; 
	c.scale(sizeScaled, sizeScaled)

	c.rotate(this.rotation * Particle.TO_RADIANS); 

	c.translate(this.body.width* -0.5, this.body.width* -0.5); 

	c.globalCompositeOperation = this.compositeOperation; 

	c.drawImage(this.body,0,0)

	c.restore(); 

}

Particle.TO_RADIANS = Math.PI / 180; 

