%Calculate function
%Matthew Cooke
%Unspiversity of British Columbia
%Jason Snyder Lab

%devBorn adultBorn devSpineLength abSpineLength devSpines abSpines
age = 1000;
deathAfter = 0;
dbMult = 0.08;
%%%%%%%%%%%%%%%%%%%%%%%%%%

population = zeros([age 6]);

abFun = @(x) 6065*exp(-((x-54.07)/45.26).^2) + 1406*exp(-((x-165.7)/186.7).^2);
thinMushSpineFun = @(x) 1.78./(1+exp(-0.167*(-27.87+x)));
mushSpineFun = @(x) (-1.073)*x.^(-0.1613)+0.7098;
thinSpineFun = @(x) 1.545./(1+exp(-0.1685*(-27.28+x)));
filopodiaFun = @(x) -36.32*exp((-0.8988)*x) + 36.44*exp((-0.8943)*x);
protrusionFun = @(x) 1.854./(1+exp(-0.1669*(-27.06+x)));
lengthFun = @(x) (-5042*x.^(-0.1884)+5041);
devFun = @(x) 1200000-(6065*exp(-((x-54.07)/45.26).^2) + 1406*exp(-((x-165.7)/186.7).^2));


%which spine function to use
protrusionFunToUse = filopodiaFun;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


spineTable = zeros([age 1]);
dailyABTable = zeros([age 1]);
lengthTable = zeros([age 1]);

for i = 1:age
    spineTable(i) = integral(protrusionFunToUse,i-1,i);
    if spineTable(i) < 0
        spineTable(i) = 0;
    end
end

for i = 1:age
    lengthTable(i) = integral(lengthFun,i-1,i);
    if lengthTable(i) < 0
        lengthTable(i) = 0;
    end
end

for i = 1:age
    dailyABTable(i) = integral(abFun,i,i+1);
    if i > (56+deathAfter)
        population(i,1) = population(i-1,1) - dailyABTable(i-deathAfter);
    else
        population(i,1) = 1200000;
    end
        
    if i>56
        population(i,2)= dailyABTable(i)+population(i-1,2);
    elseif i==56
        population(i,2)= dailyABTable(i);
    else
        population(i,2)=0;
    end 
    population(i,5) = population(i,1)*dbMult*3565;
    sum=0;
    sumLen=0;
    for k=56:i
        sum=dailyABTable(k)*lengthTable((i-k)+1)*spineTable((i-k)+1)+sum;
        sumLen=dailyABTable(k)*lengthTable((i-k)+1)+sumLen;
    end
    population(i,6)=sum;
    population(i,3)=population(i,1)*3565;
    population(i,4)=sumLen;
end

filename = 'output.csv';
csvwrite(filename,population);        
        
    
    
    

