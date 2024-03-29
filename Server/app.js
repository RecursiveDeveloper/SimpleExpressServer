const express = require("express");
const path = require("path");
const bodyParser = require('body-parser');
const app = express();

const routes = require("./routes/index");

//Settings
app.set('port', process.env.EXP_PORT || 3000);
app.set('views', path.join(__dirname,'views'));
app.set('view engine', 'ejs');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

//Routes
app.use(routes);

//Static Files
app.use(express.static(path.join(__dirname,'public')));

//Start the Server
app.listen(app.get('port'), () => {
    console.log("Server running on port", app.get('port'));
});
