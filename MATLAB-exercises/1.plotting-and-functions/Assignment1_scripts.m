
%% ================== Exercise 1 ==================

hold on
load 'salesfigs.dat';
x1 = salesfigs(1,:);
y1 = salesfigs(2,:);
plot(x1,'ko');
plot(y1,'k*');
xlabel('Quarter');
ylabel('Sales(billions)');
title('ABC Corporation Sales:2013');
axis([1 4 1.2 3])
legend('Division A','Division B')
box on
hold off

%% ================== Exercise 5 ==================

hold on
x5_1 = 20 + (35-20)*rand(1,1000);
y5_1 = 20 + (35-20)*rand(1,1000);
plot(x5_1,y5_1,'r*');
grid on
axis([-10 40 -5 40]);
x5_2 = 3 + 1*1*randn(1,1000);
y5_2 = 5 + 1*1*randn(1,1000);
plot(x5_2,y5_2,'b*')
grid on
box on
hold off

%% ================== Exercise 6 ==================

x6_1 = 0 + 1*1*randn(1,10000);
y6_1 = 0 + 1*1*randn(1,10000);
z6_1 = 0 + 1*1*randn(1,10000);
a = x6_1>0;
b = y6_1>0;
c = z6_1>0;
d = a.*b.*c;
e = d~=0;
%disp(e);
x6_1 = x6_1(e);
y6_1 = y6_1(e);
z6_1 = z6_1(e);
x6_2 = x6_1./((x6_1.^2 + y6_1.^2 + z6_1.^2).^0.5);
y6_2 = y6_1./((x6_1.^2 + y6_1.^2 + z6_1.^2).^0.5);
z6_2 = z6_1./((x6_1.^2 + y6_1.^2 + z6_1.^2).^0.5);
plot3(x6_2,y6_2,z6_2,'r*');
box on
grid on

