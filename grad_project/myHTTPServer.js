var http =  require('http')
const PORT = 8080;
var formOutput = '<html><body>'+' data get '

function handleRequest(req, res){

	console.log(req.method)
	if(req.method == "POST"){

		req.on('data', function(data){
		
			var msg = {"msg":"data received",
						"ack":data.toString()}
			var body = ''

			if(res.write(JSON.stringify(msg)))
				console.log("got worked")
			
			body += data

			console.log('Received data: ',data.toString())
			res.end() //write to client
		})
	}
//	res.end()
}

var server = http.createServer(handleRequest)

server.listen(PORT, function(){
	console.log("Server listening on: http://localhost: %s", PORT)
})
