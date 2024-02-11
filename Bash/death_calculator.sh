#! /usr/bin/bash
echo "Hello!"
read -p "Enter your age: " age
echo "You are $age years old"
read -p "At what age do you think you will die? " death_age
# Check if the user input is an integer
is_integer() {
        if [[ $1 =~ ^[0-9]+$ ]]; then
                return 0
        else
                return 1
        fi
}
if is_integer "$age" && is_integer "$death_age"; then
        echo "Both values are numbers, good job for listening to instructions"
        difference=$((death_age - age))
else
        echo "That is not an age you idiot"
        exit
fi
prompt_yes_no() {
        local prompt_message="$1"
while true; do
        echo -n "$prompt_message (y/n): "
        read answer
        case "$answer" in
                [Yy]* ) return 0;; # return true if answer is "yes" or "y"
                [Nn]* ) return 1;; # return false if answer is "no" or "n"
                * ) echo "Please answer yes or no.";;
        esac
done
}
if prompt_yes_no "Would you like to know how long you have left?"; then
        echo "You have $difference years left to live, sorry bud."
else
        echo "Too bad. I guess YOLO"
fi
