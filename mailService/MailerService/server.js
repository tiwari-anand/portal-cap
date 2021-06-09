const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const nodemailer = require('nodemailer')

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get("/", function(req,res){
    res.status(200).send("Hello World");
})

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
        subject: 'IMPORTANT: End Sem Project submission',
        text: 'Hi Abhishek, Please submit your project report by tomorrow. That was easy!'
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