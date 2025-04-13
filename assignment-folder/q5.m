%% Define Fuzzy Inference System
coffee_fuzzy = mamfis('Name', 'CoffeeStrength');

%% Define Input Variable: Bean Type (X1)
coffee_fuzzy = addInput(coffee_fuzzy, [0 8], 'Name', 'Bean_Type');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'gaussmf', [1 1], 'Name', 'Pahadi_Light');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'gaussmf', [1 3], 'Name', 'Himalayan_Medium');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'gaussmf', [1 5], 'Name', 'Everest_Bold');
coffee_fuzzy = addMF(coffee_fuzzy, 'Bean_Type', 'gaussmf', [1 7], 'Name', 'Kanchanjunga_Dark');
figure;
plotmf(coffee_fuzzy, 'input', 1);
title('Membership Functions for Bean Type');

%% Define Input Variable: Brewing Duration (X2)
coffee_fuzzy = addInput(coffee_fuzzy, [0 10], 'Name', 'Brewing_Duration');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'sigmf', [-1 2], 'Name', 'Short');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'gaussmf', [1.5 4], 'Name', 'Medium');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'gaussmf', [1.5 7], 'Name', 'Long');
coffee_fuzzy = addMF(coffee_fuzzy, 'Brewing_Duration', 'gaussmf', [1 9], 'Name', 'Very_Long');
figure;
plotmf(coffee_fuzzy, 'input', 2);
title('Membership Functions for Brewing Duration');

%% Define Input Variable: Water Temperature (X3)
coffee_fuzzy = addInput(coffee_fuzzy, [50 110], 'Name', 'Water_Temperature');
coffee_fuzzy = addMF(coffee_fuzzy, 'Water_Temperature', 'sigmf', [-0.1 65], 'Name', 'Low');
coffee_fuzzy = addMF(coffee_fuzzy, 'Water_Temperature', 'gaussmf', [10 80], 'Name', 'Medium');
coffee_fuzzy = addMF(coffee_fuzzy, 'Water_Temperature', 'sigmf', [0.1 95], 'Name', 'High');
figure;
plotmf(coffee_fuzzy, 'input', 3);
title('Membership Functions for Water Temperature');

%% Define Output Variable: Coffee Strength
coffee_fuzzy = addOutput(coffee_fuzzy, [0 10], 'Name', 'Coffee_Strength');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'gaussmf', [1 2], 'Name', 'Mild');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'gaussmf', [1 4], 'Name', 'Regular');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'gaussmf', [1 6], 'Name', 'Strong');
coffee_fuzzy = addMF(coffee_fuzzy, 'Coffee_Strength', 'gaussmf', [1 8], 'Name', 'Extra_Strong');
figure;
plotmf(coffee_fuzzy, 'output', 1);

%% Define Fuzzy Rules %%
ruleList = [
  % 1. If bean is Pahadi Light AND brew_duration is short THEN coffee is mild
  1 1 0 1 1 1

  % 2. If bean is Pahadi Light AND brew_duration is medium AND temperature is low THEN coffee is regular
  1 2 1 2 1 1

  % 3. If bean is Pahadi Light AND brew_duration is long THEN coffee is strong
  1 3 0 3 1 1

  % 4. If bean is Himalayan Medium AND brew_duration is short AND temperature is high THEN coffee is regular
  2 1 3 2 1 1

  % 5. If bean is Himalayan Medium AND brew_duration is medium AND temperature is medium THEN coffee is strong
  2 2 2 3 1 1

  % 6. If bean is Himalayan Medium AND brew_duration is long THEN coffee is strong
  2 3 0 3 1 1

  % 7. If bean is Everest Bold AND brew_duration is medium AND temperature is high THEN coffee is strong
  3 2 3 3 1 1

  % 8. If bean is Everest Bold AND brew_duration is long THEN coffee is extra strong
  3 3 0 4 1 1

  % 9. If bean is Everest Bold AND brew_duration is very long THEN coffee is extra strong
  3 4 0 4 1 1

  % 10. If bean is Kanchanjunga Dark AND brew_duration is very long AND temperature is high THEN coffee is extra strong
  4 4 3 4 1 1

  % 11. If bean is Kanchanjunga Dark AND brew_duration is medium THEN coffee is strong
  4 2 0 3 1 1

  % 12. If bean is Kanchanjunga Dark AND brew_duration is long AND temperature is low THEN coffee is strong
  4 3 1 3 1 1

  % 13. If bean is Kanchanjunga Dark AND brew_duration is very long THEN coffee is extra strong
  4 4 0 4 1 1

  % 14. If bean is Everest Bold AND brew_duration is short THEN coffee is regular
  3 1 0 2 1 1

  % 15. If bean is Everest Bold AND brew_duration is medium THEN coffee is strong
  3 2 0 3 1 1

  % 16. If bean is Pahadi Light AND brew_duration is medium AND temperature is high THEN coffee is strong
  1 2 3 3 1 1

  % 17. If bean is Pahadi Light AND brew_duration is long AND temperature is low THEN coffee is regular
  1 3 1 2 1 1

  % 18. If bean is Himalayan Medium AND brew_duration is medium AND temperature is high THEN coffee is strong
  2 2 3 3 1 1

  % 19. If bean is Kanchanjunga Dark AND brew_duration is short AND temperature is low THEN coffee is regular
  4 1 1 2 1 1

  % 20. If bean is Kanchanjunga Dark AND brew_duration is long AND temperature is high THEN coffee is extra strong
  4 3 3 4 1 1

  % 21. If bean is Himalayan Medium AND brew_duration is short THEN coffee is mild
  2 1 0 1 1 1

  % 22. If bean is Everest Bold AND brew_duration is short AND temperature is high THEN coffee is strong
  3 1 3 3 1 1

  % 23. If bean is Kanchanjunga Dark AND brew_duration is medium AND temperature is medium THEN coffee is strong
  4 2 2 3 1 1

  % 24. If (bean is Pahadi Light OR Himalayan Medium) AND brew_duration is short AND temperature is high THEN coffee is regular
  1 1 3 2 1 2  % OR with Pahadi Light
  2 1 3 2 1 2  % OR with Himalayan Medium

  % 25. If bean is Kanchanjunga Dark AND (brew_duration is long OR very long) AND temperature is medium THEN coffee is strong
  4 3 2 3 1 2  % OR with long
  4 4 2 3 1 2  % OR with very long
];

% showrule(coffee_fuzzy)
coffee_fuzzy = addrule(coffee_fuzzy, ruleList)

%% Define Input Cases
inputs = [
    3, 2, 70;      % Case 1
    7.5, 8.5, 100  % Case 2
];

%% Test All Defuzzification Methods
defuzz_methods = {'centroid', 'bisector', 'mom', 'som', 'lom'};
results = zeros(size(inputs, 1), length(defuzz_methods));

for i = 1:length(defuzz_methods)
    % Set defuzzification method
    coffee_fuzzy.DefuzzificationMethod = defuzz_methods{i};
    % Evaluate FIS for both input cases
    for j = 1:size(inputs, 1)
        results(j, i) = evalfis(coffee_fuzzy, inputs(j, :));
    end
end

%% Display Results
disp('Defuzzification Results:');
disp('Method    | Case 1 [3, 2, 70] | Case 2 [7.5, 8.5, 100]');
disp('----------|-------------------|-----------------------');
for i = 1:length(defuzz_methods)
    fprintf('%-9s | %-17.3f | %-17.3f\n', defuzz_methods{i}, results(1, i), results(2, i));
end
