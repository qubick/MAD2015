var http =  require('http')
const PORT = 8080;

//Serial comm with Arduino

var interval
	,portName = '/dev/cu.usbmodem1421'
	,SerialPort = require("serialport").SerialPort

//function serialListener()
//{
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
			//sendData = receivedData .substring(receivedData .indexOf('B') + 1, receivedData .indexOf('E'));
			sendData = '0x01'
			receivedData = ''
			
			}
			// send the incoming data to browser with websockets.
			socketServer.emit('update', sendData);
		
		});  	
	});  
//}

function handleRequest(req, res){

	console.log(req.method)
	if(req.method == "POST"){
		req.on('data', function(data){
		
			var msg = {"msg":"data received",
						"ack":data.toString()}
				,body = JSON.parse(data)
				,tag = parseInt(body.tag)

			if(res.write(JSON.stringify(msg)))
				console.log("got worked")
			
			console.log('Received data: ',data.toString())
			console.log('tag: ', typeof(tag), tag)

			//res.send(serialListner)
			
			serialPort.write('0x01', function(err, results){
				console.log('err: ' + err)
				console.log('results: ' + results)
			});

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
	//serialListener()
})

