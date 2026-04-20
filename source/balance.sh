#!/bin/bash

DATA_FILE="data.txt"

# Function: get_balance(phone_number)
get_balance() {
    local pn="$1"

    balance=$(grep "^$pn :" "$DATA_FILE" | awk -F ':' '{print $2}' | tr -d ' ')

    if [ -z "$balance" ]; then
        echo "Phone number not found."
    else
        echo "Balance for $pn: $balance"
    fi
}

# Function: deduct_balance(amount, phone_number)
deduct_balance() {
    local amount="$1"
    local pn="$2"

    line=$(grep "^$pn :" "$DATA_FILE")

    if [ -z "$line" ]; then
        echo "Phone number not found."
        return
    fi

    current_balance=$(echo "$line" | awk -F ':' '{print $2}' | tr -d ' ')

    if (( current_balance < amount )); then
        echo "Insufficient balance."
        return 1
    fi

    current_balance=$(echo "$line" | awk -F ':' '{print $2}' | tr -d ' ')

    if (( current_balance < amount )); then
        return 2   # insufficient balance
    fi

    new_balance=$((current_balance - amount))
    sed -i "s/^$pn : .*/$pn : $new_balance/" "$DATA_FILE"

    return 0 
}