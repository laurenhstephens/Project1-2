
var startTime;
window.onload = function (){
startTime = new Date().getTime() / 1000;  
}

window.onunload = function (){
    var yourkey = '123';
var pagename = window.location.pathname;
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function() {
  if (xhr.readyState == 1) {
    console.log('The call to open(...) succeeded.');
  }
  if (xhr.readyState == 2) {
    console.log('The call to send(...) succeeded.  Waiting for response...');
  }
  if (xhr.readyState == 3) {
    console.log('The response is coming in!');
  }
  if (xhr.readyState == 4) {
    console.log('We now have the complete response: ' + xhr.response);
  }
}
var endTime = new Date().getTime() / 1000; 
duration = startTime-endTime;
var params = "page="+pagename+"&id="+yourkey+"&duration="+duration;
xhr.open('POST', 'http://yoursite.com/restricted/visits?'+params, true);
xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhr.send(params);}
