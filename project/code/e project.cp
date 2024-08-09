#line 1 "C:/Users/user/Desktop/project/code/e project.c"
int timer = 0;

void automatic_traffic() {
 while(porta.b1 == 1) {
 for(timer = 15; timer > 0; timer--) {
 portb = (timer % 10) + (timer / 10) * 16;
 portc =255;

 if(timer > 3) {
 portd.B0 = 1; portd.B3 = 1;
 portd.B1 = 0; portd.B2 = 0; portd.B4 = 0; portd.B5 = 0;
 } else {
 portd.B4 = 1; portd.B0 = 1;
 portd.B1 = 0; portd.B2 = 0; portd.B5 = 0; portd.B3 = 0;
 }

 if(porta.b1 == 0) {
 portb = 0;
 break;
 }

 delay_ms(1000);
 }

 for(timer = 23; timer > 0; timer--) {
 if(porta.b1 == 0) {
 portb = 0;
 break;
 }

 portb = (timer % 10) + (timer / 10) * 16;
 portc = 255;

 if(timer > 3) {
 portd.B2 = 1; portd.B5 = 1;
 portd.B0 = 0; portd.B1 = 0; portd.B4 = 0; portd.B3 = 0;
 } else {
 portd.B1 = 1; portd.B5 = 1;
 portd.B0 = 0; portd.B2 = 0; portd.B4 = 0; portd.B3 = 0;
 }

 delay_ms(1000);
 }
 }
}

void manual_traffic() {
 if(porta.b1 == 0 && porta.b2 == 0) {
 if(portd.B2 == 1 || portd.B1 == 1) {
 portd.B1 = 1; portd.B5 = 1;
 portd.B2 = 0; portd.B0 = 0; portd.B3 = 0; portd.B4 = 0;
 delay_ms(3000);
 portd.B0 = 1; portd.B3 = 1;
 portd.B2 = 0; portd.B1 = 0; portd.B5 = 0; portd.B4 = 0;
 } else if(portd.B3 == 1 || portd.B4 == 1) {
 portd.B4 = 1; portd.B0 = 1;
 portd.B2 = 0; portd.B1 = 0; portd.B3 = 0; portd.B5 = 0;
 delay_ms(3000);
 portd.B5 = 1; portd.B2 = 1;
 portd.B0 = 0; portd.B1 = 0; portd.B3 = 0; portd.B4 = 0;
 }
 }
}

void main() {
 adcon1 = 7;
 trisa = 0b11111;
 trisb = 0;
 trisc = 0;
 trisd = 0;

 porta = 0b11111;
 portb = 0;
 portc = 0xff;
 portd = 0;

 while(porta.b0 == 1);

 while(1) {
 automatic_traffic();
 manual_traffic();
 }
}
