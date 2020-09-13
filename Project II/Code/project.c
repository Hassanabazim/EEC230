// LCD Module configuration
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;
// LCD PIN DIRECTION
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;
// END LCD configuration

       int x ;                 // to read digital value
       float v;               // to get an accuracy voltage
       float temp;           // to get an accuracy temperature
       char temp_txt[10];   // text array to display an accuracy value

      void main() {

       TRISC=0;               // portc output
       TRISB=0;              // portb input
       TRISA=1;             // porta input
       PORTB=0;            // portb low voltage logic
       PORTC=0;           //  portc low voltage logic
       
      lcd_init( );                       // lCD interface with pic
      ADC_Init();                       // ADC interface with pic
      Lcd_cmd(_lcd_cursor_off);        // disable cursor
      LCD_cmd(_LCD_CLEAR);            // clear LCD
      
      while(1){
     x=adc_read(0);       // digital value
     v=x*(5.0/1023);     //analog value
     temp=(v*100);        // Tempeature according to analog value
     floattostr(temp,temp_txt); // convert numbers to string
     
     if ( v <= 0.4 ) {           // if voltage equal or less than 0.4 volt
     portc=0b00000001;
     lcd_out(1,3,"Temperature ");         // print all
     lcd_out(2,1,temp_txt);
                      }
                     
     if ( v > 0.4 ) {                // if voltage greater than 0.4 volt
     portc=0b00000010;
     lcd_out(1,3,"Temperature ");       // print all
     lcd_out(2,1,temp_txt);
                    }
     }
     }