pkg load fuzzy-logic-toolkit

%% let us define fuzzy inference system %%
coffee_fuzzy = newfis('CoffeeStrength');

%% Defining Bean Type with 4 categories %%
%% we are using gaussian membership function, so let's define sigma and c for each of our bean type categories %%
coffee_fuzzy = addvar(coffee_fuzzy, 'input', 'Bean_Type (X1)', [0 8]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Pahadi_Light', 'gaussmf', [1 1]); % for rule input index 1
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Himalayan_Medium', 'gaussmf', [1 3]); % input index 2
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Everest_Bold', 'gaussmf', [1 5]); % input index 3
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 1, 'Kanachanjunga_Dark', 'gaussmf', [1 7]); % input index 4
plotmf(coffee_fuzzy, 'input', 1);  % Bean_Type

% defining brewing duration input variable %%
%% we use gaussianmf for this variable %%
coffee_fuzzy = addvar(coffee_fuzzy, 'input', 'Brewing_Duration (X2)', [0 10]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Short', 'sigmf', [-1, 2]); %% Short: Espresso, Quick Pour-Over, input index - 1 %%
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Medium', 'gaussmf', [1.5, 4]); %% Medium: Standard Pour-Over, Drip, input index - 2 %%
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Long', 'gaussmf', [1.5 7]); %% Long: French Press, Slow-Brew , input index - 3 %%
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 2, 'Very_Long', 'gaussmf', [1 9]); %% Very Long: Cold Brew, Extended Steeping, input index - 4 %%
plotmf(coffee_fuzzy, 'input', 2)

%% defining water temperature input variable %%
%% low and high variable are sigmoid functions %%
%% medium is a guassian membership function %%
coffee_fuzzy = addvar(coffee_fuzzy, 'input', 'Water Temperature (X3)', [50 110]);
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 3, 'Low', 'sigmf', [-0.1 65]); % input index 1
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 3, 'Medium', 'gaussmf', [10 80]); % input index 2
coffee_fuzzy = addmf(coffee_fuzzy, 'input', 3, 'High', 'sigmf', [0.1 95]); % input index 3
plotmf(coffee_fuzzy, 'input', 3)

%% Defining Output Variable and Membership Functions %%
%% D: Coffee Strength(Mild, Regular, Strong, Extra Strong) %%
coffee_fuzzy = addvar(coffee_fuzzy, 'output', 'Coffee_Strength', [0 10]);
coffee_fuzzy = addmf(coffee_fuzzy, 'output', 1, 'Mild', 'gaussmf', [1 2]); % output index - 1
coffee_fuzzy = addmf(coffee_fuzzy, 'output', 1, 'Regular', 'gaussmf', [1 4]); % output index - 2
coffee_fuzzy = addmf(coffee_fuzzy, 'output', 1, 'Strong', 'gaussmf', [1 6]); % output index - 3
coffee_fuzzy = addmf(coffee_fuzzy, 'output', 1, 'Extra_Strong', 'gaussmf', [1 8]); % output index - 4
plotmf(coffee_fuzzy, 'output', 1)

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

% Evaluate the fuzzy system with the chosen inputs
%output_strength = evalfis([8, 3, 90], coffee_fuzzy);
%disp(['The inferred Coffee Strength for the given inputs is: ', num2str(output_strength)]);


%[X1, X2, X3] = meshgrid(0:0.1:8, 0:0.1:10);  % Grid for Bean_Type and Brewing_Duration

% Evaluate the FIS over the grid
%output_strength = zeros(size(X1));  % Initialize output array

 %Loop over the grid and evaluate the fuzzy system for each combination of inputs
%for i = 1:numel(X1)
%    inputs = [X1(i), X2(i), 80];  % Set Water Temperature (X3) to a constant, e.g., 80°C
%    output_strength(i) = evalfis(inputs, coffee_fuzzy);  % Evaluate fuzzy system
%end

% Reshape the output to match the size of the grid
%output_strength = reshape(output_strength, size(X1));

% Plot the 3D surface plot of Coffee Strength as a function of Bean_Type and Brewing_Duration
% figure;
%surf(X1, X2, output_strength);
%xlabel('Bean Type');
%ylabel('Brewing Duration');
%zlabel('Coffee Strength');
%title('Coffee Strength Surface Plot');
