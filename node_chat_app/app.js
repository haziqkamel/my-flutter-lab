const express = require('express');

const app = express();
const PORT = process.env.PORT || 4000;
const server = app.listen(PORT, ()=>{console.log('Server is Started', PORT);
});

const io = require('socket.io')(server);

const connectedUser = new Set();
io.on('connection', (socket) => {
    console.log('Connected Successfully', socket.id);
    io.emit('connected-user', connectedUser.size);
    connectedUser.add(socket.id);
    socket.on('disconnect', () => {
    console.log('Disconnected', socket.id);
    connectedUser.delete(socket.id);
    });
    socket.on('message', (data) => {
        console.log(data);
        socket.broadcast.emit('message-receive', data);
    });
});