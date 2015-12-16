var http = require('http')
	

const PORT = 8080

function handleRequest(req, res){
	console.log(req.method)
	
	if(req.method == "POST"){
		console.log('post')
		res.end('eneded up post')
	}

	if(req.method == "GET"){
		console.log('get')
		/*req.on('data', function(data){
		
		})*/
		res.end('endded up get')
	}
}

var server = http.createServer(handleRequest)
server.listen(PORT, function(){
	console.log("Server listening on: http://localhost: %s", PORT)
})
