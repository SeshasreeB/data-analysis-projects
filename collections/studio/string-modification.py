my_string = "LaunchCode"


# a) Use string methods to remove the first three characters from the string and add them to the end.
temp = my_string[:3]
rest = my_string[3:]
print(rest)
print(temp)
mod_string = rest+temp
print(mod_string)

# Use a template literal to print the original and modified string in a descriptive phrase.
print(f"Original string is {my_string}, modified string is {mod_string}")


# b) Modify your code to accept user input. Query the user to enter the number of letters that will be relocated.
string_input = input("Enter the name: ")
n = int(input("Enter number of letters to be relocated: "))
temp = string_input[:n]
rest = string_input[n:]
print(rest)
print(temp)
mod_string = rest + temp
print(f"Original string is {string_input}, modified string is {mod_string}")
# c) Add validation to your code to deal with user inputs that are longer than the word. In such cases, default to moving 3 characters. 
# Also, the template literal should note the error.
string_input = input("Enter the name: ")
print(len(string_input))
n = int(input("Enter number of letters to be relocated: "))
if n> len(string_input):
    print("Number is longer than the word. Default to 3")
    n=3
    error_note = "(default used - input was longer than word)"
else:
    error_note =""
temp = string_input[:n]
rest = string_input[n:]
print(rest)
print(temp)
mod_string = rest + temp
print(f"Original string is {string_input}, modified string is {mod_string}{error_note}")
