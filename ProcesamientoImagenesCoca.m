
clear all
clc
warning('off','all');
fprintf('PROCESO INICIADO...\n');
RutaCheques = 'C:\Users\Montse\Documents\UAA\3° Semestre\Inteligencia Artificial. Luna\ProyectoImagenesFinal\Coca\*.png';

Ruta= 'C:\Users\Montse\Documents\UAA\3° Semestre\Inteligencia Artificial. Luna\ProyectoImagenesFinal\Coca\';
Ruta_excell = 'C:\Users\Montse\Documents\UAA\3° Semestre\Inteligencia Artificial. Luna\ProyectoImagenesFinal\Ex\Informacion.xlsx';

EE1 = [0 1 0;0 1 0;0 1 0]; % Elemento estructurante 1 para extracción de firma
EE2 = [0 0 0;0 1 0;0 0 0]; % Elemento estructurante 2 para extracción de firma
EE3 = [1 1 1;1 1 1;1 1 1]; % Elemento estructurante 3 para extracción de firma
lee_archivo= dir(RutaCheques); % Ruta de Cheques
DATOS = {' EE1 ',' EE2 ',' EE3 ',' EE4 ',' EE5 ',' EE6 ',' EE7 ',' EE8 ',' EE9 ',' EE10 ',' EE11 ',' EE12 ','EE13 ',' EE14 ',' EE15 ',' EE16 ',' EE17 ',' EE18 ',' EE19 ',' EE20 ',' EE21 ',' EE22 ',' EE23 ',' EE24 ',' EE25 ',' EE26 ',' EE27 ',' EE28 ',' EE29 ',' EE30 ',' EE31 ',' EE32 ',' EE33 ',' EE34 ',' EE35 ',' EE36 ',' EE37 ',' EE38 ',' EE39 ',' EE40 ',' EE41 ',' EE42 ',' EE43 ',' EE44 ',' EE45 ',' EE46 ',' EE47 ',' EE48 ',' EE49 ',' EE50 ',' Correcta '};

for k=1:length(lee_archivo)
    %k=1;
    archivo = lee_archivo(k).name;
    Cheque = imread(strcat(Ruta,archivo)); % Lectura de Cheque
    b=1;
    [height, width, dim] = size(Cheque);
    
    Nueva =im2bw(Cheque,0.9); % Aplicacion de umbral
    OK=imerode(Nueva,EE2);
    if width > 500 && width > 200
        OK = imresize(OK, .5);
    end
    
    height = height*.58;
    width = width*.54;
    height2 = height*.82;
    width2 = width*80;
    [M,N]= size(OK);
    figure(1);
    %imshow(OK);
 


    %Contadores de 1s
    conta1=0;conta2=0;conta3=0;conta4=0;conta5=0;conta6=0;conta7=0;conta8=0;conta9=0;conta10=0;
    conta11=0;conta12=0;conta13=0;conta14=0;conta15=0;conta16=0;conta17=0;conta18=0;conta19=0;conta20=0;
    conta21=0;conta22=0;conta23=0;conta24=0;conta25=0;conta26=0;conta27=0;conta28=0;conta29=0;conta30=0;
    conta31=0;conta32=0;conta33=0;conta34=0;conta35=0;conta36=0;conta37=0;conta38=0;conta39=0;conta40=0;
    conta41=0;conta42=0;conta43=0;conta44=0;conta45=0;conta46=0;conta47=0;conta48=0;conta49=0;conta50=0;


    %PARTE II Declaracion de elementos estructurantes 
    % e implementacion de los mismos
    ST1 = [0	0	0	0	0;
    0	0	0	0	0;
    1	1	1	1	1;
    0	0	0	0	0;
    0	0	0	0	0]; %1

    ST2 = [0    0   1   0   0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0]; %2

    ST3 = [1	0	0	0	0;
    0	1	0	0	0;
    0	0	1	0	0;
    0	0	0	1	0;
    0	0	0	0	1]; 

    ST4 = [0	0	0	0	1;
    0	0	0	1	0;
    0	0	1	0	0;
    0	1	0	0	0;
    1	0	0	0	0]; 

    ST5 = [0	0	1	0	0;
    0	0	1	0	0;
    1	1	1	1	1;
    0	0	1	0	0;
    0	0	1	0	0]; 

    ST6 = [1	0	0	0	1;
    0	1	0	1	0;
    0	0	1	0	0;
    0	1	0	1	0;
    1	0	0	0	1]; 

    ST7 = [0	0	1	1	1;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    1	1	1	0	0]; 

    ST8 = [1	1	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	1	1];

    ST9 = [0	0	0	0	1;
    0	0	0	1	0;
    0	0	1	0	0;
    0	0	0	1	0;
    0	0	0	0	1]; 

    ST10 = [1	0	0	0	0;
    0	1	0	0	0;
    0	0	1	0	0;
    0	1	0	0	0;
    1	0	0	0	0]; 

    ST11 = [1	0	0	0	1;
    0	1	0	1	0;
    0	0	1	0	0;
    0	0	0	0	0;
    0	0	0	0	0]; 

    ST12 = [0	0	0	0	0;
    0	0	0	0	0;
    0	0	1	0	0;
    0	1	0	1	0;
    1	0	0	0	1]; 

    ST13 = [1	0	0	0	0;
    1	0	0	0	0;
    1	0	0	0	0;
    0	1	0	0	0;
    0	0	1	1	1]; 

    ST14 = [0	0	0	0	1;
    0	0	0	0	1;
    0	0	0	0	1;
    0	0	0	1	0;
    1	1	1	0	0]; 

    ST15 = [0	0	1	1	1;
    0	1	0	0	0;
    1	0	0	0	0;
    1	0	0	0	0;
    1	0	0	0	0]; 

    ST16 = [1	1	1	0	0;
    0	0	0	1	0;
    0	0	0	0	1;
    0	0	0	0	1;
    0	0	0	0	1];

    ST17 = [0	0	0	0	1;
    0	0	0	0	1;
    1	1	1	1	1;
    0	0	0	0	1;
    0	0	0	0	1]; 

    ST18 = [1	1	1	1	1;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0]; 

    ST19 = [1	0	0	0	0;
    1	0	0	0	0;
    1	1	1	1	1;
    1	0	0	0	0;
    1	0	0	0	0]; 

    ST20 = [0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    1	1	1	1	1]; 

    ST21 = [1	0	0	0	1;
    1	0	0	0	1;
    1	0	0	0	1;
    0	1	0	1	0;
    0	0	1	0	0]; 

    ST22 = [0	0	1	0	0;
    0	1	0	1	0;
    1	0	0	0	1;
    1	0	0	0	1;
    1	0	0	0	1]; 

    ST23 = [1	1	1	0	0;
    0	0	0	1	0;
    0	0	0	0	1;
    0	0	0	1	0;
    1	1	1	0	0]; 

    ST24 = [0	0	1	1	1;
    0	1	0	0	0;
    1	0	0	0	0;
    0	1	0	0	0;
    0	0	1	1	1];

    ST25 = [0	1	1	0	0;
    1	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	1;
    0	0	1	1	0]; 

    ST26 = [0	0	1	1	0;
    0	0	1	0	1;
    0	0	1	0	0;
    1	0	1	0	0;
    0	1	1	0	0]; 

    ST27 = [0	1	0	0	0;
    1	0	0	0	0;
    1	1	1	1	1;
    0	0	0	0	1;
    0	0	0	1	0]; 

    ST28 = [0	0	0	1	0;
    0	0	0	0	1;
    1	1	1	1	1;
    1	0	0	0	0;
    0	1	0	0	0];

    ST29 = [1	0	0	0	0;
    1	0	0	0	0;
    1	0	1	1	1;
    1	0	1	0	0;
    1	1	1	0	0]; 

    ST30 = [1	1	1	1	1;
    1	0	0	0	0;
    1	1	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0]; 

    ST31 = [0	0	1	1	1;
    0	0	1	0	1;
    1	1	1	0	1;
    0	0	0	0	1;
    0	0	0	0	1]; 

    ST32 = [0	0	1	0	0;
    0	0	1	0	0;
    1	1	1	0	0;
    1	0	0	0	0;
    1	1	1	1	1];

    ST33 = [0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	1	0	1	0;
    1	0	0	0	1]; 

    ST34 = [1	0	0	0	0;
    0	1	0	0	0;
    0	0	1	1	1;
    0	1	0	0	0;
    1	0	0	0	0];

    ST35 = [1	0	0	0	1;
    0	1	0	1	0;
    0	0	1	0	0;
    0	0	1	0	0;
    0	0	1	0	0]; 

    ST36 = [0	0	0	0	1;
    0	0	0	1	0;
    1	1	1	0	0;
    0	0	0	1	0;
    0	0	0	0	1]; 

    ST37 = [0	0	0	0	1;
    0	0	0	0	1;
    1	1	1	1	1;
    1	0	0	0	0;
    1	0	0	0	0]; 

    ST38 = [1	0	0	0	0;
    1	0	0	0	0;
    1	1	1	1	1;
    0	0	0	0	1;
    0	0	0	0	1]; 

    ST39 = [1	0	0	1	0;
    1	0	1	0	0;
    1	1	0	0	0;
    1	0	1	0	0;
    1	0	0	1	0];

    ST40 = [0	1	0	0	1;
    0	0	1	0	1;
    0	0	0	1	1;
    0	0	1	0	1;
    0	1	0	0	1];

    ST41 = [0	0	0	0	0;
    1	0	0	0	1;
    0	1	0	1	0;
    0	0	1	0	0;
    1	1	1	1	1]; 

    ST42 = [1	1	1	1	1;
    0	0	1	0	0;
    0	1	0	1	0;
    1	0	0	0	1;
    0	0	0	0	0]; 

    ST43 = [0	1	0	1	0;
    0	1	0	1	0;
    1	1	1	1	1;
    0	1	0	1	0;
    0	1	0	1	0]; 

    ST44 = [0	0	1	0	0;
    1	1	1	1	1;
    0	0	1	0	0;
    1	1	1	1	1;
    0	0	1	0	0]; 

    ST45 = [0	0	0	0	1;
    0	0	0	1	1;
    0	0	1	0	1;
    0	1	0	0	1;
    1	0	0	0	1]; 

    ST46 = [1	0	0	0	0;
    1	1	0	0	0;
    1	0	1	0	0;
    1	0	0	1	0;
    1	0	0	0	1]; 

    ST47 = [0	1	0	0	0;
    1	0	0	0	0;
    1	0	0	0	0;
    1	0	0	0	1;
    0	1	1	1	0]; 

    ST48 = [0	1	1	1	0;
    1	0	0	0	1;
    0	0	0	0	1;
    0	0	0	0	1;
    0	0	0	1	0];

    ST49 = [1	0	0	0	1;
    0	1	0	0	1;
    0	0	1	0	1;
    0	0	0	1	1;
    0	0	0	0	1]; 

    ST50 = [0	0	1	0	0;
    0	1	0	1	0;
    1	0	0	0	1;
    0	1	0	1	0;
    0	0	1	0	0]; 

    Patron1_img = imfilter(OK,ST1);
    Patron2_img = imfilter(OK,ST2);
    Patron3_img = imfilter(OK,ST3);
    Patron4_img = imfilter(OK,ST4);
    Patron5_img = imfilter(OK,ST5);
    Patron6_img = imfilter(OK,ST6);
    Patron7_img = imfilter(OK,ST7);
    Patron8_img = imfilter(OK,ST8);
    Patron9_img = imfilter(OK,ST9);
    Patron10_img = imfilter(OK,ST10);
    Patron11_img = imfilter(OK,ST11);
    Patron12_img = imfilter(OK,ST12);
    Patron13_img = imfilter(OK,ST13);
    Patron14_img = imfilter(OK,ST14);
    Patron15_img = imfilter(OK,ST15);
    Patron16_img = imfilter(OK,ST16);
    Patron17_img = imfilter(OK,ST17);
    Patron18_img = imfilter(OK,ST18);
    Patron19_img = imfilter(OK,ST19);
    Patron20_img = imfilter(OK,ST20);
    Patron21_img = imfilter(OK,ST21);
    Patron22_img = imfilter(OK,ST22);
    Patron23_img = imfilter(OK,ST23);
    Patron24_img = imfilter(OK,ST24);
    Patron25_img = imfilter(OK,ST25);
    Patron26_img = imfilter(OK,ST26);
    Patron27_img = imfilter(OK,ST27);
    Patron28_img = imfilter(OK,ST28);
    Patron29_img = imfilter(OK,ST29);
    Patron30_img = imfilter(OK,ST30);
    Patron31_img = imfilter(OK,ST31);
    Patron32_img = imfilter(OK,ST32);
    Patron33_img = imfilter(OK,ST33);
    Patron34_img = imfilter(OK,ST34);
    Patron35_img = imfilter(OK,ST35);
    Patron36_img = imfilter(OK,ST36);
    Patron37_img = imfilter(OK,ST37);
    Patron38_img = imfilter(OK,ST38);
    Patron39_img = imfilter(OK,ST39);
    Patron40_img = imfilter(OK,ST40);
    Patron41_img = imfilter(OK,ST41);
    Patron42_img = imfilter(OK,ST42);
    Patron43_img = imfilter(OK,ST43);
    Patron44_img = imfilter(OK,ST44);
    Patron45_img = imfilter(OK,ST45);
    Patron46_img = imfilter(OK,ST46);
    Patron47_img = imfilter(OK,ST47);
    Patron48_img = imfilter(OK,ST48);
    Patron49_img = imfilter(OK,ST49);
    Patron50_img = imfilter(OK,ST50);
    
    imshow(Patron1_img);

    %PARTE III Contabilizacion de 1s y creacion del Data_set
    for i=1:M %1
       for j=1:N
           if(Patron1_img(i,j)==0)
               conta1=conta1+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta1);

    b=b+1;

    for i=1:M %2
       for j=1:N
           if(Patron2_img(i,j)==0)
               conta2=conta2+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta2);
    b=b+1;

    for i=1:M %3
       for j=1:N
           if(Patron3_img(i,j)==0)
               conta3=conta3+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta3);
    b=b+1;

    for i=1:M %4
       for j=1:N
           if(Patron4_img(i,j)==0)
               conta4=conta4+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta4);
    b=b+1;
    for i=1:M %5
       for j=1:N
           if(Patron5_img(i,j)==0)
               conta5=conta5+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta5);
    b=b+1;
    for i=1:M %6
       for j=1:N
           if(Patron6_img(i,j)==0)
               conta6=conta6+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta6);
    b=b+1;
    for i=1:M %7
       for j=1:N
           if(Patron7_img(i,j)==0)
               conta7=conta7+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta7);
    b=b+1;
    for i=1:M %8
       for j=1:N
           if(Patron8_img(i,j)==0)
               conta8=conta8+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta8);
    b=b+1;
    for i=1:M %9
       for j=1:N
           if(Patron9_img(i,j)==0)
               conta9=conta9+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta9);
    b=b+1;
    for i=1:M %10
       for j=1:N
           if(Patron10_img(i,j)==0)
               conta10=conta10+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta10);
    b=b+1;
    for i=1:M %11
       for j=1:N
           if(Patron11_img(i,j)==0)
               conta11=conta11+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta11);
    b=b+1;
    for i=1:M %12
       for j=1:N
           if(Patron12_img(i,j)==0)
               conta12=conta12+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta12);
    b=b+1;
    for i=1:M %13
       for j=1:N
           if(Patron13_img(i,j)==0)
               conta13=conta13+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta13);
    b=b+1;
    for i=1:M %14
       for j=1:N
           if(Patron14_img(i,j)==0)
               conta14=conta14+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta14);
    b=b+1;
    for i=1:M %15
       for j=1:N
           if(Patron15_img(i,j)==0)
               conta15=conta15+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta15);
    b=b+1;
    for i=1:M %16
       for j=1:N
           if(Patron16_img(i,j)==0)
               conta16=conta16+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta16);
    b=b+1;
    for i=1:M %17
       for j=1:N
           if(Patron17_img(i,j)==0)
               conta17=conta17+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta17);
    b=b+1;
    for i=1:M %18
       for j=1:N
           if(Patron18_img(i,j)==0)
               conta18=conta18+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta18);
    b=b+1;
    for i=1:M %19
       for j=1:N
           if(Patron19_img(i,j)==0)
               conta19=conta19+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta19);
    b=b+1;
    for i=1:M %20
       for j=1:N
           if(Patron20_img(i,j)==0)
               conta20=conta20+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta20);
    b=b+1;
    for i=1:M %21
       for j=1:N
           if(Patron21_img(i,j)==0)
               conta21=conta21+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta21);
    b=b+1;
    for i=1:M %22
       for j=1:N
           if(Patron22_img(i,j)==0)
               conta22=conta22+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta22);
    b=b+1;
    for i=1:M %23
       for j=1:N
           if(Patron23_img(i,j)==0)
               conta23=conta23+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta23);
    b=b+1;
    for i=1:M %24
       for j=1:N
           if(Patron24_img(i,j)==0)
               conta24=conta24+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta24);
    b=b+1;
    for i=1:M %25
       for j=1:N
           if(Patron25_img(i,j)==0)
               conta25=conta25+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta25);
    b=b+1;
    for i=1:M %26
       for j=1:N
           if(Patron26_img(i,j)==0)
               conta26=conta26+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta26);
    b=b+1;
    for i=1:M %27
       for j=1:N
           if(Patron27_img(i,j)==0)
               conta27=conta27+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta27);
    b=b+1;
    for i=1:M %28
       for j=1:N
           if(Patron28_img(i,j)==0)
               conta28=conta28+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta28);
    b=b+1;
    for i=1:M %29
       for j=1:N
           if(Patron29_img(i,j)==0)
               conta29=conta29+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta29);
    b=b+1;
    for i=1:M %30
       for j=1:N
           if(Patron30_img(i,j)==0)
               conta30=conta30+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta30);
    b=b+1;
    for i=1:M %31
       for j=1:N
           if(Patron31_img(i,j)==0)
               conta31=conta31+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta31);
    b=b+1;
    for i=1:M %32
       for j=1:N
           if(Patron32_img(i,j)==0)
               conta32=conta32+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta32);
    b=b+1;
    for i=1:M %33
       for j=1:N
           if(Patron33_img(i,j)==0)
               conta33=conta33+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta33);
    b=b+1;
    for i=1:M %34
       for j=1:N
           if(Patron34_img(i,j)==0)
               conta34=conta34+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta34);
    b=b+1;
    for i=1:M %35
       for j=1:N
           if(Patron35_img(i,j)==0)
               conta35=conta35+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta35);
    b=b+1;
    for i=1:M %36
       for j=1:N
           if(Patron36_img(i,j)==0)
               conta36=conta36+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta36);
    b=b+1;
    for i=1:M %37
       for j=1:N
           if(Patron37_img(i,j)==0)
               conta37=conta37+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta37);
    b=b+1;
    for i=1:M %38
       for j=1:N
           if(Patron38_img(i,j)==0)
               conta38=conta38+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta38);
    b=b+1;
    for i=1:M %39
       for j=1:N
           if(Patron39_img(i,j)==0)
               conta39=conta39+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta39);
    b=b+1;
    for i=1:M %40
       for j=1:N
           if(Patron40_img(i,j)==0)
               conta40=conta40+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta40);
    b=b+1;
    for i=1:M %41
       for j=1:N
           if(Patron41_img(i,j)==0)
               conta41=conta41+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta41);
    b=b+1;
    for i=1:M %42
       for j=1:N
           if(Patron42_img(i,j)==0)
               conta42=conta42+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta42);
    b=b+1;
    for i=1:M %43
       for j=1:N
           if(Patron43_img(i,j)==0)
               conta43=conta43+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta43);
    b=b+1;
    for i=1:M %44
       for j=1:N
           if(Patron44_img(i,j)==0)
               conta44=conta44+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta44);
    b=b+1;
    for i=1:M %45
       for j=1:N
           if(Patron45_img(i,j)==0)
               conta45=conta45+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta45);
    b=b+1;
    for i=1:M %46
       for j=1:N
           if(Patron46_img(i,j)==0)
               conta46=conta46+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta46);
    b=b+1;
    for i=1:M %47
       for j=1:N
           if(Patron47_img(i,j)==0)
               conta47=conta47+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta47);
    b=b+1;
    for i=1:M %48
       for j=1:N
           if(Patron48_img(i,j)==0)
               conta48=conta48+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta48);
    b=b+1;
    for i=1:M %49
       for j=1:N
           if(Patron49_img(i,j)==0)
               conta49=conta49+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta49);
    b=b+1;
    for i=1:M %50
       for j=1:N
           if(Patron50_img(i,j)==0)
               conta50=conta50+1;
           end
        end
    end
    DATOS(k+1,b)= num2cell(conta50);
    b=b+1;
    
    DATOS(k+1,b)= cellstr('SI');
    %DATOS
    xlswrite('C:\Users\Montse\Documents\UAA\3° Semestre\Inteligencia Artificial. Luna\ProyectoImagenesFinal\Ex\Informacion.xlsx',DATOS,'Hoja1','A1'); %Escritura a archivo de excel
end

%%
k=1;
% A
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','A2:A16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','A2:A16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    pop = round((ds_mas-ds_menos)*rand+ds_menos);DATOS2(h,k) = num2cell(pop);
end

% B
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','B2:B16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','B2:B16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+1) = num2cell(pop);
end

% C
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','C2:C16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','C2:C16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+2) = num2cell(pop);
end

% D
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','D2:D16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','D2:D16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+3) = num2cell(pop);
end

% E
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','E2:E16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','E2:E16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+4) = num2cell(pop);
end

% F
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','F2:F16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','F2:F16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+5) = num2cell(pop);
end

% G
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','G2:G16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','G2:G16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+6) = num2cell(pop);
end

% H
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','H2:H16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','H2:H16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+7) = num2cell(pop);
end

% I
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','I2:I16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','I2:I16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+8) = num2cell(pop);
end

% J
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','J2:J16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','J2:J16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+9) = num2cell(pop);
end
% K
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','K2:K16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','K2:K16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+10) = num2cell(pop);
end
% L
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','L2:L16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','L2:L16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+11) = num2cell(pop);
end
% M
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','M2:M16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','M2:M16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+12) = num2cell(pop);
end
% N
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','N2:N16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','N2:N16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+13) = num2cell(pop);
end
% O
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','O2:O16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','O2:O16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+14) = num2cell(pop);
end
% P
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','P2:P16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','P2:P16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+15) = num2cell(pop);
end
% Q
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','Q2:Q16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','Q2:Q16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+16) = num2cell(pop);
end
% R
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','R2:R16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','R2:R16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+17) = num2cell(pop);
end

% S
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','S2:S16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','S2:S16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+18) = num2cell(pop);
end
% T
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','T2:T16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','T2:T16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+19) = num2cell(pop);
end
% U
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','U2:U16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','U2:U16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+20) = num2cell(pop);
end
% V
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','V2:V16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','V2:V16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+21) = num2cell(pop);
end
% W
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','W2:W16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','W2:W16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+22) = num2cell(pop);
end
% X
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','X2:X16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','X2:X16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+23) = num2cell(pop);
end

% Y
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','Y2:Y16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','Y2:Y16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+24) = num2cell(pop);
end
% Z
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','Z2:Z16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','Z2:Z16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+25) = num2cell(pop);
end
%******************************************************************************************************************************************

% AA
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AA2:AA16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AA2:AA16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    pop = round((ds_mas-ds_menos)*rand+ds_menos);DATOS2(h,k+26) = num2cell(pop);
end

% AB
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AB2:AB16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AB2:AB16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+27) = num2cell(pop);
end

% AC
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AC2:AC16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AC2:AC16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+28) = num2cell(pop);
end

% AD
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AD2:AD16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AD2:AD16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+29) = num2cell(pop);
end

% AE
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AE2:AE16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AE2:AE16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+30) = num2cell(pop);
end

% AF
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AF2:AF16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AF2:AF16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+31) = num2cell(pop);
end

% AG
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AG2:AG16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AG2:AG16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+32) = num2cell(pop);
end

% AH
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AH2:AH16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AH2:AH16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+33) = num2cell(pop);
end

% AI
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AI2:AI16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AI2:AI16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+34) = num2cell(pop);
end

% AJ
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AJ2:AJ16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AJ2:AJ16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+35) = num2cell(pop);
end
% AK
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AK2:AK16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AK2:AK16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+36) = num2cell(pop);
end
% AL
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AL2:AL16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AL2:AL16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+37) = num2cell(pop);
end
% AM
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AM2:AM16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AM2:AM16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+38) = num2cell(pop);
end
% AN
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AN2:AN16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AN2:AN16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+39) = num2cell(pop);
end
% AO
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AO2:AO16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AO2:AO16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+40) = num2cell(pop);
end
% AP
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AP2:AP16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AP2:AP16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+41) = num2cell(pop);
end
% AQ
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AQ2:AQ16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AQ2:AQ16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+42) = num2cell(pop);
end
% AR
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AR2:AR16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AR2:AR16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+43) = num2cell(pop);
end

% AS
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AS2:AS16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AS2:AS16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+44) = num2cell(pop);
end
% AT
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AT2:AT16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AT2:AT16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+45) = num2cell(pop);
end
% AU
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AU2:AU16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AU2:AU16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+46) = num2cell(pop);
end
% AV
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AV2:AV16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AV2:AV16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+47) = num2cell(pop);
end
% AW
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AW2:AW16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AW2:AW16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+48) = num2cell(pop);
end
% AX
%-----------------------------
% Mas desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AX2:AX16'); ds_mas = round(sum(Vec1)+std(Vec1)); ds_mas = round(ds_mas/15);
% Menos desviacion estandar
Vec1 = xlsread(Ruta_excell,'Hoja1','AX2:AX16'); ds_menos = round(sum(Vec1)-std(Vec1)); ds_menos = round(ds_menos/15);
%-----------------------------
for h=1:50
    %n=round(8*rand+2); entre 2 y 10
    pop = round((ds_mas-ds_menos)*rand+ds_menos); DATOS2(h,k+49) = num2cell(pop);
end

% Estra de SI
for h=1:50
    DATOS2(h,k+50) = cellstr('SI');
end
%%

% Relleno de sinteticas Negativas (NO)
k=1;
for s=1:50
for h=1:50
    n=round(299*rand+1); % entre 1 y 300
    DATOS3(h,s) = num2cell(n);
end
end
for h=1:50
    DATOS3(h,k+50) = cellstr('NO');
end
xlswrite('C:\Users\Montse\Documents\UAA\3° Semestre\Inteligencia Artificial. Luna\ProyectoImagenesFinal\Ex\Informacion.xlsx',DATOS2,'Hoja1','A12'); %Escritura a archivo de excel
xlswrite('C:\Users\Montse\Documents\UAA\3° Semestre\Inteligencia Artificial. Luna\ProyectoImagenesFinal\Ex\Informacion.xlsx',DATOS3, 'Hoja1', 'A62');


fprintf('\nPROCESO FINALIZADO\n');

