%% Define Fuzzy Inference System
coffee_fuzzy = mamfis('Name', 'CoffeeStrength');

%% Variable: Bean Type (X1)
coffee_fuzzy = addInput(coffee_fuzzy, [0 8], 'Name', 'Bean_Type');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'trapmf', [0 0 1 3], 'Name', 'Pahadi_Light');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'trapmf', [1 2 4 5], 'Name', 'Himalayan_Medium');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'trapmf', [3 4 6 7], 'Name', 'Everest_Bold');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'trapmf', [5 6 8 8], 'Name', 'Kanchanjunga_Dark');
figure;
plotmf(coffee_fuzzy, 'input', 1);
title('Membership Functions for Bean Type');

%% Variable: Brewing Duration (X2)
coffee_fuzzy = addInput(coffee_fuzzy, [0 10], 'Name', 'Brewing_Duration');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'trapmf', [0 0 2 4], 'Name', 'Short');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'trapmf', [2 3 6 7], 'Name', 'Medium');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'trapmf', [5 6 8 9], 'Name', 'Long');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'trapmf', [7 8 10 10], 'Name', 'Very_Long');
figure;
plotmf(coffee_fuzzy, 'input', 2);
title('Membership Functions for Brewing Duration');

%% Input Variable: Water Temperature (X3)
coffee_fuzzy = addInput(coffee_fuzzy, [50 110], 'Name', 'Water_Temperature');
coffee_fuzzy = addMF(coffee_fuzzy, 'Water_Temperature', 'trapmf', [50 50 60 70], 'Name', 'Low');
coffee_fuzzy = addMF(coffee_fuzzy, 'Water_Temperature', 'trapmf', [60 75 85 90], 'Name', 'Medium');
coffee_fuzzy = addMF(coffee_fuzzy, 'Water_Temperature', 'trapmf', [80 95 110 110], 'Name', 'High');
figure;
plotmf(coffee_fuzzy, 'input', 3);
title('Membership Functions for Water Temperature');

%% Output Variable: Coffee Strength (Y1)
coffee_fuzzy = addOutput(coffee_fuzzy, [0 10], 'Name', 'Coffee_Strength');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'trapmf', [0 0 1 3], 'Name', 'Mild');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'trapmf', [2 3 5 6], 'Name', 'Regular');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'trapmf', [5 6 7 8], 'Name', 'Strong');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'trapmf', [7 8 10 10], 'Name', 'Extra_Strong');
figure;
plotmf(coffee_fuzzy, 'output', 1);
title('Membership Functions for Coffee Strength');

%% Define Fuzzy Rules
ruleList = [
    1 1 0 1 1 1; 1 2 1 2 1 1; 1 3 0 3 1 1; 2 1 3 2 1 1; 2 2 2 3 1 1;
    2 3 0 3 1 1; 3 2 3 3 1 1; 3 3 0 4 1 1; 3 4 0 4 1 1; 4 4 3 4 1 1;
    4 2 0 3 1 1; 4 3 1 3 1 1; 4 4 0 4 1 1; 3 1 0 2 1 1; 3 2 0 3 1 1;
    1 2 3 3 1 1; 1 3 1 2 1 1; 2 2 3 3 1 1; 4 1 1 2 1 1; 4 3 3 4 1 1;
    2 1 0 1 1 1; 3 1 3 3 1 1; 4 2 2 3 1 1; 1 1 3 2 1 2; 2 1 3 2 1 2;
    4 3 2 3 1 2; 4 4 2 3 1 2
];
coffee_fuzzy = addRule(coffee_fuzzy, ruleList);

%% Open Rule Viewer
fuzzy(coffee_fuzzy);
