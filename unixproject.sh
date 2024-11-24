i="y"
echo "This is a simple arithmetic program."

while [ "$i" = "y" ]; do
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Table of any number"
    echo "6. Check if the number is even or odd"
    echo "7. Factorial of any number"
    echo "8. Check if the number is Armstrong or not"
    echo "9. Check if the number is prime"
    echo "10. Check if thee number is fibonacci"
    echo -n "Enter your choice: "
    read -r ch
    
    case $ch in
    1)
        echo -n "Enter the first number: "cd
        read -r a
        echo -n "Enter the second number: "
        read -r b
        echo "$a + $b = $((a + b))"
        ;;
    2)
        echo -n "Enter the first number: "
        read -r a
        echo -n "Enter the second number: "
        read -r b
        echo "$a - $b = $((a - b))"
        ;;
    3)
        echo -n "Enter the first number: "
        read -r a
        echo -n "Enter the second number: "
        read -r b
        echo "$a * $b = $((a * b))"
        ;;
    4)
        echo -n "Enter the first number: "
        read -r a
        echo -n "Enter the second number: "
        read -r b
        if [ "$b" -eq 0 ]; then
            echo "Division by zero is not allowed."
        else
            result=$(echo "scale=2; $a / $b" | bc)
            echo "$a / $b = $result"
        fi
        ;;
    5)
        echo -n "Enter The Number upto which you want to Print Table: "
        read -r n
        i=1
        while [ $i -ne 10 ]; do
            i=$((i + 1))
            table=$((i * n))
            echo "$table"
        done
        ;;
    6)
        echo -n "Enter The Number: "
        read -r n
        if [ $((n % 2)) -eq 0 ]; then
            echo "is a Even Number"
        else
            echo "is a Odd Number"
        fi
        ;;

    7)
        echo -n "Enter The Number: "
        read -r a
        fact=1
        while [ "$a" -ne 0 ]; do
            fact=$((fact * a))
            a=$((a - 1))
        done
        echo $fact
        ;;
    8)
        echo -n "Enter A Number: "
        read -r n
        arm=0
        temp=$n
        while [ "$n" -ne 0 ]; do
            r=$((n % 10))
            arm=$((arm + r * r * r))
            n=$((n / 10))
        done
        echo $arm
        if [ $arm -eq "$temp" ]; then
            echo "Armstrong"
        else
            echo "Not Armstrong"
        fi
        ;;
    9)
        echo -n "Enter Any Number: "
        read -r n
        i=1; c=1
        while [ $i -le "$n" ]; do
                i=$((i + 1))
                r=$((n % i))
                [ $r -eq 0 ] && c=$((c + 1))
        done

        if [ $c -eq 2 ]; then
            echo "Prime"
        else
            echo "Not Prime"
        fi
        ;;
   10)
        
        isPerfectSquare() {
        local num=$1
        local sqrt=$(echo "scale=0; sqrt($num)" | bc)
        if (( sqrt * sqrt == num )); then
            return 0  # True
        else
            return 1  # False
        fi
        }

        # Function to check if a number is a Fibonacci number
        isFibonacci() {
        local n=$1
        # A number is a Fibonacci number if one of these is a perfect square:
        # 5*n^2 + 4 or 5*n^2 - 4
        local check1=$((5 * n * n + 4))
        local check2=$((5 * n * n - 4))

        if isPerfectSquare $check1 || isPerfectSquare $check2; then
            return 0  # True
        else
            return 1  # False
        fi
        }

        # Read input number
        read -p "Enter a number: " number

        # Validate input
        if ! [[ $number =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid positive integer."
        exit 1
        fi

        # Check if the number is a Fibonacci number
        if isFibonacci $number; then
        echo "$number is a Fibonacci number."
        else
        echo "$number is not a Fibonacci number."
        fi

       ;;
  11)
        echo "Enter the part value:"
        read part
        
        echo "Enter the total value:"
        read total
        
        # Check if total is zero to avoid division by zero
        if [ "$total" -eq 0 ]; then
          echo "Total value cannot be zero."
          exit 1
        fi
        
        # Calculate the percentage
        percentage=$(echo "scale=2; ($part / $total) * 100" | bc)
        
        # Display the result
        echo "The percentage is: $percentage%"   
        ;; 
  *)
        echo "Invalid choice. Please try again."
        ;;
    esac

    echo -n "Do you want to continue (y/n)? "
    read -r i
    if [ "$i" != "y" ]; then
        echo "Exiting the program."
        exit
    fi
done
