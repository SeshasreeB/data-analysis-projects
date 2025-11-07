# ---- Exercise 2: Bracket Notation Basics ----

text = 'Strings_are_sequences_of_characters.'
word = 'tomato'
# 1. Print a slice of the first 12 characters from 'text'.
print(text[0:12])

# 2. Print a slice of the last 12 characters from 'text'. You should NOT have to count the index values yourself!
print(text[-12:])
print(text[len(text) - 12])

# 3. Print a slice of the middle 12 characters from 'text'.
print(text[12:24])

# ---- Exercise 3: Looping Through a String ----

# Use index values to loop backwards through 'word'.

# 1. Print 1 letter per line.
for letter in word[::-1]:
    print(letter)

# 2. Refactor the code to use the accumulator pattern to build up and print the reversed string. For example, if given 'good', print 'doog' on one line.
name = "good"
# rev_name = name[::-1]
# print (name,rev_name)
rev_name = ""
for letter in name:
    rev_name = letter + rev_name
print(name, rev_name)
    
# 3. Refactor the code to print a combination of the original and reversed string. For example, given 'tomato', print 'tomatootamot'. (If you want to be fancy, print 'tomato | otamot').
rev_word = "" 
for letter in word :
    rev_word = letter + rev_word
print(word+rev_word)
print(word +" | " + rev_word)