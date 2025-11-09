food = "water bottles,meal packs,snacks,chocolate"
equipment = "space suits,jet packs,tool belts,thermal detonators"
pets = "parrots,cats,moose,alien eggs"
sleep_aids = "blankets,pillows,eyepatches,alarm clocks"


# a) Use split to convert the strings into four cabinet lists. Alphabetize the contents of each cabinet.
cabinet1 = "water bottles,meal packs,snacks,chocolate".split(",")
cabinet2 = "space suits,jet packs,tool belts,thermal detonators".split(",")
cabinet3 = "parrots,cats,moose,alien eggs".split(",")
cabinet4 = "blankets,pillows,eyepatches,alarm clocks".split(",")
cabinet1.sort()
cabinet2.sort()
cabinet3.sort()
cabinet4.sort()
# print(cabinet1)
# print(cabinet2)
# print(cabinet3)
# print(cabinet4)


# b) Initialize a cargo_hold list and add the cabinet lists to it. Print cargo_hold to verify its structure.
cargoHold = [cabinet1,cabinet2,cabinet3,cabinet4]
print(cargoHold)


# c) Query the user to select a cabinet (0 - 3) in the cargo_hold.

user_cabinet = int(input("Enter a cabinet of your choice: "))

# d) Use bracket notation and format to display the contents of the selected cabinet. If the user entered an invalid number, print an error message.
if 0<= user_cabinet < len(cargoHold):
    print(cargoHold[user_cabinet])
else :
    print("error-invalid cabinet number")


# e) Modify the code to query the user for BOTH a cabinet in cargo_hold AND a particular item. Use the in method to check if the cabinet contains the selected item, then print “Cabinet ____ DOES/DOES NOT contain ____.”
cargoHold = [cabinet1,cabinet2,cabinet3,cabinet4]
user_cabinet = int(input("Enter a cabinet of your choice: "))
if 0<= user_cabinet < len(cargoHold):
        user_item = input("Enter the item you're looking for: ")
        if user_item in (cargoHold[user_cabinet]):
            print("Cabinet {0} DOES contain {1}.".format(user_cabinet,user_item))
        else:
            print("Cabinet {0} DOES NOT contain {1}.".format(user_cabinet,user_item))
else :
    print("error-invalid cabinet number")

