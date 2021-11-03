


int main(){
	int matP[9][9];
	int it, it2;
	
	matP[0][1]=6;
	matP[0][6]=8;
	matP[0][3]=10;
	matP[1][0]=6;
	matP[1][2]=11;
	matP[1][7]=13;
	matP[1][4]=15;
	matP[2][1]=11;
	matP[2][7]=4;
	matP[3][0]=10;
	matP[3][4]=6;
	matP[4][1]=15;
	matP[4][3]=6;
	matP[4][5]=2;
	matP[5][4]=2;
	matP[5][6]=4;
	matP[5][8]=6;
	matP[6][0]=8;
	matP[6][5]=4;
	matP[6][7]=5;
	matP[6][8]=5;
	matP[7][2]=4;
	matP[7][1]=13;
	matP[7][6]=5;
	matP[7][8]=7;
	matP[8][6]=5;
	matP[8][7]=7;
	matP[8][5]=6;
	
	for(it=0; it<num; it++){
		for(it2=0; it2<num; it2++){
			printf(" %d ", matP[it][it2]);
		}
		puts("");
	}
}
