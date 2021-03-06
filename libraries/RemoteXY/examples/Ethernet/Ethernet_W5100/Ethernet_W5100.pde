/*
  RemoteXY example. 
  Smartphone Ethernet connect over W5100 Ethernet shield or module 
  (hardware serial connected).

  This shows an example of using the library RemoteXY.
  In the example you can control the pin 2 using the button on the 
  smartphone. You need to connect W5100 Ethernet shield or module. 
  W5100 used SPI interface.
  
  Download the Android app from the 
  website: http://remotexy.com/download/ for connect this sketch.
  
  Use the website http://remotexy.com/ to create your own management 
  interface your arduino with your smartphone or tablet.
  You can create different management interfaces. Use buttons, 
  switches, sliders, joysticks (g-sensor) all colors and sizes 
  in its interface. Next, you will be able to get the sample 
  code for arduino to use your interface for control from a 
  smartphone or tablet. You will not need to re-install the 
  android app, as it will determine which interface you have 
  downloaded the arduino.
  
*/

///////////////////////////////////////////// 
//        RemoteXY include library         // 
///////////////////////////////////////////// 

/* RemoteXY select connection mode and include library */ 
#define REMOTEXY_MODE__W5100_SPI
#include <Ethernet.h>
#include <SPI.h>

#include <RemoteXY.h>

/* RemoteXY connection settings */
#define REMOTEXY_ETHERNET_MAC "DE:AD:BE:EF:EF:ED"
#define REMOTEXY_SERVER_PORT 6377

/* RemoteXY configurate  */ 
unsigned char RemoteXY_CONF[] = 
  { 1,0,11,0,4,5,1,0,26,6
  ,50,50,2,88,0 }; 
   
/* this structure defines all the variables of your control interface */ 
struct { 

    /* input variable */
  unsigned char button_1; /* =1 if button pressed, else =0 */

    /* other variable */
  unsigned char connect_flag;  /* =1 if wire connected, else =0 */

} RemoteXY; 

///////////////////////////////////////////// 
//           END RemoteXY include          // 
///////////////////////////////////////////// 

#define PIN_BUTTON_1 2


void setup()  
{ 
  RemoteXY_Init ();  
   
  pinMode (PIN_BUTTON_1, OUTPUT);
   

  // TODO you setup code 
   
} 

void loop()  
{  
  RemoteXY_Handler (); 
   
  digitalWrite(PIN_BUTTON_1, (RemoteXY.button_1==0)?LOW:HIGH);
   

  // TODO you loop code 
  // use the RemoteXY structure for data transfer 


}