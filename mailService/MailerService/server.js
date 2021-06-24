const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const nodemailer = require('nodemailer')
var request = require("request");
var dbConfig = require("./dbconfig");

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get("/", function(req,res){
    res.status(200).send("Hello World");
});

app.post('/checkEmail', async function (req, res) {

    var checkMailQuery = `SELECT COUNT("EMAILID") FROM "C12409E37A8B45C1A390C2EFC01D0C80"."SAP_CAPIRE_DEV_FEEDBACK"    
                where "EMAILID"='${req.body.emailId}'`;

    var userDetails = await userValid(checkMailQuery);
    console.log(userDetails);
    dbConfig.conn.disconnect();
    if(userDetails[0]['COUNT(EMAILID)'] > 0){
        res.status(200).send("Ho gaya");
    }
    else{
        res.status(204).send("No emailId exist");
    }
});

app.post('/checkReferenceId', async function (req, res) {

    var checkRefernceIdQuery = `SELECT "ID" FROM "C12409E37A8B45C1A390C2EFC01D0C80"."SAP_CAPIRE_DEV_FEEDBACK"    
                where "EMAILID"='${req.body.emailId}'`;

    var userDetails = await userValid(checkRefernceIdQuery);
    console.log(userDetails);
    dbConfig.conn.disconnect();

    for(var i=0;i<userDetails.length;i++){
        if(userDetails[i]['ID'] === req.body.id){
            res.status(200).send("Ho gaya");
        }
    }
    res.status(204).send("No data exist");
});

app.post('/pushToDB', async function (req, res) {

    var body = req.body;
    var updateQuery = `UPDATE "C12409E37A8B45C1A390C2EFC01D0C80"."SAP_CAPIRE_DEV_FEEDBACK"
                   SET "SERVICE_CODE"= '${body.service}',
                    "RESOLUTION_TIME_CODE"= '${body.resolution_time}',
                    "PERFORMANCE_CODE"= '${body.performance}',
                    "SERVICE_RATING"= '${body.service_rating}',
                    "UI_RATING"= '${body.ui_rating}',
                    "COMMENTS"= '${body.comments}'
                where "ID"= '${body.ID}' and "EMAILID"='${body.emailId}'`;

    var userDetails = await userValid(updateQuery);
    console.log(userDetails);
    dbConfig.conn.disconnect();
    res.status(200).send("Ho gaya");
});

app.post("/", function (req, res) {
    console.log( req.body.email);
    
    var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: '<>', //Type emailId and password here
          pass: '<>'
        }
      });
      
      var mailOptions = {
        from: '<>',  //Sender email
        to: req.body.email,
        subject: 'Incident Management Portal: Incident Resolved',
        text: 'Hi Sir/Madam,\n\nYour '+ req.body.category +' ticket with Title "'+ req.body.title +'" has been resolved.\n\nPlease visit https://feedbackform-t70f97ed967cc.dispatcher.eu2.hana.ondemand.com/ to share your valuable feedback. Use Reference ID "'+ req.body.ID +'" to login.\n\nThanks.'
      };
      
      transporter.sendMail(mailOptions, function(error, info){
        if (error) {
          console.log(error);
        } else {
          console.log('Email sent: ' + info.response);
        }
      });
      res.status(200).send("Email sent successfully");
});

app.listen(PORT, () => {
	console.log('Example app listening on port 3000!' + PORT);
});



var userValid = function (query) {
    return new Promise((resolve, reject) => {
        console.log("*********Inside isValid");

        dbConfig.conn.connect(dbConfig.conn_params, function (err) {
            if (err) {
                console.error("DB Error in isValid:: ", err);
                reject(err);
            }
            else {
                dbConfig.conn.exec(query, function (err, result) {
                    if (err) {
                        console.error("DB error :: ", err);
                        reject(err);
                    }
                    else {
                        console.log("Result", result);
                        resolve(result);
                        // var returnObject = {}
                        // if (result.length == 0) {
                        //     returnObject.isValid = false;
                        //     returnObject.status = "username or password are incorrect";
                        //     resolve(returnObject);
                        // }
                        // else {
                        //     returnObject.isValid = true;
                        //     returnObject.status = result[0].STATUS;
                        //     returnObject.city = result[0].CITY;
                        //     returnObject.contact = result[0].CONTACT;
                        //     resolve(returnObject);
                        // }
                    }
                });
            }
        });

    })
};