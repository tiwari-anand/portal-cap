


// module.exports = cds.service.impl((srv) => {

//   // Get the CSN definition for Reviews from the db schema for sub-sequent queries
//   // ( Note: we explicitly specify the namespace to support embedded reuse )


//   // Delete a former like by the same user
//   srv.after('CREATE','Incidents', async (req) => {
//        srv.emit('topic:incidentCreated',req)
//        var data = String(req);
//       console.log(`Reviewed event was emitted for book "${data}"`)
//    })
// })

const cds = require('@sap/cds');

module.exports = async srv => {

    const myMessaging = await cds.connect.to("messaging");

    srv.before('CREATE', 'Incidents', async (req) => {
        var curr_date = new Date().toISOString().slice(0, 10);
        req.data.open_on = curr_date;
        //console.log(req);
        console.log(req.user);
        req.data.reporterMail = req.user.id;
        //req.data.name = req.user.attr.givenName + " " + req.user.attr.familyName;
    });


    srv.after('CREATE', 'Incidents', async (req) => {

        const message = JSON.stringify(req);

        const topic = 'incident/created';

        myMessaging.emit(topic, message);

        //   return message
        
        console.log(message +"Successfully sent event");
    });
}