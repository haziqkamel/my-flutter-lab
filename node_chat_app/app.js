const express = require('express');

const app = express();

const server = require('http').createServer(app);

const io = require('socket.io')(server, {
    cors: {origin: '*'}
});

const httpProxy = require("http-proxy");

httpProxy
  .createProxyServer({
    target: "http://localhost:3000",
    ws: true,
  })
  .listen(80);


app.get('/health-check', (req, res) => {
    res.send('WebSocket is Healty');
  });
  
app.get('/', (req, res) => {
res.send('Websocket');
});


io.on('connection', (socket) => {
    console.log('Connected!')
    console.log(socket.id)

    socket.on('send-message', (message) => {
        console.log(message)

        socket.broadcast.emit('broadcast', message)
    })

    socket.on('disconnect', (socket) => {
        console.log('Disconnect!')
    })
})

server.listen(3000, () => {
    console.log('ws : server is running')
})



