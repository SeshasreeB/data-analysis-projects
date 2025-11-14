# We want to COMPLETELY reverse a list by flipping the order of the entries AND flipping the order of characters in each element.

# a) Define a 'reverse_characters' function. Give it one parameter, which will be the string to reverse.

# b) Within the function, use the 'list' function to split a string into a list of individual characters
# c) 'reverse' your new list.
# d) Use 'join' to create the reversed string and return that string from the function.
# e) Create a variable of type string to test your new function. # f) Use 'print(reverse_characters(my_variable_name))'; to call the function and verify that it correctly reverses the characters in the string.
# g) Use method chaining to reduce the lines of code within the function.
def rev_character(string_reverse):
    char_list = list(string_reverse)
    char_list.reverse()
    rev_string = ''.join(char_list)
    return rev_string
test_string = 'LC102'
print(rev_character(test_string))
# -------------------------
# print(rev_character(string_reverse))
# def reverse_characters(string_reverse):
#     return "".join(list(string_reverse)[::-1])

# string_reverse = "launchcode"

# print(reverse_characters(string_reverse))

# 2) The 'split' method does not work on numbers, but we want the function to return a number with all the digits reversed (e.g. 1234 converts to 4321 and NOT the string "4321")
# a) Add an if statement to your reverse_characters function to check the typeof the parameter.
# b - d) If type is ‘string’, return the reversed string as before. If type is ‘number’, convert the parameter to a string, reverse the characters, then convert it back into a number. Return the reversed number.
# e) Be sure to print the result returned by the function to verify that your code works for both strings and numbers. Do this before moving on to the next steps.
def reverse_characters(input_reverse):
    if type(input_reverse) == str:
        return "".join(list(input_reverse)[::-1])
    if type(input_reverse) == int:
        new_string = str(input_reverse)
        new_string_reverse = "".join(list(new_string)[::-1])
        number_reverse = int(new_string_reverse)
        return number_reverse
#input_reverse = "LaunchCode"
input_reverse = 123456
print(reverse_characters(input_reverse))
# 3) Create a new function with one parameter, which is the list we want to change. The function should:
# a) Define and initialize an empty list.
# b) Loop through the old list.
# c) For each element in the old list, call reverse_characters to flip the characters or digits.
# d) Add the reversed string (or number) to the list defined in part ‘a’.
# e) Return the final, reversed list.
# f) Be sure to print the results from each test case in order to verify your code.

list_test1 = ['apple', 'potato', 'Capitalized Words']
list_test2 = [123, 8897, 42, 1168, 8675309]
list_test3 = ['hello', 'world', 123, 'orange']
def change_list(list_to_change):
    new_list = []
    for i in list_to_change:
        new_list.append(reverse_characters(i))
    return new_list
print(change_list(list_test1))
print(change_list(list_test2))
print(change_list(list_test3))
