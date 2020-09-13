#line 1 "E:/Hassan/Pratical traning 3/project 2 - EEC 230/project.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;


 int x ;
 float v;
 float temp;
 char temp_txt[10];

 void main() {

 TRISC=0;
 TRISB=0;
 TRISA=1;
 PORTB=0;
 PORTC=0;

 lcd_init( );
 ADC_Init();
 Lcd_cmd(_lcd_cursor_off);
 LCD_cmd(_LCD_CLEAR);

 while(1){
 x=adc_read(0);
 v=x*(5.0/1023);
 temp=(v*100);
 floattostr(temp,temp_txt);

 if ( v <= 0.4 ) {
 portc=0b00000001;
 lcd_out(1,3,"Temperature ");
 lcd_out(2,1,temp_txt);
 }

 if ( v > 0.4 ) {
 portc=0b00000010;
 lcd_out(1,3,"Temperature ");
 lcd_out(2,1,temp_txt);
 }
 }
 }
