abstract class socialstates {}

class socialinitialstate extends socialstates {}

class socialgetusersuccessstate extends socialstates {}

class socialgetuserloadingstate extends socialstates {}
class socialprofilepickedsuccessgstate extends socialstates {}
class socialprofilepickederrorgstate extends socialstates {}
class socialcoverpickedsuccessgstate extends socialstates {}
class socialcoverpickederrorgstate extends socialstates {}

class socialuploadprofilesuccessgstate extends socialstates {}
class socialuploadprofileerrorgstate extends socialstates {}
class socialuploadcoversuccessgstate extends socialstates {}
class socialuploadcovererrorgstate extends socialstates {}
class socialupdateprofileerrorgstate extends socialstates {}
class socialupdateprofileloadingstate extends socialstates {}




class socialgetusererrorstates extends socialstates {
  final String error;

  socialgetusererrorstates(this.error);
}

class socialchangebottomnavstate extends socialstates {}
class socialcnewpoststate extends socialstates {}



abstract class loginstates {}

class logininitialstate extends loginstates {}

class loginloadingstate extends loginstates {}

class loginsuccessstate extends loginstates {
  final String Uid;

  loginsuccessstate(this.Uid);
}

class loginerrorstate extends loginstates {
  final String error;

  loginerrorstate(this.error);
}

class loginpasswordvisiblestate extends loginstates {}

abstract class registerstates {}

class registerinitialstate extends registerstates {}

class registerloadingstate extends registerstates {}

class registersuccessstate extends registerstates {}

class registererrorstate extends registerstates {}

class registerpasswordvisiblestate extends registerstates {}

class createusersuccessstate extends registerstates {}

class createusererrorstate extends registerstates {
  final String error;

  createusererrorstate(this.error);
}
