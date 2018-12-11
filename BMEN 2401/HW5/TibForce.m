% Emily Robideau, 10-3-18
function f = TibForce(a)
radius = 1.5 + 0.033*a;
length = 15.3 + 0.37*a;
stress = 48.41 + 3.07*a;
ami = (pi*(radius)^4)/4;
f = (8 * stress * ami)/(2*radius*length);