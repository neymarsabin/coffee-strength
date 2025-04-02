pkg load fuzzy-logic-toolkit

%% let us define fuzzy inference system %%
coffee_fuzzy = newcoffee_fuzzy('CoffeeStrength');

%% Defining Bean Type with 4 categories %%
%% we are using gaussian membership function, so let's define sigma and c for each of our bean type categories %%
coffee_fuzzy = addvar(coffee_fuzzy, 'input', 'Bean_Type (X1)', [0 8]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Pahadi Light', 'gaussmf', [1 1]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Himalayan Medium', 'gaussmf', [1 3]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Everest Bold', 'gaussmf', [1 5]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Kanachanjunga Dark', 'gaussmf', [1 7]);
showfis(coffee_fuzzy);

%% defining brewing duration input variable %%
%% we use gaussianmf for this variable %%
coffee_fuzzy = addvar(coffee_fuzzy, 'input', 'Brewing Duration (X2)', [0 15]); 
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Short', 'gaussmf', [1, 1]); %% Short: Espresso, Quick Pour-Over %% 
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Medium', 'gaussmf', [1, 3.5]); %% Medium: Standard Pour-Over, Drip %%
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Long', 'gaussmf', [1 5.5]); %% Long: French Press, Slow-Brew %%
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Very Long', 'gaussmf', [2 12]); %% Very Long: Cold Brew, Extended Steeping %%
showfis(coffee_fuzzy);

%% defining water temperature input variable %%
coffee_fuzzy = addvar(coffee_fuzzy, 'input', 'Water Temperature (X3)', [60 110]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 3, 'Low', 'sigmf', [-0.2 85]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 3, 'Medium', 'gaussmf', [2 90]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 3, 'High', 'sigmf', [0.2 95]);
showfis(coffee_fuzzy)

%% Defining Output Variable and Membership Functions %%
%% D: Coffee Strength(Mild, Regular, Strong, Extra Strong) %%

%% Define Fuzzy Rules %%
%% Meaningful Rules %%
