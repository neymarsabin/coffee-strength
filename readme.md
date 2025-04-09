Coffee is more than just a beverage; it’s a personal experience influenced by various factors, from the type of coffee beans to the brewing method. For coffee enthusiasts, the strength of their brew is a defining element of their experience. However, selecting the right coffee strength based on factors such as bean type, brewing duration, and water temperature can be a daunting task. To simplify this decision-making process, a Fuzzy Logic System is implemented to recommend coffee strength based on user preferences.

In this case study, we present a Fuzzy Coffee Strength Recommender, a system designed to guide coffee drinkers in selecting the ideal coffee strength based on the type of coffee bean, brewing duration, and water temperature. The system uses Mamdani Fuzzy Logic principles to model the brewing process, providing intuitive and flexible recommendations tailored to the unique variables that affect coffee strength.

## Problem Statement
Choosing the right coffee strength is not just about following a standard recipe; it depends heavily on the specific combination of factors such as:

    Bean Type: Different beans have unique flavor profiles that influence the strength of the coffee. The Nepali coffee beans selected for this project include Pahadi Light, Himalayan Medium, Everest Bold, and Kanchenjunga Dark. Each bean offers a distinct taste and strength, influencing how they interact with brewing factors.

    Brew Duration: The length of time the water interacts with the coffee grounds plays a critical role in the extraction process. Short brews like espresso create more concentrated flavors, while longer brews like cold brew result in smoother and often stronger coffee.

    Water Temperature: The temperature of the water directly affects the extraction rate. Higher temperatures typically extract stronger flavors, while lower temperatures lead to a gentler brew.

## Objective
The objective of this project is to create a fuzzy inference system that takes in three primary factors:

    Bean Type (4 types of Nepali beans),

    Brew Duration (4 durations from Short to Very Long),

    Water Temperature (3 levels from Low to High),

and recommends a suitable coffee strength (ranging from Mild to Extra Strong). By using fuzzy membership functions and fuzzy inference rules, the system provides flexible, human-like reasoning, allowing for a more personalized coffee experience.

### Inputs
```
X1 = Bean Type(Pahadi Light, Himalayan Medium, Everest Bold, Kanchanjunga Dark)
X2 = Brewing Duration(Very Short, Short, Medium, Long, Very Long)
X3 = Water Temperature(Low, Medium, High)
```

X1 is the first input for `Bean Type` variable. The Bean type can be any of the following four types of inputs:
- Pahadi Light => Light Roast, Grown in mid-hills, fruity and acidic in flavor 
- Himalayan Medium => Medium Roast, well-balanced, nutty and caramel tones
- Everest Bold => Medium-Dark Roast, Slightly Caramel, Rich Body
- Kanachanjunga Dark => Dark Roast, Intense Smoky Flavor, Low Acidity

X2 is the second input in the system called `Brewing Duration`. The Brewing Duration can be any of the follow four types:
- Short => Espresso, Quick Pour-Over
- Medium => Standard Pour-Over, Drip Coffee
- Long => French Press, Slow-Brew
- Very Long => Cold Brew, Extended Steeping

X3 is the third input in the system called `Water Temperature`. The water temperature can be any of the following four categories:
- Low
- Medium
- High

### Outputs
```
D = Coffee Strength(Mild, Regular, Strong, Extra Strong)
```

### Rules
```matlab
%% 1. If bean is Pahadi Light and brew_duration is short, then coffee is mild. %%
%% 2. If bean is Pahadi Light and brew_duration is medium and temperature is low, then coffee is regular. %%
%% 3. If bean is Pahadi Light and brew_duration is long, the coffee is strong. %%
%% 4. If bean is Himalayan Medium and brew_duration is short and temperature is high, then coffee is regular. %%
%% 5. If bean is Himalayan Medium and brew_duration is medium and temperature is medium, then coffee is strong. %%
%% 6. If bean is Himalayan Medium and brew_duration is long, then coffee is strong. %%
%% 7. If bean is Everest Bold and brew_duration is medium and temperature is high, then coffee is strong. %%
%% 8. If bean is Everest Bold and brew_duration is long, then coffee is extra strong. %%
%% 9. If bean is Everest Bold and brew_duration is very long, then coffee is extra strong. %%
%% 10. If bean is Kanchanjunga Dark and brew_duration is very long and temperature is high, then coffee is extra strong. %%
%% 11. If bean is Kanchanjunga Dark and brew_duration is medium, then coffee is strong. %%
%% 12. If bean is Kanchanjunga Dark and brew_duration is long and temperature is low, then coffee is strong. %%
%% 13. If bean is Kanachanjunga Dark and brew duration is very long, then coffee is extra strong. %%
%% 14. If bean is Everest Bold and brew duration is Short, then coffee is regular. %%
%% 15. If bean is Everest Bold and brew duration is medium, then coffee is strong. %%
%% 16. If bean is Pahadi Light and brew duration is medium and temperature is high, then coffee is strong. %%
%% 17. If bean is Pahadi Light and brew duration is long and temperature is low, then coffee is regular. %%
%% 18. If bean is Himalayan Medium and brew duration is medium and temperature is high, then coffee is strong. %%
%% 19. If bean is Kanachanjunga Dark and brew duration is short and temperature is low, then coffee is regular. %%
%% 20. If bean is Kanachanjunga Dark and brew duration is long and temperature is high, then coffee is extra strong. %%
%% 21. If bean is Himalayan Medium and brew duration is short, then coffee is mild. %%
%% 22. If bean is Everest Bold and brew duration is short and temperature is high, then coffee is strong. %%
%% 23. If bean is Kanchanjunga Dark and brew duration is medium and temperature is medium, then coffee is strong. %%
%% 24. If (bean is Pahadi Light OR Himalayan Medium) AND brew_duration is short AND temperature is high THEN coffee is regular. %%
%% 25. If bean is Kanchanjunga Dark AND (brew_duration is long or very long) AND temperature is medium THEN coffee is strong. %%
```

## Implementation
Let us try and implement the `Mamdani Fuzzy Inference System` in octave using the fuzzy logic toolkit. For, that first define the inputs. 
