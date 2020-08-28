#!/bin/python
# rewrite of loss_calc.py
# Program to calculate profit goals and stoploss points from a buy point.
# written 07/2019
# Get stock symbol and purchase  price from user.
# Print output to screen.
stk = input('Stock symbol?')
prompt = 'What is the buy_price price?\n'
buy_price = float(input(prompt))
if buy_price == '':
    quit
else:
    firstTarget = buy_price * 1.05
    secoundTarget = buy_price * 1.10
    thirdTarget = buy_price * 1.23
    print('For a purchase price of ', buy_price)
    txt1 = "First target -- {:.2f}".format(firstTarget)
    print(txt1)
    txt2 = "Secound target -- {:.2f}".format(secoundTarget)
    print(txt2)
    txt3 = "Third target -- {:.2f}".format(thirdTarget)
    print(txt3)
    pct = ((.97, .96, .95, .94, .93, .92))
    y = 3
# Write to a text file.
f = open("/home/sot/Documents/invest/lcTest.txt", "a")
f.write("\n")
txt = "{} -- {}".format(stk.upper(), buy_price)
f.write(txt)
f.write("\n")
f.write(str(txt1))
f.write("\n")
f.write(str(txt2))
f.write("\n")
f.write(str(txt3))
f.write("\n")
f.write("\n")
for i in pct:
    x = i * buy_price
    x = float(x)
    x = round(x, 2)
    print(y, '% --', round(x, 2))
    txt = str(y) + '% --' + str(x)
    f.write(str(txt))
    f.write("\n")
    y = y + 1
f.close()
# Program to calculate the spread between prices.
# Get information from user.
##
#prompt = 'What is the current price?\n'
#target_price = input(prompt)
#target_price = float(input(prompt))
#
# Calculate percentage difference of prices.
#
#if buy_price > target_price:
#    result = (buy_price / target_price - 1) * 100
#    result = float(result)
#else:
#    result = (target_price / buy_price - 1) * 100
#    result = float(result)
#    print('Difference is ', round(result, 2), ' percent')
