int v,duty ;
void main()
{
   TRISB= 0;
   portb=0;
   PWM1_Init(1000);
   ADC_Init();
   PWM1_Start();

   while(1)
   {

     v = ADC_Read(0);
     duty = (V)/4;
     PWM1_Set_Duty(duty);


               PORTB.B0 = 0 ;
               PORTB.B1 = 1;
               delay_ms(2000);

                PORTB.B0 = 1;
                PORTB.B1 = 0;
                delay_ms(2000);


   }
}