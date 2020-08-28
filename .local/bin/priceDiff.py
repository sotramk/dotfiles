#!/bin/python

# Program to calculate the spread between two prices.

# Get information from user

def inpPD():
    """ Return the price difference between two prices as a %."""

    prompt = 'What is the current price?\n'
    currentPrice = input(prompt)
    if currentPrice == '':
       quit
    else:
        currentPrice = float(currentPrice)
        prompt = 'What is the target price?\n'
        targetPrice = float(input(prompt))

# calculate percentage difference of prices

        if currentPrice > targetPrice:
            result = (currentPrice / targetPrice - 1) * 100
            result = float(result)
        else:
            result = (targetPrice / currentPrice - 1) * 100
            result = float(result)
        print('Difference is ',round(result,2),' percent\n')
        inpPD()
inpPD()


