---
layout: post
permalink: /posts/microsoft-learn/python
title: "Python For Beginners"
date: 2024-08-12 21:10
tags: Python
description: "Notes on Python Fundamentals"
---

# Python Course Notes

## What is Python?
Python is a widely used programming language, created in the early 1990s, applicable to tasks such as automation, web development, machine learning, and neural networks. Its simple syntax makes it easy to learn and run across platforms like Windows, macOS, and Linux.

## Running Python Code
Python is an interpreted language, eliminating the need for compilation, simplifying the `edit-test-debug` cycle. You can run Python code in two modes:
1. **Interactive Mode**: Commands executed immediately after being entered.
2. **Script Mode**: Commands written into a `.py` file are executed using the Python interpreter.
   ```bash
   python file_name.py
   ```

## The Python REPL
Python provides an interactive console called `REPL` (Read-Eval-Print-Loop) to execute commands and view results instantly.
```python
>>> 1 + 2
3
>>> print("Hello")
Hello
```

## Variables
Variables store data and are created using the assignment operator `=`.
```python
x = 10
name = "Python"
```

## Data Types
Python includes various built-in data types:
- **int**: Whole numbers.
- **float**: Decimal numbers.
- **bool**: `True` or `False`.
- **str**: Strings of characters.
```python
age = 25
price = 19.99
is_active = True
name = "John"
```

## The `print` Function
The `print()` function outputs text to the screen.
```python
print("Hello, World!")
```

## User Input
You can collect input using the `input()` function, which returns the input as a string.
```python
name = input("Enter your name: ")
print(f"Hello, {name}!")
```
Convert user input to an integer with `int()`:
```python
age = int(input("Enter your age: "))
print(f"You are {age} years old.")
```

## Line Continuation (`;\`)
You can continue a line of code across multiple lines using `;\`.
```python
a = 5; \
b = 10; \
sum = a + b; \
print(sum)
```

## Operators
Python supports various operators:
- **Arithmetic**: `+`, `-`, `*`, `/`.
- **Comparison**: `==`, `!=`, `<`, `>`.
- **Logical**: `and`, `or`, `not`.
```python
x = 5
y = 10
print(x + y)  # Arithmetic: 15
print(x > y)  # Comparison: False
```

## Command-Line Input
Python scripts can accept command-line arguments using the `sys` module.
```python
import sys
print(sys.argv)
```

## Conditional Statements
Use `if`, `elif`, and `else` to make decisions in Python.
```python
if x > 5:
    print("x is greater than 5")
elif x == 5:
    print("x equals 5")
else:
    print("x is less than 5")
```

## Boolean Logic
Combine conditions with `and` and `or` operators.
```python
if age > 18 and is_active:
    print("You are eligible.")
```

## Strings
Strings in Python are sequences of characters and are immutable.
```python
fact = "The Moon has no atmosphere."
print(fact)
```

### Quotation Marks
Strings can use single, double, or triple quotes for multiline text.
```python
message = """This is
a multiline
string."""
```

### String Methods
Python offers several methods for working with strings, like `split()`, `find()`, and `count()`.
```python
text = "The Moon has no atmosphere."
words = text.split()
print(words)
```

## Searching in Strings
Check if a substring exists using the `in` operator.
```python
print("Moon" in "Facts about the Moon")  # True
```
Use `.find()` for substring location or `.count()` to count occurrences.
```python
text = "Mars has two moons."
print(text.find("moons"))  # Returns index
print(text.count("Mars"))  # Count occurrences
```
### String Formatting in Python

#### 1. **Percent (%) Formatting**
   - Placeholder for variable: `%s`.
   - Format: `"string" % variable`.
   - Example:
     ```python
     mass_percentage = "1/6"
     print("On the Moon, you would weigh about %s of your weight on Earth." % mass_percentage)
     ```
     Output: `On the Moon, you would weigh about 1/6 of your weight on Earth.`
   
   - Multiple values require parentheses around variables:
     ```python
     print("""Both sides of the %s get the same amount of sunlight, but only one side is seen from %s because the %s rotates around its own axis when it orbits %s.""" 
     % ("Moon", "Earth", "Moon", "Earth"))
     ```
     Output: `Both sides of the Moon get the same amount of sunlight, but only one side is seen from Earth because the Moon rotates around its own axis when it orbits Earth.`
   
   - **Tip:** This method can lead to errors with multiple variables. Other methods are better for complex formatting.

#### 2. **The `.format()` Method**
   - Use `{}` as placeholders.
   - Format: `"string".format(variable)`.
   - Example:
     ```python
     mass_percentage = "1/6"
     print("On the Moon, you would weigh about {} of your weight on Earth.".format(mass_percentage))
     ```
     Output: `On the Moon, you would weigh about 1/6 of your weight on Earth.`
   
   - Reuse variables by referencing their index:
     ```python
     print("You are lighter on the {0}, because on the {0} you would weigh about {1} of your weight on Earth.".format("Moon", mass_percentage))
     ```
     Output: `You are lighter on the Moon, because on the Moon you would weigh about 1/6 of your weight on Earth.`
   
   - Use keyword arguments for improved readability:
     ```python
     print("You are lighter on the {moon}, because on the {moon} you would weigh about {mass} of your weight on Earth.".format(moon="Moon", mass=mass_percentage))
     ```
     Output: `You are lighter on the Moon, because on the Moon you would weigh about 1/6 of your weight on Earth.`

#### 3. **f-strings (Python 3.6+)**
   - Variables directly placed inside `{}`.
   - Format: `f"string {variable}"`.
   - Example:
     ```python
     print(f"On the Moon, you would weigh about {mass_percentage} of your weight on Earth.")
     ```
     Output: `On the Moon, you would weigh about 1/6 of your weight on Earth.`
   
   - Supports expressions inside `{}`:
     ```python
     print(f"On the Moon, you would weigh about {round(100/6, 1)}% of your weight on Earth.")
     ```
     Output: `On the Moon, you would weigh about 16.7% of your weight on Earth.`
   
   - String methods within f-strings:
     ```python
     subject = "interesting facts about the moon"
     heading = f"{subject.title()}"
     print(heading)
     ```
     Output: `Interesting Facts About The Moon.`

# Operators in Python

In Python, operators are symbols that perform operations on values or variables. Math typically involves four core operations—addition, subtraction, multiplication, and division—and Python supports these operators as well as many others. Here's a look at the most common ones you'll encounter in Python programs.

### 1. **Addition**
The `+` operator is used for addition. It adds two numbers together.

```python
answer = 30 + 12
print(answer)  # Output: 42
```
You can use the `+` operator with both literal numbers and variables.

### 2. **Subtraction**
The `-` operator is used for subtraction. It subtracts the second number from the first.

```python
difference = 30 - 12
print(difference)  # Output: 18
```

### 3. **Multiplication**
The `*` operator is used for multiplication. It multiplies two numbers together.

```python
product = 30 * 12
print(product)  # Output: 360
```

### 4. **Division**
The `/` operator is used for division. It divides the first number by the second and returns the quotient.

```python
quotient = 30 / 12
print(quotient)  # Output: 2.5
```

### 5. **Floor Division**
Floor division `//` is used when you want to divide two numbers and get the whole number (integer) quotient, discarding any remainder.

```python
seconds = 1042
display_minutes = 1042 // 60
print(display_minutes)  # Output: 17
```

### 6. **Modulo**
The `%` operator returns the remainder of a division. It's often used to determine how much is left over after dividing two numbers.

```python
display_seconds = 1042 % 60
print(display_seconds)  # Output: 22
```

### 7. **Order of Operations**
Python follows the standard order of operations (PEMDAS), which dictates the sequence in which operations should be evaluated:
- **P**arentheses
- **E**xponents
- **M**ultiplication and **D**ivision
- **A**ddition and **S**ubtraction

Parentheses are evaluated first, making them useful for controlling the order in which operations are performed.

```python
result_1 = 1032 + 26 * 2
print(result_1)  # Output: 1084

result_2 = 1032 + (26 * 2)
print(result_2)  # Output: 1084
```

In both cases, the result is the same because Python first evaluates the multiplication before performing the addition. However, using parentheses in `result_2` makes the intention of the calculation clearer.

# Working with Numbers in Python

Python provides a wide variety of tools to handle numbers, including conversion, rounding, and working with absolute values. Let's explore some common tasks and how to perform them in Python.

### 1. **Convert Strings to Numbers**
Python supports two primary number types: **integers** (`int`) and **floating point numbers** (`float`). An integer is a whole number, while a float has a decimal value.

To convert strings to numbers, use `int()` for integers and `float()` for floating point numbers.

```python
demo_int = int('215')
print(demo_int)  # Output: 215

demo_float = float('215.3')
print(demo_float)  # Output: 215.3
```
If the string cannot be converted (e.g., `'abc'`), you'll get an error.

### 2. **Absolute Values**
The absolute value is the non-negative version of a number, regardless of its sign. To get the absolute value of a number, use the `abs()` function.

```python
print(abs(39 - 16))  # Output: 23
print(abs(16 - 39))  # Output: 23
```
In both cases, `abs()` returns the same positive result, making it useful when the order of values doesn't matter.

### 3. **Rounding**
Python's `round()` function rounds a number to the nearest integer. If the decimal part is greater than `.5`, it rounds up; if it's less than `.5`, it rounds down. If the decimal part is exactly `.5`, Python rounds to the nearest even integer.

```python
print(round(1.4))  # Output: 1
print(round(1.5))  # Output: 2
print(round(2.5))  # Output: 2
print(round(2.6))  # Output: 3
```

### 4. **Math Library**
Python also provides a `math` library for more advanced operations, such as always rounding up or down using `ceil` and `floor`.

- `ceil()` always rounds up.
- `floor()` always rounds down.

```python
from math import ceil, floor

round_up = ceil(12.5)
print(round_up)  # Output: 13

round_down = floor(12.5)
print(round_down)  # Output: 12
```

The `math` library also includes other advanced mathematical functions, like calculating the value of pi, logarithms, and trigonometric functions.

These basic tools for working with numbers are essential for performing calculations and processing numerical data in Python.

# Introducing Lists in Python

## What is a List?
- A **list** is a Python data type used to store collections of values.

## Creating a List
- Lists are created by assigning a sequence of values to a variable using brackets `[]` and separating items with commas:

    ```python
    planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
    ```

## Accessing List Items by Index
- Items in a list can be accessed using their index (starting from 0):

    ```python
    print("The first planet is", planets[0])  # Output: Mercury
    print("The second planet is", planets[1])  # Output: Venus
    ```

## Modifying List Items
- You can modify values in a list by assigning a new value at a specific index:

    ```python
    planets[3] = "Red Planet"
    print("Mars is also known as", planets[3])  # Output: Mars is also known as Red Planet
    ```

## Determining the Length of a List
- Use the `len()` function to get the number of items in a list:

    ```python
    number_of_planets = len(planets)
    print("There are", number_of_planets, "planets in the solar system.")  # Output: 8
    ```

## Adding Values to Lists
- Use the `.append()` method to add an item to the end of the list:

    ```python
    planets.append("Pluto")
    number_of_planets = len(planets)
    print("There are actually", number_of_planets, "planets in the solar system.")  # Output: 9
    ```

## Removing Values from Lists
- The `.pop()` method removes the last item in the list:

    ```python
    planets.pop()  # Removes Pluto
    print("No, there are definitely", len(planets), "planets in the solar system.")  # Output: 8
    ```

## Using Negative Indexes
- Negative indexes access items from the end of the list:

    ```python
    print("The last planet is", planets[-1])  # Output: Neptune
    print("The penultimate planet is", planets[-2])  # Output: Uranus
    ```

## Finding a Value in a List
- The `.index()` method returns the index of a value in the list:

    ```python
    jupiter_index = planets.index("Jupiter")
    print("Jupiter is the", jupiter_index + 1, "planet from the sun")  # Output: 5th planet
    ```

Here is a concise summary of the provided text, along with a beautified markdown version:

### Short Notes

#### Working with Numbers in Lists
- **Planetary Gravity**: Measured in G, relative to Earth's gravity (1G).
- **Floats in Python**: Use floats to represent gravitational forces.
- **Gravity on Planets**:
  ```python
  gravity_on_planets = [0.378, 0.907, 1, 0.377, 2.36, 0.916, 0.889, 1.12]
  ```
- **Calculate Weights on Different Planets**:
  - Multiply object weight by the planet's gravity:
    ```python
    bus_weight = 124054  # Newtons on Earth
    mercury_weight = bus_weight * gravity_on_planets[0]  # On Mercury
    ```
- **Use `min()` and `max()` to Find Weight Extremes**:
  - `min()` gives the smallest weight, `max()` gives the largest.
  
#### Example:
```python
gravity_on_planets = [0.378, 0.907, 1, 0.377, 2.36, 0.916, 0.889, 1.12]
bus_weight = 124054  # Newtons on Earth

print("The lightest a bus would be:", bus_weight * min(gravity_on_planets), "N")
print("The heaviest a bus would be:", bus_weight * max(gravity_on_planets), "N")
```

# Work with Numbers in Lists

### Planetary Gravity
Gravity varies across planets and is measured in **G**, where Earth's gravity is 1G. For example, the Moon's gravity is 0.166G, and Neptune's is 1.12G.

### Store Numbers in Lists
To store numbers with decimal places, Python uses the `float` type. You can create a list of gravitational forces across planets as follows:

```python
gravity_on_planets = [0.378, 0.907, 1, 0.377, 2.36, 0.916, 0.889, 1.12]
```

Here, `gravity_on_planets[0]` represents the gravity on Mercury (0.378G), and so on.

### Calculate Weight on Different Planets
To find how much an object weighs on other planets, you multiply its weight on Earth by the planet’s gravity.

For example, to calculate the weight of a double-decker bus (124,054N) on Mercury:

```python
bus_weight = 124054  # in Newtons, on Earth
print("On Mercury, a double-decker bus weighs", bus_weight * gravity_on_planets[0], "N")
```

#### Output:
```
On Mercury, a double-decker bus weighs 46892.4 N
```

### Use `min()` and `max()` with Lists
You can find the smallest and largest gravitational values using `min()` and `max()`.

To determine the minimum and maximum weights a bus could have in the solar system:

```python
print("The lightest a bus would be in the solar system is", bus_weight * min(gravity_on_planets), "N")
print("The heaviest a bus would be in the solar system is", bus_weight * max(gravity_on_planets), "N")
```

#### Output:
```
The lightest a bus would be in the solar system is 46768.35 N
The heaviest a bus would be in the solar system is 292767.44 N
```

### Manipulating List Data

#### Slicing Lists
- **Slices** let you access portions of a list. You specify a starting and ending index using the syntax `list[start:end]`.
- The element at the end index is **not included**.
  
Example:
```python
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
planets_before_earth = planets[0:2]  # Slices items from index 0 to 1 (before Earth)
print(planets_before_earth)  # Output: ['Mercury', 'Venus']

planets_after_earth = planets[3:]  # Slices from index 3 to the end of the list
print(planets_after_earth)  # Output: ['Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune']
```

#### Joining Lists
- You can **concatenate** two lists using the `+` operator, which creates a new list.
  
Example:
```python
amalthea_group = ["Metis", "Adrastea", "Amalthea", "Thebe"]
galilean_moons = ["Io", "Europa", "Ganymede", "Callisto"]

regular_satellite_moons = amalthea_group + galilean_moons
print(regular_satellite_moons)
# Output: ['Metis', 'Adrastea', 'Amalthea', 'Thebe', 'Io', 'Europa', 'Ganymede', 'Callisto']
```

#### Sorting Lists
- Use the `.sort()` method to **sort lists**. This sorts alphabetically for strings and numerically for numbers. Sorting modifies the original list.

Example:
```python
regular_satellite_moons.sort()
print(regular_satellite_moons)  
# Output: ['Adrastea', 'Amalthea', 'Callisto', 'Europa', 'Ganymede', 'Io', 'Metis', 'Thebe']
```

- To **reverse sort**, use the `reverse=True` option:
```python
regular_satellite_moons.sort(reverse=True)
print(regular_satellite_moons)  
# Output: ['Thebe', 'Metis', 'Io', 'Ganymede', 'Europa', 'Callisto', 'Amalthea', 'Adrastea']
```

### Key Points:
- **Slicing** returns a new list without modifying the original.
- **Joining** lists with `+` creates a new list.
- **Sorting** modifies the original list in place.

---

# About `while` Loops

One common challenge when writing code is performing a task an unknown number of times. For example, you may want to allow a user to enter a list of planet names but don't know how many names they will input. In these situations, you can use a `while` loop.

### What is a `while` Loop?

A `while` loop continues to execute as long as a certain condition is **true**. You could use a `while` loop to:
- Check for another line in a file.
- Monitor if a flag has been set.
- Determine if a user has finished entering values.
- Check if something has changed, allowing the loop to end.

> **Important:** The key thing to remember with `while` loops is to ensure that the condition changes. If the condition remains true indefinitely, Python will continue to run the loop, eventually causing the program to crash.

---

### `while` Loop Syntax

The syntax of a `while` loop is similar to an `if` statement. You provide:
1. **The keyword `while`**, followed by a space.
2. **The condition** you want to test. If this condition is true, the code inside the loop runs.
3. **The code** that should run with each iteration, indented properly.

Example:

```python
while <condition>:
    # Code here
```
---

### Example: Prompting for User Input

The following code prompts users to enter values until they type `done`. The user input is the condition tested at the top of the `while` loop:

```python
user_input = ''

while user_input.lower() != 'done':
    user_input = input('Enter a new value, or type "done" when finished.')
```

> **Note:**  
We use the `.lower()` function to make the comparison case-insensitive, allowing the user to type `done` in any case.

---

### Adding User Input to a List

You can capture each value and store it in a list by expanding on the previous example:

```python
# Variable for user input
user_input = ''
# List to store values
inputs = []

# The while loop
while user_input.lower() != 'done':
    if user_input:  # Check if input is not empty
        inputs.append(user_input)  # Add input to the list
    user_input = input('Enter a new value, or type "done" when finished.')
```

> **Note:**  
The `if` statement inside the loop checks whether there is a value in `user_input`. The first time the loop runs, `user_input` is empty, so there’s nothing to store. Once the loop starts, the condition ensures that the input is only stored if it is not `done`.

---

### Python Doesn't Support `do-while` Loops

Some programming languages provide a `do` loop, which checks the condition at the **end** of the loop. Python does not support this feature, so all conditions must be checked at the **beginning** of a `while` loop.

---

# Using `for` Loops with Lists

In Python, **lists** can store various types of values, including strings and numbers. Here's an example of a list that stores the names of planets:

```python
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
```

You can access any item in a list using its **index**, which starts at 0:

```python
planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

print("The first planet is", planets[0])  # Mercury
print("The second planet is", planets[1])  # Venus
print("The third planet is", planets[2])   # Earth
```

---

### Looping Over Lists with `for` Loops

You can determine the length of a list using the `len()` function, but instead of using a `while` loop and a counter, you can use a `for` loop to **iterate** over the list. Since this is a common operation, Python provides `for` loops, which make it easier to iterate over **iterables** (types that can be looped over).

> **Note:** Python lists are iterable, and you can use `for` loops to go through each element of the list.

---

### Example: A Simple `for` Loop

Here’s an example of a `for` loop that counts down from 4 to 0:

```python
countdown = [4, 3, 2, 1, 0]

for number in countdown:
    print(number)
print("Blast off!! 🚀")
```

#### How `for` Loops Work

A `for` loop is made up of five important parts:

1. The word **`for`**, followed by a space.
2. A **variable** name (in this case, `number`) that will represent each value in the sequence.
3. The word **`in`**, surrounded by spaces.
4. The name of the **list** or iterable you want to loop over (in this example, `countdown`), followed by a colon (`:`).
5. The **code** you want to execute for each item in the iterable, indented properly.

---

### Adding Delays with the `sleep()` Function

You can modify the countdown example to wait for one second between each number using the `sleep()` function from the `time` module:

```python
from time import sleep

countdown = [4, 3, 2, 1, 0]

for number in countdown:
    print(number)
    sleep(1)  # Wait for 1 second
print("Blast off!! 🚀")
```

---

### A Quick Note on Whitespace

Most Python code uses **four spaces** as the unit of indentation. To avoid pressing the space bar four times, many code editors provide a **Tab** key shortcut that automatically inserts four spaces.

---

In conclusion, `for` loops are incredibly useful for iterating through lists and other iterable types in Python. By combining them with functions like `sleep()`, you can control the timing of your loop's execution.

---

# Introducing Python Dictionaries

In Python, variables can store different types of data such as strings or numbers. For instance:

```python
name = 'Earth'
moons = 1
```

However, when working with related data—such as storing details for different planets and their moons—this approach becomes inefficient. Here’s an example:

```python
earth_name = 'Earth'
earth_moons = 1

jupiter_name = 'Jupiter'
jupiter_moons = 79
```

This redundancy makes the code unwieldy, especially when dealing with larger datasets. Fortunately, Python **dictionaries** can simplify how you manage related data.

---

## What Are Dictionaries?

A **dictionary** in Python is a collection of **key/value** pairs. Think of it as a container that holds multiple variables, where each key (name) is associated with a specific value.

Dictionaries use **curly braces (`{}`)** to enclose the key/value pairs, with each pair separated by a **colon (`:`)**. Here’s an example of a dictionary that stores information about Earth:

```python
planet = {
    'name': 'Earth',
    'moons': 1
}
```

In this dictionary:
- **`'name'`** is a key with the value **`'Earth'`** (a string).
- **`'moons'`** is a key with the value **`1`** (an integer).

Keys can be strings, numbers, or other immutable types, while values can be of any type.

---

## Accessing Values in a Dictionary

You can access values stored in a dictionary using the `get()` method or square bracket (`[]`) notation. Here’s how to retrieve the value of `'name'`:

```python
print(planet.get('name'))  # Output: Earth
```

Alternatively, you can use square brackets, which are more concise:

```python
print(planet['name'])  # Output: Earth
```

### Difference between `get()` and `[]`:
- **`get()`** returns `None` if the key doesn’t exist.
- **Square brackets (`[]`)** raise a `KeyError` if the key isn’t found.

---

## Modifying Dictionary Values

You can modify dictionary values using the `update()` method or by directly assigning a new value using square brackets.

### Using `update()`:
```python
planet.update({'name': 'Makemake'})  # Changes 'name' to 'Makemake'
```

### Using square brackets:
```python
planet['name'] = 'Makemake'  # Also changes 'name' to 'Makemake'
```

Both methods work, but `update()` is useful for updating **multiple values** at once:

```python
planet.update({
    'name': 'Jupiter',
    'moons': 79
})
```

Using square brackets would require two separate operations for the same result:

```python
planet['name'] = 'Jupiter'
planet['moons'] = 79
```

---

## Adding and Removing Keys

You can add new keys to a dictionary at any time. For example, to add the **orbital period** of a planet:

```python
planet['orbital period'] = 4333
```

To **remove** a key, use the `pop()` method, which also returns the value of the removed key:

```python
planet.pop('orbital period')  # Removes 'orbital period'
```

---

## Nested Dictionaries

Dictionaries can store any type of value, including other dictionaries. This is useful for modeling more complex data. For example, let’s store both the **polar** and **equatorial** diameters of Jupiter:

```python
planet['diameter (km)'] = {
    'polar': 133709,
    'equatorial': 142984
}
```

To retrieve values from a nested dictionary, chain square brackets or `get()` calls:

```python
print(f"{planet['name']} polar diameter: {planet['diameter (km)']['polar']}")
# Output: Jupiter polar diameter: 133709
```

---

### Summary of Key Dictionary Operations:

- **Create**: Use curly braces `{}` to define a dictionary with key/value pairs.
- **Access**: Use `get()` or `[]` to retrieve values.
- **Modify**: Use `update()` or `[]` to change values.
- **Add**: Use `[]` to add new keys.
- **Remove**: Use `pop()` to delete keys.
- **Nested Data**: Store dictionaries inside other dictionaries for complex data structures.

Dictionaries provide a powerful and flexible way to work with structured data, making them an essential tool for many programming tasks.

---

## Dynamic Prgramming With Dictionaries

Dynamic programming with dictionaries in Python allows you to perform calculations and manipulate data dynamically. Let's break down some useful techniques with dictionaries, using an example of rainfall data for various months.

### 1. **Retrieve All Keys and Values:**
You can use the `keys()` method to get all the keys (months) in the dictionary and the `values()` method to get all the values (rainfall amounts). Here's an example:

```python
rainfall = {
    'october': 3.5,
    'november': 4.2,
    'december': 2.1
}

# Iterate through the keys and display the rainfall for each month
for key in rainfall.keys():
    print(f'{key}: {rainfall[key]} cm')
```

**Output:**
```
october: 3.5 cm
november: 4.2 cm
december: 2.1 cm
```

### 2. **Check if a Key Exists:**
To avoid overwriting an existing value in the dictionary, you can use the `in` keyword to check if a key exists:

```python
# Update rainfall in december or add if the key doesn't exist
if 'december' in rainfall:
    rainfall['december'] += 1
else:
    rainfall['december'] = 1

print(rainfall['december'])  # Output will be 3.1 (2.1 + 1)
```

This prevents overwriting existing data unless you're updating it intentionally.

### 3. **Retrieve All Values for Calculations:**
The `values()` method retrieves all the values (rainfall amounts) from the dictionary. You can use this to calculate totals or perform other aggregate operations.

For instance, to calculate the total rainfall over the last quarter:

```python
total_rainfall = sum(rainfall.values())
print(f'Total rainfall in the last quarter: {total_rainfall} cm')
```

**Output:**
```
Total rainfall in the last quarter: 9.8 cm
```

This dynamic approach eliminates the need to hard-code values, making your program more flexible and efficient.

### 4. **Adding or Updating Dictionary Entries:**
When adding or updating entries dynamically, you can either overwrite existing values or add new keys.

```python
rainfall['january'] = 4.0  # Adding a new month
rainfall['november'] += 0.5  # Updating existing month

print(rainfall)
```

**Output:**
```
{'october': 3.5, 'november': 4.7, 'december': 2.1, 'january': 4.0}
```

Using these techniques, you can effectively manage and manipulate dictionary data dynamically in Python, enabling you to handle more complex tasks.

---

# Python Functions

Python functions are a fundamental part of the language, allowing you to encapsulate reusable code. Here's a breakdown of the basics:

### 1. **Defining a Function**  
A function in Python is defined using the `def` keyword, followed by the function name, parentheses, and a block of code:

```python
def rocket_parts():
    print("payload, propellant, structure")
```

This creates a function named `rocket_parts()` that prints a statement. To **call** this function:

```python
rocket_parts()
```

**Output:**
```
payload, propellant, structure
```

### 2. **Return Values**  
If a function doesn't return anything explicitly, it returns `None` by default. For example:

```python
output = rocket_parts()
print(output)  # This will print 'None'
```

To return a value, use the `return` keyword:

```python
def rocket_parts():
    return "payload, propellant, structure"

output = rocket_parts()
print(output)  # This will print the string value
```

**Output:**
```
payload, propellant, structure
```

### 3. **Arguments in Functions**  
You can pass arguments to functions to make them more dynamic. For example:

```python
def greet(name):
    return f"Hello, {name}!"

print(greet("Alice"))
```

**Output:**
```
Hello, Alice!
```

#### Required Arguments:
Functions like `any()` require at least one argument, and calling them without any will raise an error:

```python
any([True, False, False])  # Output: True
any()  # Raises: TypeError: any() takes exactly one argument (0 given)
```

#### Optional Arguments:
Some functions, like `str()`, allow optional arguments:

```python
str()      # Output: ''
str(15)    # Output: '15'
```

In this case, calling `str()` without arguments returns an empty string, while passing a value returns its string representation.

### 4. **Summary**  
- **Functions** encapsulate reusable logic.
- **Return values** explicitly using `return` or implicitly return `None`.
- **Arguments** allow you to pass data to functions; they can be required or optional.
- Python’s built-in functions like `any()` and `str()` demonstrate how functions can work with or without arguments.

---
## Function Arguments In Python

In Python, functions can be made more flexible by using **arguments**. Arguments allow a function to take in data, perform calculations, or make decisions based on that input.

### 1. **Requiring an Argument**
A function can require an argument by including it inside the parentheses when defining the function. For example, a function that computes the distance to a destination from Earth could look like this:

```python
def distance_from_earth(destination):
    if destination == "Moon":
        return "238,855"
    else:
        return "Unable to compute to that destination"
```

To call this function, you need to provide a destination:

```python
print(distance_from_earth("Moon"))  # Output: 238,855
print(distance_from_earth("Saturn"))  # Output: Unable to compute to that destination
```

If you don't provide a required argument, Python will raise a `TypeError`.

### 2. **Multiple Required Arguments**
Functions can also take multiple arguments. For example, you can calculate the number of days it would take to reach a destination based on the distance and speed:

```python
def days_to_complete(distance, speed):
    hours = distance / speed
    return hours / 24
```

You can call this function by passing both the **distance** and **speed**:

```python
print(days_to_complete(238855, 75))  # Output: 132.69722222222222
```

### 3. **Functions as Arguments**
You can also use the result of one function as an argument for another function. For instance, you can use `days_to_complete()` in combination with the `round()` function to get the rounded number of days:

```python
total_days = days_to_complete(238855, 75)
print(round(total_days))  # Output: 133
```

Or pass the function result directly:

```python
print(round(days_to_complete(238855, 75)))  # Output: 133
```

This pattern can be useful, but it's important to ensure readability when nesting multiple function calls.

---

## Keyword Arguments In Python

In Python, **keyword arguments** allow you to pass arguments to a function by explicitly naming them, providing flexibility in how you call the function. Here's how you can work with keyword arguments effectively:

### 1. **Defining Keyword Arguments**
To define a keyword argument, assign it a default value in the function definition. For example, you can create a function that estimates the time of arrival for a space mission:

```python
from datetime import timedelta, datetime

def arrival_time(hours=51):
    now = datetime.now()
    arrival = now + timedelta(hours=hours)
    return arrival.strftime("Arrival: %A %H:%M")
```

### 2. **Calling Functions with Keyword Arguments**
You can call the function without any arguments, and it will use the default value for `hours`:

```python
print(arrival_time())  # Output: Arrival: [Current Day] [Current Time]
```

If you want to test the function with a specific duration, you can specify the `hours` argument:

```python
print(arrival_time(hours=0))  # Output: Arrival: [Current Day] [Current Time]
```

### 3. **Mixing Positional and Keyword Arguments**
When you have both required and optional arguments in a function, you should always define positional arguments first, followed by keyword arguments. For example, you can update the `arrival_time` function to include a destination as a required argument:

```python
def arrival_time(destination, hours=51):
    now = datetime.now()
    arrival = now + timedelta(hours=hours)
    return arrival.strftime(f"{destination} Arrival: %A %H:%M")
```

### 4. **Calling Functions with Mixed Arguments**
Now, since `destination` is required, you must provide it when calling the function:

```python
print(arrival_time("Moon"))  # Output: Moon Arrival: [Current Day] [Current Time]
```

You can still use keyword arguments for the optional parameters:

```python
print(arrival_time("Orbit", hours=0.13))  # Output: Orbit Arrival: [Calculated Day] [Calculated Time]
```

### Summary
- **Keyword arguments** allow for more flexibility and clarity when calling functions.
- You can mix positional and keyword arguments, but positional arguments must always come first in the function definition.
- Default values for keyword arguments make it possible to call functions without specifying every argument, making your code cleaner and easier to read.

---

## Variable Arguments In Python

In Python, **variable arguments** allow you to pass an arbitrary number of arguments to a function, making it versatile and able to handle different input scenarios. Here's how you can use variable arguments effectively, along with variable keyword arguments.

### 1. **Using Variable Arguments**
To create a function that accepts any number of positional arguments, use an asterisk (*) before the argument name. This collects all positional arguments into a tuple.

#### Example: Function with Variable Arguments
```python
def variable_length(*args):
    print(args)

# Try calling the function with different numbers of arguments
variable_length()                  # Output: ()
variable_length("one", "two")     # Output: ('one', 'two')
variable_length(None)              # Output: (None,)
```

### 2. **Practical Application of Variable Arguments**
You can create a function that calculates the total time until a launch, taking a variable number of time inputs:

```python
def sequence_time(*args):
    total_minutes = sum(args)
    if total_minutes < 60:
        return f"Total time to launch is {total_minutes} minutes."
    else:
        return f"Total time to launch is {total_minutes / 60} hours."

# Try calling the function with different time inputs
print(sequence_time(4, 14, 18))   # Output: Total time to launch is 36 minutes.
print(sequence_time(4, 14, 48))   # Output: Total time to launch is 1.1 hours.
```

### 3. **Using Variable Keyword Arguments**
To handle an arbitrary number of keyword arguments, use a double asterisk (**). This collects all keyword arguments into a dictionary.

#### Example: Function with Variable Keyword Arguments
```python
def variable_length(**kwargs):
    print(kwargs)

# Calling the function with different keyword arguments
variable_length(tanks=1, day="Wednesday", pilots=3)
# Output: {'tanks': 1, 'day': 'Wednesday', 'pilots': 3}
```

### 4. **Practical Application of Variable Keyword Arguments**
You can create a function that reports the astronauts assigned to a mission, using variable keyword arguments:

```python
def crew_members(**kwargs):
    print(f"{len(kwargs)} astronauts assigned for this mission:")
    for title, name in kwargs.items():
        print(f"{title}: {name}")

# Calling the function with astronaut titles and names
crew_members(captain="Neil Armstrong", pilot="Buzz Aldrin", command_pilot="Michael Collins")
# Output:
# 3 astronauts assigned for this mission:
# captain: Neil Armstrong
# pilot: Buzz Aldrin
# command_pilot: Michael Collins
```

### 5. **Important Notes**
- Variable arguments (`*args`) can accept any number of positional arguments.
- Variable keyword arguments (`**kwargs`) can accept any number of keyword arguments, which are treated as dictionary entries.
- If you use repeated keywords in `**kwargs`, Python will raise a `SyntaxError`.

### Summary
Using variable arguments and keyword arguments makes your functions flexible and able to handle varying numbers of inputs. They help create functions that can adapt to different contexts, which is particularly useful for larger projects.

---

# Error Handling

Even the best-written code will have errors. Errors can happen because of updates, moved files, or other unexpected changes. Fortunately, Python offers rich support for tracking down and handling errors.

## Using Traceback in Python

Understanding tracebacks in Python is essential for debugging and error handling. Tracebacks provide a detailed report of the sequence of events leading to an exception, helping developers identify and resolve issues in their code.

### What is a Traceback?
A **traceback** is a report generated by Python when an unhandled exception occurs. It details the call stack at the time of the error, including the sequence of function calls that led to the error, the line numbers, and the nature of the exception.

### Key Components of a Traceback
1. **File Paths**: The traceback shows the paths of all files involved in the function calls.
2. **Line Numbers**: Each file path includes the line number where the function is called.
3. **Function Names**: It lists the names of functions or methods involved in the exception.
4. **Exception Name**: The traceback ends with the name of the exception raised.

### Example of Traceback in Action
Let's explore a practical example to see how tracebacks work in Python.

#### Step 1: Create a Python Script
1. Open your desired directory in Visual Studio Code.
2. Create a new Python file named `open.py`.
3. Add the following code to the file:

```python
def main():
    open("/path/to/mars.jpg")

if __name__ == '__main__':
    main()
```

#### Step 2: Run the Script
Run the script in your terminal:

```bash
python3 open.py
```

#### Expected Output
You should see an output similar to this:

```
Traceback (most recent call last):
  File "/path/to/open.py", line 5, in <module>
    main()
  File "/path/to/open.py", line 2, in main
    open("/path/to/mars.jpg")
FileNotFoundError: [Errno 2] No such file or directory: '/path/to/mars.jpg'
```

### Breakdown of the Output
1. **Traceback Start**: Indicates the start of the traceback and the most recent call that failed.
2. **File Information**:
   - `File "/path/to/open.py", line 5, in <module>`: This line shows that the error occurred when executing the script located at `/path/to/open.py`, specifically at line 5 during the call to `main()`.
3. **Function Call Details**:
   - `File "/path/to/open.py", line 2, in main`: This line tells you that within the `main()` function, the error occurred at line 2 when trying to open the file.
4. **Error Type**: Finally, you see the `FileNotFoundError` exception with the error message indicating that the file does not exist.

### Why Tracebacks Are Useful
- **Debugging**: Tracebacks help you locate the source of an error quickly.
- **Understanding Flow**: They illustrate the flow of execution and how various functions relate to one another.
- **Error Information**: You get context about what went wrong and where, making it easier to implement fixes.

### Handling Exceptions Gracefully
Instead of allowing the program to crash with an unhandled exception, you can use try-except blocks to handle exceptions more gracefully:

```python
def main():
    try:
        open("/path/to/mars.jpg")
    except FileNotFoundError as e:
        print(f"Error: {e}")

if __name__ == '__main__':
    main()
```

### Summary
Tracebacks are powerful tools in Python for diagnosing errors and understanding the execution path leading to those errors. By mastering the interpretation of tracebacks, you can enhance your debugging skills, making it easier to develop robust software.

---

## Exception Handling

When you first find exceptions that show large tracebacks as output, you might be tempted to catch every error to prevent that from happening.

### Key Concepts of Exception Handling in Python

1. **Tracebacks**: 
   - When an unhandled exception occurs, Python provides a traceback that shows the sequence of function calls that led to the error, helping you diagnose the problem.
   - Example:
     ```python
     try:
         open("/path/to/mars.jpg")
     except FileNotFoundError as e:
         print(e)  # This will print the traceback when the file is not found.
     ```

2. **Try and Except Blocks**:
   - Use `try` to wrap code that may raise an exception, followed by `except` to handle the specific exception.
   - Example:
     ```python
     try:
         configuration = open('config.txt')
     except FileNotFoundError:
         print("Couldn't find the config.txt file!")
     ```

3. **Handling Multiple Exceptions**:
   - You can catch multiple specific exceptions separately to provide more descriptive error messages.
   - Example:
     ```python
     try:
         configuration = open('config.txt')
     except FileNotFoundError:
         print("Couldn't find the config.txt file!")
     except IsADirectoryError:
         print("Found config.txt but it is a directory, couldn't read it")
     ```

4. **Grouping Exceptions**:
   - You can group similar exceptions together in a single `except` clause using parentheses.
   - Example:
     ```python
     try:
         configuration = open('config.txt')
     except (FileNotFoundError, IsADirectoryError) as err:
         print("Error occurred:", err)
     ```

5. **Accessing Error Information**:
   - Use `as` to store the exception instance and access its attributes for more detailed information.
   - Example:
     ```python
     try:
         open("mars.jpg")
     except FileNotFoundError as err:
         print("Got a problem trying to read the file:", err)
     ```

6. **Using the OSError Exception**:
   - For more generalized error handling, catch the `OSError`, which can provide information for several types of file-related issues.
   - Example:
     ```python
     try:
         open("config.txt")
     except OSError as err:
         if err.errno == 2:
             print("Couldn't find the config.txt file!")
         elif err.errno == 13:
             print("Found config.txt but couldn't read it")
     ```

### Best Practices
- **Descriptive Error Messages**: Always provide meaningful messages that help users understand what went wrong and how to potentially fix it.
- **Specificity Over Generalization**: Catch specific exceptions unless you have a good reason to handle them all generically. This improves debuggability.
- **Maintain Readability**: Write code that is easy to read and maintain, while ensuring users get useful feedback during errors.

### Summary
By effectively using exceptions in Python, you can create robust programs that handle errors gracefully, providing users with clear feedback on issues and helping maintain control flow during unexpected situations. This is especially crucial in applications where errors can lead to severe consequences, such as in critical systems like navigation software for space missions. 

---

## Raise Exceptions

Raising exceptions is an important part of writing robust and user-friendly code. It allows you to signal error conditions clearly and provides context for what went wrong.

### Summary of Raising Exceptions

1. **Identifying Error Conditions**:
   - Determine when an error condition arises in your code. For example, if there is not enough water left for astronauts based on their daily usage.

2. **Using `raise`**:
   - Use the `raise` statement to trigger an exception when an error condition is detected. This can help other parts of your program handle the error appropriately.
   - Example:
     ```python
     if total_water_left < 0:
         raise RuntimeError(f"There is not enough water for {astronauts} astronauts after {days_left} days!")
     ```

3. **Catching Exceptions**:
   - In the calling code, use `try` and `except` blocks to catch raised exceptions and take appropriate action, such as alerting the navigation system in the case of insufficient water.

4. **Validating Input Types**:
   - Check if input arguments are of the expected types, and raise a `TypeError` with a user-friendly message if they are not.
   - Example:
     ```python
     for argument in [astronauts, water_left, days_left]:
         try:
             argument / 10  # Check if argument is an int
         except TypeError:
             raise TypeError(f"All arguments must be of type int, but received: '{argument}'")
     ```

5. **Improving Error Messages**:
   - Make error messages more informative and useful for debugging. This can help users understand what went wrong and how to fix it.
   - Example:
     ```python
     TypeError: All arguments must be of type int, but received: '3'
     ```

### Example Code for Reference
Here’s a complete example based on the concepts you learned:

```python
def water_left(astronauts, water_left, days_left):
    # Validate input types
    for argument in [astronauts, water_left, days_left]:
        try:
            argument / 10  # This operation checks if argument is an int
        except TypeError:
            raise TypeError(f"All arguments must be of type int, but received: '{argument}'")

    daily_usage = astronauts * 11
    total_usage = daily_usage * days_left
    total_water_left = water_left - total_usage

    # Raise exception if not enough water left
    if total_water_left < 0:
        raise RuntimeError(f"There is not enough water for {astronauts} astronauts after {days_left} days!")

    return f"Total water left after {days_left} days is: {total_water_left} liters"

# Example usage
try:
    print(water_left(5, 100, 2))
except RuntimeError as err:
    print(err)
except TypeError as err:
    print(err)

# Test with invalid inputs
try:
    print(water_left("3", "200", None))
except RuntimeError as err:
    print(err)
except TypeError as err:
    print(err)
```

### Conclusion
By raising exceptions and handling them effectively, you can create a more robust and user-friendly codebase. This practice not only helps in debugging but also provides clarity on the types of errors that can occur during execution, allowing users to address issues promptly. If you have any specific questions about this topic or need further examples, feel free to ask!
---