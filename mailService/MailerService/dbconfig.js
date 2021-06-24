var hana = require('@sap/hana-client');
var conn = hana.createConnection();
var hanaVCAPCred = JSON.parse(process.env.VCAP_SERVICES);
hanaVCAPCred = hanaVCAPCred.hana[0].credentials;
var conn_params = {
	serverNode: hanaVCAPCred.host + ":" + hanaVCAPCred.port,
	sslCryptoProvider: "openssl",
	sslTrustStore: hanaVCAPCred.certificate,
	encrypt: true,
	schema: hanaVCAPCred.schema,
	pwd: hanaVCAPCred.password,
	uid: hanaVCAPCred.user
};

module.exports = {
    conn_params,
    conn
}