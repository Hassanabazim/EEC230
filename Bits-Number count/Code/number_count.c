void main() {
     char i ;
     TRISC = 0;             // port c is output
     portc = 0b00000000;  // portC starts with zero

     for (i=0; i<255; i++){
         portc = portc+00000001;   // increament the value
         delay_ms (400);
}
}