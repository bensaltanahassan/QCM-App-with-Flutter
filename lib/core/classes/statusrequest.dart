enum StatusRequest {
  loading, //to load data
  sucess, //success to load data
  failure, // like create app with exist email
  serverfailure, //like failed to connect with server
  serverException,
  offlinefailure //no internet connexion
}
