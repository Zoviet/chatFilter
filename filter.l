%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <string.h>
	
	int n = 0;   
    int numbers[110]; 
    int code = 0;

	int codes[73] = {900,902,903,904,905,906,908,909,950,951,953,960,961,962,963,964,965,966,967,968,969,980,983,986,901,910,911,912,913,914,915,916,917,918,919,978,981,982,984,985,495,987,988,989,920,921,922,923,924,925,926,927,928,929,930,931,932,933,934,936,937,938,939,999,952,958,977,991,992,993,994,995,996};

%}

%%

[0-9]	n++; numbers[n]=atoi(yytext); 
("\xd1\x81"|"\xd0\xa1")("\xd1\x82\xd0\xbe")	n++; numbers[n]=1; 
("\xd0\xbe"|"\xd0\x9e")("\xd0\xb4\xd0\xb8\xd0\xbd")	n++; numbers[n]=1; 
("\xd0\xb4"|"\xd0\x94")("\xd0\xb2\xd0\xb0")	n++; numbers[n]=2; 
("\xd0\xb4"|"\xd0\x94")("\xd0\xb2\xd0\xb5")	n++; numbers[n]=2;
("\xd1\x82"|"\xd0\xa2")("\xd1\x80\xd0\xb8")	n++; numbers[n]=3; 
("\xd1\x87"|"\xd0\xa7")("\xd0\xb5\xd1\x82\xd1\x8b\xd1\x80")	n++; numbers[n]=4; 
("\xd1\x81"|"\xd0\xa1")("\xd0\xbe\xd1\x80\xd0\xbe\xd0\xba")	n++; numbers[n]=4; 
("\xd0\xbf"|"\xd0\x9f")("\xd1\x8f\xd1\x82")	n++; numbers[n]=5; 
("\xd1\x88"|"\xd0\xa8")("\xd0\xb5\xd1\x81\xd1\x82")	n++; numbers[n]=6; 
("\xd1\x81"|"\xd0\xa1")("\xd0\xb5\xd0\xbc")	n++; numbers[n]=7; 
("\xd0\xb2"|"\xd0\x92")("\xd0\xbe\xd1\x81\xd0\xb5\xd0\xbc")	n++; numbers[n]=8;
("\xd0\xb4"|"\xd0\x94")("\xd0\xb5\xd0\xb2\xd1\x8f")	n++; numbers[n]=9;
("\xd0\x94"|"\xd0\xb4")("\xd0\xb5\xd1\x81\xd1\x8f\xd1\x82\xd1\x8c")	n++; numbers[n]=1; n++; numbers[n]=0; 
("\xd0\x9e"|"\xd0\xbe")("\xd0\xb4\xd0\xb8\xd0\xbd\xd0\xbd\xd0\xb0\xd0\xb4")	n++; numbers[n]=1; n++; numbers[n]=1; 
("\xd0\x94"|"\xd0\xb4")("\xd0\xb2\xd0\xb5\xd0\xbd\xd0\xb0\xd0\xb4")	n++; numbers[n]=1; n++; numbers[n]=2; 
("\xd0\xa2"|"\xd1\x82")("\xd1\x80\xd0\xb8\xd0\xbd\xd0\xb0\xd0\xb4")	n++; numbers[n]=1;n++; numbers[n]=3; 
("\xd0\xa7"|"\xd1\x87")("\xd0\xb5\xd1\x82\xd1\x8b\xd1\x80\xd0\xbd\xd0\xb0\xd0\xb4")	n++; numbers[n]=1;n++; numbers[n]=4; 
("\xd0\x9f"|"\xd0\xbf")("\xd1\x8f\xd1\x82\xd0\xbd\xd0\xb0\xd0\xb4")	n++; numbers[n]=1;n++; numbers[n]=5; 
("\xd0\xa8"|"\xd1\x88")("\xd0\xb5\xd1\x81\xd1\x82\xd0\xbd\xd0\xb0\xd0\xb4\xd1\x86")	n++; numbers[n]=1;n++; numbers[n]=6; 
("\xd0\xa1"|"\xd1\x81")("\xd0\xb5\xd0\xbc\xd0\xbd\xd0\xb0\xd0\xb4\xd1\x86")	n++; numbers[n]=1;n++; numbers[n]=7; 
("\xd0\x92"|"\xd0\xb2")("\xd0\xbe\xd1\x81\xd0\xb5\xd0\xbc\xd0\xbd\xd0\xb0\xd0\xb4")	n++; numbers[n]=1;n++; numbers[n]=8; 
("\xd0\x94"|"\xd0\xb4")("\xd0\xb5\xd0\xb2\xd1\x8f\xd1\x82\xd1\x8c\xd0\xbd\xd0\xb0\xd0\xb4")	n++; numbers[n]=1;n++; numbers[n]=9; 
("\xd0\x94"|"\xd0\xb4")("\xd0\xb2\xd0\xb0\xd0\xb4")	n++; numbers[n]=2;n++; numbers[n]=0; 
\n 
.

%%
int main()
{
  yylex();
   for(int i=0; i<=n; i++) {
	if (numbers[i]==9 && (n-i)>8) {
		code = 900 + numbers[i+1]*10 + numbers[i+2];
		for(int j=0; j<=73; j++) {
			if (codes[j]==code) {			
				printf( "(%d) %d%d%d-%d%d-%d%d", code, numbers[i+3],numbers[i+4],numbers[i+5],numbers[i+6],numbers[i+7],numbers[i+8],numbers[i+9]);	
				exit(EXIT_FAILURE);
			}
		}
	}
  }
  exit(EXIT_SUCCESS);
}
