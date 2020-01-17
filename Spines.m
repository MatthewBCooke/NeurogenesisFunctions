%Model of Devborn Populations
%number born on day x : a*exp(-((x-b)/c)^2); for developmentally born cells
%a = 1.595e+05;
%b = 5.486;
%c = 9.322;

%e19 @2mo = 45000, @6mo = 45000
%p6  @2mo = 159000, @6mo = 132000
%p21 @2mo = 10000, @6mo = 9000

%Spines
%devMushSpines = .12
%adultMushSpines24w = .24
%adultMushSpines7w = .14
%adultMushSpines4w = .08
%adultMushSpines2w = .01
%x = [0,14,28,49,56,168];
%y = [0,0.01,0.08,0.14,0.21,0.24];

%thin spines
%x = [0,14,28,49,168];
%y = [0,0.15,0.82,1.5,1.55];

%Model of Adultborn Populations

%30		6.8    10800
%40		8.0    12800
%120	2.6    4100
%180	1.8    2800
%240	1.5    2400
%365	0.6    900
%820	0.3    500

%x = [30,40,120,180,240,365,820];
%y = [5400,6400,2050,1400,1200,450,250]
%old y = [10800,12800,4100,2800,2400,900,500];

%Remove dev at ab+4wks

%adult born on day x : a1*exp(-((x-b1)/c1)^2) + a2*exp(-((x-b2)/c2)^2)
%a1 =       6065
%b1 =       54.07
%c1 =       45.26
%a2 =       1406
%b2 =       165.7
%c2 =       186.7

%fun2 = @(x) a1*exp(-((x-b1)/c1).^2) + a2*exp(-((x-b2)/c2).^2)
%integral(fun1,21,365)

%Model of Developmental death
%x = [-5,6,21];
%y = [0,-27000,-1000];

%Length Model
%x = [1,14,28,49,168];
%y = [1,1954,2346,2654,3105];
%dev = 3565

%Rebuild adult model
%Sigmoid for spines
%4wks for developmental death - 28


