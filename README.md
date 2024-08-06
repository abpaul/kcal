# Calorie Calculator

This Ruby on Rails application provides a simple calorie calculator that helps users estimate their daily calorie needs and recommends a calorie intake for weight loss.

Demo: https://apb-kcal-e4f6df54a128.herokuapp.com

## Features

- Calculate Total Daily Energy Expenditure (TDEE) based on user input
- Provide recommended calorie intake for weight loss

## Setup

1. Clone the repository:
   ```
   git clone https://github.com/your-username/calorie-calculator.git
   cd calorie-calculator
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. Set up the database:
   ```
   rails db:setup
   ```

4. Start the Rails server:
   ```
   ./bin/dev
   ```

5. Visit `http://localhost:3000` in your browser to use the application.

## Project Structure

- `app/controllers/calorie_calculator_controller.rb`: Contains the logic for calculating TDEE and weight loss calories.
- `app/views/calorie_calculator/index.html.erb`: The main view with the calorie calculator form and results display.
- `app/javascript/controllers/calorie_calculator_controller.js`: Stimulus controller for handling responses and updating the DOM.

## Calculations

The application uses the following formulas:

1. Basal Metabolic Rate (BMR):
   - For men: 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
   - For women: 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)

2. Total Daily Energy Expenditure (TDEE):
   BMR * activity factor

   Activity factors:
   - Sedentary: 1.2
   - Light Exercise: 1.375
   - Moderate Exercise: 1.55
   - Active: 1.725
   - Very Active: 1.9

3. Weight Loss Calorie Recommendation:
   TDEE * 0.85 (15% calorie deficit)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
