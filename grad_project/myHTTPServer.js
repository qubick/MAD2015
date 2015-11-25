var http =  require('http')
const PORT = 8080;
var formOutput = '<html><body>'+' data get '

function handleRequest(req, res){

	console.log(req.method)
	if(req.method == "POST"){
		var data = {"msg":"yes"}
		var body = ''

		if(res.write(JSON.stringify(data)))
			console.log("got worked")

		req.on('data', function(data){
			body += data
			console.log('data: ',data.toString())
		})
	}
	//res.end('It Works! Path Hit: ', + req)
	res.end()
}

var server = http.createServer(handleRequest)

server.listen(PORT, function(){
	console.log("Server listening on: http://localhost: %s", PORT)
})
