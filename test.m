pkg load fuzzy-logic-toolkit

%% let us define fuzzy inference system %%
fis = newfis('CoffeeStrengthRecommender');

%% input variables %%
%% A = Bean Type = (Light, Medium, Dark) %%
%% B = Brewing Time = (Short, Medium, Long) %%
%% C = Water Temperature = (Low, Medium, High) %%

%% outputs %%
%% D = strength = (Mild, Regular, Strong, Extra Song) %%

%% rules %%
%% If the bean type is Light And the brewing time is Short and the water temperature is Low, then the coffee strength is Mild. %%
%% If the bean type is Light And the brewing time is Medium and the water temperature is Medium, then the coffee strength is Regular. %%
%% If the bean type is Medium And the brewing time is Medium and the water temperature is Medium, then the coffee streangth is Strong. %%
%% If the bean type is Medium And the brewing time is Long And the water temperature is High, then the coffee strength is extra Strong. %%
%% If the bean type is Dark And the brewing time is Long And the water temperature is High, Then the coffee strength is extra Strength. %% 
%% If the bean type is Dark And the brewing time is Medium And the water temperature is Medium, Then the coffee strength is strong. %%

%% let us add input variables and membership functions %%
%% A: Bean Type(Light, Medium, Dark) %%
fis = addvar(fis, 'input', 'Bean_Type', [0 10]);
fis = addmf(fis, 'input', 1, 'Light', 'trimf', [0 0 5]);
fis = addmf(fis, 'input', 1, 'Medium', 'trimf', [3 5 7]);
fis = addmf(fis, 'input', 1, 'Dark', 'trimf', [5 10 10]);

%% B: Brewing Time(Short, Medium, Long) %%
fis = addvar(fis, 'input', 'Brewing_Time', [0 10]);
fis = addmf(fis, 'input', 2, 'Short', 'trimf', [0 0 5]);
fis = addmf(fis, 'input', 2, 'Medium', 'trimf', [3 5 7]);
fis = addmf(fis, 'input', 2, 'Long', 'trimf', [5 10 10]);

%% C: Water Temperature(Low, Medium, High) %%
%% Temperature in Celsius %%
fis = addvar(fis, 'input', 'Water_Temperature', [60 100]);
fis = addmf(fis, 'input', 3, 'Low', 'trimf', [60 60 75]);
fis = addmf(fis, 'input', 3, 'Medium', 'trimf', [70 80 90]);
fis = addmf(fis, 'input', 3, 'High', 'trimf', [85 100 100]);

%% Defining Output Variable and Membership Functions %%
%% D: Coffee Strength(Mild, Regular, Strong, Extra Strong) %%
fis = addvar(fis, 'output', 'Coffee_Strength', [0 10]);
fis = addmf(fis, 'output', 1, 'Mild', 'trimf', [0 0 3]);
fis = addmf(fis, 'output', 1, 'Regular', 'trimf', [2 5 7]);
fis = addmf(fis, 'output', 1, 'Strong', 'trimf', [5 8 10]);
fis = addmf(fis, 'output', 1, 'Extra_Strong', 'trimf', [8 10 10]);

%% Define Fuzzy Rules %%
%% Meaningful Rules %%
ruleList = [
  1 1 1 1 1 1; % If Bean=Light And Time=Short And Temp=Low -> Coffee = Mild %
  1 2 2 2 1 1; % If Bean=Light And Time=Medium And Temp=Medium -> Coffee = Regular %
  2 2 2 3 1 1; % If Bean=Medium And Time=Medium And Temp=Medium -> Coffee = Strong% 
  2 3 3 4 1 1; % If Bean=Medium And Time=Long And Temp=High -> Coffee = Extra Strong%
  3 3 3 4 1 1; % If Bean=Dark And Time=Long And Temp=High -> Coffee = Extra Strong%
  3 2 2 3 1 1; % If Bean=Dark And Time=Medium And Temp=Medium -> Coffee = Strong%
];

fis = addrule(fis, ruleList);

%% simulating the fuzzy system %%
input_values = [7 8 90];
output_strength = evalfis(input_values, fis);
disp(['Coffee Strength Level: ', num2str(output_strength)])
