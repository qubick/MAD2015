var http =  require('http')
const PORT = 8080;

//Serial comm with Arduino

var arduino = require('arduino')
	,board	= arduino.connect('/dev/cu.usbmodem1421')
	,ledState = arduino.LOW
	,ledPin = 13
	,interval
	,portName = '/dev/cu.usbmodem1421'

var SerialPort = require("serialport").SerialPort

function serialListener()
{
	var receivedData = ""
		,serialPort = new SerialPort(portName, {
			    baudrate: 9600,
		 	    // defaults for Arduino serial communication
		 	     dataBits: 8, 
		  	     parity: 'none', 
		  	     stopBits: 1, 
		  	     flowControl: false 
	});
	serialPort.on("open", function () {
	console.log('open serial communication');
	// Listens to incoming data
	
	serialPort.on('data', function(data) { 
		receivedData += data.toString();
		
		if (receivedData .indexOf('E') >= 0 && receivedData .indexOf('B') >= 0) {
		
			// save the data between 'B' and 'E'
			sendData = receivedData .substring(receivedData .indexOf('B') + 1, receivedData .indexOf('E'));
			
			receivedData = '';
			
			}
			// send the incoming data to browser with websockets.
			socketServer.emit('update', sendData);
		
		});  	
	});  
}

function handleRequest(req, res){

	console.log(req.method)
	if(req.method == "POST"){
		req.on('data', function(data){
		
			var msg = {"msg":"data received",
						"ack":data.toString()}
			var body = JSON.parse(data)
			var tag = parseInt(body.tag)

			if(res.write(JSON.stringify(msg)))
				console.log("got worked")
			
			//body += data

			console.log('Received data: ',data.toString())
			console.log('tag: ', typeof(tag), tag)

			//res.send(serialListner)
			socket.on('led', function(data){
				serialPort.write('0x00')
			})
			res.end() //end the request for next listening

/*
	board.pinMode(ledPin, arduino.OUTPUT)
	board.pinMode(ledPin, ledState) //arduino.LOW
	
	interval = setInterval(function(){

					board.digitalWrite(ledPin, (ledState = ledState === arduino.LOW && arduino.HIGH || arduino.LOW) );
				    console.log("LedState "+ (ledState === 0 ? 'OFF' : 'ON') );

					   }, 500); 
*/
		}) //res.on()
	}
//	res.end()
}

var server = http.createServer(handleRequest)

server.listen(PORT, function(){
	console.log("Server listening on: http://localhost: %s", PORT)	
	serialListener()
})

