prob = [3486/7776, 2520/7776, 1770/7776, 0, 0; 0, 0, 0, 441/1296, 855/1296 ;581/1296 , 420/1296, 295/1296, 0, 0; 0, 0, 0, 91/216, 125/216; 0, 0, 0, 161/216, 55/216; 0, 0, 0, 21/36, 15/36];
%use fractions instead of decimals
initial_state=2;
state=initial_state;
atk = 50;
def = 50;
count = 1;
event = [];
event(count,:)=[atk,def];

while (atk > 1 && def > 1)
cum_prob_row = cumsum(prob(state,:));
x = rand;
index = find(x<cum_prob_row,1,'first');
action = index;

% 1st action: defense - 2
% 2nd action: atk - 2
%3rd action: both -1

switch action
    case 1
        def = def - 2;
    case 2
        atk = atk-2;
    case 3
        def = def -1;
        atk = atk -1;
    case 4
        def = def -1;
    case 5
        atk = atk - 1;
end

if atk >= 3 && def >= 1
    state = 2;
end

if atk == 2 && def >= 1
    state = 4;
end

if atk == 1 && def >= 1
    state = 6;
end
count = count+1;
event(count,:)=[atk,def];
end
event
figure(1);
clf;
hold on
plot(event(:,1))
plot(event(:,2),'r');
hold off

figure(2);
clf;
hold on
plot(result(:,1));
plot(result(:,2),'r');
hold off