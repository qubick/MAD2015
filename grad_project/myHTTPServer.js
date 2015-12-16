var http =  require('http')
const PORT = 8080;

//settings for Serial communication with Arduino
var interval
	,portName = '/dev/cu.usbmodem1421'
//	,portName = '/dev/cu.usbserial-DA011PDK'
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
			sendData = receivedData .substring(receivedData .indexOf('B') + 1, receivedData .indexOf('E'));
			sendData = '0x01'
			receivedData = ''
			
			}
			// send the incoming data to browser with websockets.
		//	socketServer.emit('update', sendData);

		
		
		});
	});  
//}

function handleRequest(req, res){

	console.log(req.method)
	if(req.method == "GET"){
		res.write('Success on accessing to the server')
	}
	if(req.method == "POST"){
		req.on('data', function(data){
		
			var msg = {"msg":"data received",
						"ack":data.toString()}
				,body = JSON.parse(data)
				,tag = parseInt(body.tag)
				,tune = body.tune

			if(res.write(JSON.stringify(msg)))
				console.log("got worked")
			
			console.log('Received data: ',data.toString())
			console.log('tag: ', typeof(tag), tag)
			console.log('tune: ', typeof(tune), tune)

			
			serialPort.write(tag, function(err, results){
			//serialPort.write(tune, function(err, results){
				if(err)
					console.log('err: ' + err)
				console.log('Respond data from Arduino: ' + results)
			});

			res.end('got message') //end the request for next listening

		}) //res.on()
	}
//	res.end()
}

var server = http.createServer(handleRequest)

server.listen(PORT, function(){
	console.log("Server listening on: http://localhost: %s", PORT)	
	//serialListener()
})

