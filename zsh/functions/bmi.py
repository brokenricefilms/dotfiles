#! /usr/bin/env python3

#  info: https://en.wikipedia.org/wiki/Body_mass_index

print("Count your BMI")

KG = float(input("Enter your weight (kg): "))
M = float(input("Enter your height (m): "))

BMI = KG / (M**2)

BMI = round(BMI, 2)

print("Your BMI is: " + str(BMI))

if 0 <= BMI < 15:
    print("Your heath is Very severely underweight")
elif 15 <= BMI < 16:
    print("Your heath is Severely underweight")
elif 16 <= BMI < 18.5:
    print("Your heath is Underweight")
elif 18.5 <= BMI < 25:
    print("Your heath is Normal (healthy weight)")
elif 25 <= BMI < 30:
    print("Your heath is Overweight")
elif 30 <= BMI < 35:
    print("Your heath is Obese Class I (Moderately obese)")
elif 35 <= BMI < 40:
    print("Your heath is Obese Class II (Severely obese)")
elif BMI >= 40:
    print("Your heath is Obese Class III (Very severely obese)")
