#include <WiFi.h>
#include <ESPAsyncWebServer.h>
#include <WebSocketsServer.h>
#include <ArduinoJson.h>


int M1 = 19;  //ccw
int M2 = 32;  // cw
int M3 =  2;  //cw
int M4 = 27;  // ccw
int sig =1;

IPAddress Ip(4, 4, 4, 4);

IPAddress NMask(255, 255, 255, 0); 
 const int hover = 32;
 int currentState = 10;
 int magnitude1=0;       
 int     angle1=0;
 int magnitude2=0;        
 int     angle2=0;
 
  void motorWrite(int value,int channel,int pin){
  ledcSetup(channel, 5000, 6);
  ledcAttachPin(pin, channel);
  ledcWrite(channel,value);
}
  float circPath(float xcof,float ycof,float absl,int x){
     float y=0; 
     y=((absl-(x+xcof)*(x+xcof)));
     y= -1*sqrt(y);
    // ycof-=currentState;
     y-=ycof;
     return y;
    }

    int spherePath(int x,float absl, float cnst) {
    float z;
    float y=0;
    cnst*=sig;
    z = absl-x*x-(cnst)*(cnst);
    z = sig*sqrt(z);
    z-= cnst;
    z = (z)+currentState;
    return z;
}
    
  int reset(int value) {
  motorWrite(value,1,M1);
  motorWrite(value,2,M2);
  motorWrite(value,3,M3);
  motorWrite(value,4,M4);
  }



int frontback(int value){
  int forward=0;
  int back=0;
  if (sig==1){
  if (value>=0){
forward=spherePath(value,62424.58,176.67);
back=currentState;}
else{
  back=spherePath(value,62424.58,176.67);
  forward= currentState;
  }} else{ if (value>=0){
back=spherePath(value,62424.58,176.67);
forward=currentState;}
else{
  forward=spherePath(value,62424.58,176.67);
  back= currentState;
  }
 }
motorWrite(forward,1,M1);
motorWrite(forward,2,M2);
motorWrite(back,3,M3);
motorWrite(back,4,M4);
return value;
} 


int rightleft(int value){
int right=0;
int left=0;
  if (sig==1){
  if (value>=0){
right=spherePath(value,62424.58,176.67);
left=currentState;}
else{
  left=spherePath(value,62424.58,176.67);
  right= currentState;
  }} else{ if (value>=0){
left=spherePath(value,62424.58,176.67);
right=currentState;}
else{
  right=spherePath(value,62424.58,176.67);
  left= currentState;
  }
 }
motorWrite(right,1,M1);
motorWrite(left,2,M2);
motorWrite(right,3,M3);
motorWrite(left,4,M4);
}

int cwccw (int value){
float y;
y=sqrt(121664.44-(value+32)*(value+32))-315.33;

 int out = 62424.58-(value*value)-(y+144.67)*(y+144.67);
 int cw,ccw;
 out = sqrt(out);
 out-= 144.67;
 if(value<0){
   ccw=out; //20
   cw=32;
  } 
 else{cw=y;
      ccw=32;
    }
motorWrite(cw,1,M1);
motorWrite(ccw,2,M2);
motorWrite(ccw,3,M3);
motorWrite(cw,4,M4);    
 }


 int updown (int value){
currentState=circPath(77,-266,60685,value);
motorWrite(currentState,1,M1);
motorWrite(currentState,2,M2);
motorWrite(currentState,3,M3);
motorWrite(currentState,4,M4); 
return currentState;}
 int ph(int value){}

 

AsyncWebServer server(80); 
WebSocketsServer webSocket = WebSocketsServer(81);

void notFound(AsyncWebServerRequest* request)
{
  request->send(404, "text/plain", "Page Not found");
}

void Recive(uint8_t num,WStype_t type,uint8_t* payload,size_t length) {

  switch(type) {

    case WStype_DISCONNECTED:
      Serial.printf("[%u] Disconnected!\n", num);
      WiFi.softAPConfig(Ip,Ip,NMask);
      break;

    case WStype_CONNECTED:
      {
        IPAddress ip = webSocket.remoteIP(num);
        Serial.printf("[%u] Connection from ", num);
        Serial.println(ip.toString());
        
      }
      break;
    case WStype_TEXT: {
  server.begin();
  webSocket.begin();
  webSocket.sendTXT(num, payload);
  String msg = String((char * )(payload));
  Serial.println(msg);
  DynamicJsonDocument json(512); 
  deserializeJson(json, msg);

  magnitude1 = json["magnitude1"];
  angle1 = json["angle1"];
  magnitude2 = json["magnitude2"];
  angle2 = json["angle2"];

  int anglei = (angle1 + 360) % 360;
  int anglej = (angle2 + 360) % 360;
  int i = anglei / 45;
  int j = anglej / 30;
 
  if ((j>=8 && j<=9)){magnitude2*=-1; sig=-1;} 
  else if((j==5||j==6)){magnitude2*=-1;}
  else {sig=1;}
  
  if (i>=3&&i<=6) {magnitude1*=-1;}
  
  int( * ptarry1[])(int value) = {rightleft,frontback,frontback,rightleft,rightleft,frontback,frontback,rightleft};
  int( * ptarry2[])(int value) = {cwccw,ph,updown,updown,ph,cwccw,cwccw,ph,updown,updown,ph,cwccw};
  if(abs(magnitude2) < 15){updown(0);} 
  else
   {
    ptarry2[j](magnitude2);

   }
    
     if(abs(magnitude1)>10){
    ptarry1[i](magnitude1);
     Serial.println(i);
     Serial.println(ptarry1[i](magnitude1));
    } 
    else if(!magnitude2){    
      reset(currentState);  
      Serial.print(reset(currentState));}
}
}
}

void setup(void)
{
  Serial.begin(115200);
  Serial.println("softap");
  WiFi.mode(WIFI_AP);
  WiFi.softAP("drone","",1,0,1);
  WiFi.softAPConfig(Ip,Ip,NMask);
  Serial.println(WiFi.softAPIP());
  

   server.on("/", [](AsyncWebServerRequest* request)
  { 
   String message = "<html><title> joystick</title><head><meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0'><meta name='mobile-web-app-capable' content='yes'><head><body style='background-color: rgb(29, 0, 8); overflow: hidden;' id='body' ontouchmove='send();'><h1 id='cords' style='text-align: center; color: wheat;'></h1><h1 id='angle' style='text-align: center; color: wheat;'></h1><h1 id='motors' style='text-align: center; color: wheat;'></h1><div style='height: 256px; width :256px; border-radius: 50%; top : 50%; left : 50%; transform: translate(-155%,-50%); caret-color: transparent; background-color: rgb(37, 37, 1); border: rgb(81, 255, 0); border-style:solid; position: absolute;'><div style='height: 10px; width :10px; border-radius: 50%; top : 50%; left : 50%; transform: translate(-5px,-5px); caret-color: transparent; background-color: rgb(0, 0, 0); position: absolute;' id='joystick' ontouchmove='move1(event);' ontouchend='reset1()'><div style='height: 128px;; width :128px; border-radius: 50%; top : 50%; left : 50%; transform: translate(-64px,-64px); caret-color: transparent; background-color: rgb(196, 176, 0); position: absolute;'></div></div></div><div style='height: 256px; width :256px; border-radius: 50%; top : 50%; left : 50%; transform: translate(55%,-50%); caret-color: transparent; border: rgb(255, 72, 0); border-style:solid; background-color: rgb(70, 32, 1); position: absolute;'><div style='height: 10px;; width :10px; border-radius: 50%; top : 50%; left : 50%; transform: translate(-5px,-5px); caret-color: transparent; background-color: rgb(0, 0, 0); position: absolute;' id='joystick2' ontouchmove='move2(event);' ontouchend='reset2()'><div style='height: 128px;; width :128px; border-radius: 50%; top : 50%; left : 50%; transform: translate(-64px,-64px); caret-color: transparent; background-color: rgb(235, 137, 8); position: absolute;'></div></div></div></body> <script>var connection=new WebSocket('ws://'+location.hostname+':81/');var json='magnitude1:'+0+','+'angle1:'+0;var json2='magnitude2:'+0+','+'angle2:'+0;var angle1=0;var angle2=0;var magnitude1=0,magnitude2=0;function send(){connection.send('{'+json+','+json2+'}');} function move1(event){function inner(x,y){document.getElementById('joystick').style.transform='translate('+x+'px,'+y+'px)';} function outter(x,y){let angle=Math.atan2((y),x);let j=64*Math.sin(angle);let i=64*Math.cos(angle);document.getElementById('joystick').style.transform='translate('+(i)+'px,'+(j)+'px)';return Math.round(Math.atan2(-(y),x)*180/3.1415);} let x=event.touches[0].clientX-155;let y=event.touches[0].clientY-155;var magnitude;document.getElementById('cords').innerHTML=(5+x)+','+-1*(y+5);angle=Math.round(Math.atan2(-(y),x)*180/3.1415);document.getElementById('angle').innerHTML=angle;if((x+5)*(x+5)+(y+5)*(y+5)<=64*64){magnitude=(x+5)*(x+5)+(5+y)*(5+y);magnitude=Math.round(Math.sqrt(magnitude));inner(x,y);json='magnitude1:'+magnitude+','+'angle1:'+angle;} else{outter(x,y);angle=outter(x,y);json='magnitude1:'+64+','+'angle1:'+angle;}} function move2(event){function inner(x,y){document.getElementById('joystick2').style.transform='translate('+x+'px,'+y+'px)';} function outter(x,y){let angle=Math.atan2((y),x);let j=64*Math.sin(angle);let i=64*Math.cos(angle);document.getElementById('joystick2').style.transform='translate('+(i)+'px,'+(j)+'px)';return Math.round(Math.atan2(-(y),x)*180/3.1415);} let x=event.touches[1].clientX-700;let y=event.touches[1].clientY-180;angle=Math.round(Math.atan2(-(y),x)*180/3.1415);var anglei=(angle+360)%360;let arry=['cw','up,cw','up','up','up,ccw','ccw','ccw','down,ccw','down','down','cw,down','cw'];let i;i=Math.floor(anglei/30);document.getElementById('motors').innerHTML=arry[i];if((x+5)*(x+5)+(y+5)*(y+5)<=64*64){magnitude=(x+5)*(x+5)+(5+y)*(5+y);magnitude=Math.round(Math.sqrt(magnitude));inner(x,y);json2='magnitude2:'+magnitude+','+'angle2:'+angle;} else{outter(x,y);angle=outter(x,y);json2='magnitude2:'+64+','+'angle2:'+angle;}} function reset1(){document.getElementById('cords').innerHTML=0+','+0;document.getElementById('cords').innerHTML=0+','+0;document.getElementById('joystick').style.transform='translate('+0+'px,'+0+'px)';json='magnitude1:'+0+','+'angle1:'+0;connection.send('{'+json+','+json2+'}');} function reset2(){document.getElementById('cords').innerHTML=0+','+0;document.getElementById('cords').innerHTML=0+','+0;document.getElementById('joystick2').style.transform='translate('+0+'px,'+0+'px)';json2='magnitude2:'+0+','+'angle2:'+0;connection.send('{'+json+','+json2+'}');}</script> </html>";
  request->send(200, "text/html", message);
  });

  server.onNotFound(notFound);

  server.begin(); 
  webSocket.begin();
  
  webSocket.onEvent(Recive);
  



  
}

void loop(void)
{
 webSocket.loop();
 
}
