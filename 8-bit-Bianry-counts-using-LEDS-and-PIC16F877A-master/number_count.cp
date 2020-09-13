#line 1 "H:/HTI stuff/Training 3/Number-count/code/number_count.c"
void main() {
 char i ;
 TRISC = 0;
 portc = 0b00000000;

 for (i=0; i<255; i++){
 portc = portc+00000001;
 delay_ms (400);
}
}
