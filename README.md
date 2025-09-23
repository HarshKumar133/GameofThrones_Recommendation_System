# Game of Thrones - Complete Knowledge Base & Recommendation System

*An intelligent Prolog-based system covering the complete Game of Thrones series (Seasons 1-8) with AI-powered recommendations and strategic analysis.*

## Overview

This comprehensive Prolog knowledge base contains:
- **Complete family trees** of all major houses
- **Character relationships** and bloodlines
- **Updated character statuses** through Season 8
- **Political positions** and titles after the series finale
- **Character traits** and personality analysis
- **Intelligent recommendation systems** for marriages, alliances, and strategy
- **Interactive analysis tools** and game statistics

## Quick Start

### Option 1: Online Prolog Compiler (Recommended)
1. Go to [SWISH - SWI-Prolog for SHaring](https://swish.swi-prolog.org/)
2. Create a new program
3. Copy and paste the entire `game_of_thrones_kb.pl` file
4. Click "Run" 
5. Start querying in the console below!

### Option 2: Local Installation
1. Install SWI-Prolog from [https://www.swi-prolog.org/Download.html](https://www.swi-prolog.org/Download.html)
2. Download the `game_of_thrones_kb.pl` file
3. Open terminal/command prompt
4. Navigate to the file directory
5. Run: `swipl game_of_thrones_kb.pl`

### Option 3: Alternative Online Compilers
- [Tau Prolog Playground](http://tau-prolog.org/sandbox/)
- [JDoodle Prolog Online](https://www.jdoodle.com/execute-prolog-online/)

## How to Use

### Basic Commands
Once loaded, the system starts automatically. Try these commands:

```prolog
?- help.
```
*Shows all available commands*

```prolog
?- analyze_endgame.
```
*Displays the complete series finale analysis*

## Sample Queries by Category

### 1. Character Information
```prolog
% Get complete character profile
?- character_profile(jon_snow).
?- character_profile(daenerys_targaryen).
?- character_profile(tyrion_lannister).

% Check if someone is alive
?- status(arya_stark, X).
?- status(cersei_lannister, X).

% Find someone's title
?- title(bran_stark, X).
?- title(sansa_stark, X).
```

### 2. Family Relationships
```prolog
% Find parents
?- parent(X, jon_snow).
?- parent(X, daenerys_targaryen).

% Find children
?- parent(eddard_stark, X).
?- parent(tywin_lannister, X).

% Find siblings
?- sibling(arya_stark, X).
?- sibling(cersei_lannister, X).

% Check family relationships
?- brother(jon_snow, robb_stark).
?- sister(sansa_stark, arya_stark).
```

### 3. Strategic Recommendations
```prolog
% Get all recommendations for a character
?- get_recommendations(jon_snow).
?- get_recommendations(sansa_stark).

% Find marriage recommendations
?- marriage_recommendation(jon_snow, X, Y).
?- marriage_recommendation(gendry, X, Y).

% Find alliance opportunities
?- alliance_recommendation(X, Y, Z).

% Check character compatibility
?- compatible_characters(jon_snow, X, Y).
```

### 4. Political Analysis
```prolog
% Who controls what regions?
?- controls_region(X, the_north).
?- controls_region(X, six_kingdoms).

% Find powerful houses
?- powerful_house(X).
?- most_successful_house(X).

% Check survival probabilities
?- survival_probability(jon_snow, X).
?- survival_probability(tyrion_lannister, X).
```

### 5. Game Statistics
```prolog
% List all survivors
?- final_survivors(X).

% Count deaths by house
?- house_member(X, lannister), status(X, dead).
?- house_member(X, stark), status(X, alive).

% Find leadership recommendations
?- leadership_recommendation(X, advisor, Y).
?- leadership_recommendation(X, military_commander, Y).
```

### 6. Advanced Queries
```prolog
% Find all Targaryens
?- house_member(X, targaryen).

% Who has dragon blood?
?- trait(X, dragon_blood).

% Find all current rulers
?- title(X, Y), status(X, alive).

% Characters with specific traits
?- trait(X, honorable), status(X, alive).
?- trait(X, intelligent), trait(X, diplomatic).
```

## Key Features

### 1. **Complete Character Database**
- All major characters from Houses Stark, Lannister, Targaryen, Baratheon, Tyrell, Greyjoy, Martell, and Tarly
- Updated through Season 8 finale
- Character traits, titles, and relationships

### 2. **Intelligent Recommendation System**
- **Marriage Alliances**: Find strategic marriage opportunities
- **Political Alliances**: Identify beneficial partnerships
- **Character Compatibility**: Match characters by personality traits
- **Leadership Roles**: Recommend positions based on skills

### 3. **Strategic Analysis**
- House power rankings
- Survival probability calculations
- Regional control analysis
- Character trait distributions

### 4. **Interactive Tools**
- Character profile generator
- Endgame analysis
- Comprehensive help system
- Real-time query responses

## Sample Output Examples

### Character Profile Example:
```
?- character_profile(jon_snow).
jon_snow - Status: alive
Title: nights_watch_commander
Traits: [honorable,brave,loyal,brooding]
House: stark
Survival Probability: medium
```

### Endgame Analysis Example:
```
?- analyze_endgame.
=== GAME OF THRONES FINAL OUTCOME ANALYSIS ===
Ultimate Winner: Bran Stark (king_of_six_kingdoms)
Northern Independence: Sansa Stark (queen_in_the_north)
Total Survivors: 13
Key Survivors: [arya_stark,bran_stark,gendry,jon_snow,sansa_stark,tyrion_lannister,yara_greyjoy,samwell_tarly,gilly,sam_jr,brienne_of_tarth,the_hound,tormund_giantsbane]
```

### Recommendations Example:
```
?- get_recommendations(sansa_stark).
=== RECOMMENDATIONS FOR sansa_stark ===
Marriage Options: [[gendry,political_alliance],[samwell_tarly,political_alliance]]
Strategic Advice: [[ally_with(yara_greyjoy),territorial_strength]]
Compatible Characters: [[tyrion_lannister,intellectual_match]]
```

## Troubleshooting

### Common Issues:
1. **Syntax Errors**: Make sure to end queries with a period (`.`)
2. **Name Format**: Use lowercase with underscores (e.g., `jon_snow`, not `Jon Snow`)
3. **Unknown Variables**: Use capital letters for variables (e.g., `X`, `Y`, `Person`)

### Tips for Better Results:
- Use `findall/3` to get all solutions at once
- Try different variations of character names
- Use the `help.` command when stuck
- Start with simple queries before complex ones

## Advanced Usage

### Custom Rules
You can add your own rules! For example:
```prolog
% Add a custom relationship
loves(jon_snow, daenerys_targaryen).
loves(jaime_lannister, cersei_lannister).

% Add custom analysis
tragic_love(X, Y) :- 
    loves(X, Y), 
    status(X, dead); 
    status(Y, dead).
```

### Query Combinations
```prolog
% Find all honorable survivors
?- trait(X, honorable), status(X, alive).

% Find potential rulers who are intelligent
?- potential_ruler(X), trait(X, intelligent).

% Complex family queries
?- parent(P1, X), parent(P2, X), dif(P1, P2).
```

## System Statistics

- **Characters**: 50+ major characters
- **Houses**: 7 great houses + minor houses
- **Relationships**: 200+ family connections
- **Traits**: 15+ personality characteristics
- **Recommendations**: Multiple AI-powered suggestion systems
- **Time Period**: Complete series (Seasons 1-8)

## Future Enhancements

- House Targaryen restoration scenarios
- Battle outcome predictions
- Economic analysis of kingdoms
- Dragon inheritance patterns
- Prophecy tracking system

---
*"When you play the game of thrones, you win or you die. But with Prolog, you can analyze it all!"*
