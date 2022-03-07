import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
actor {

    //Challenge 1
    public func add(n : Nat, m : Nat) : async Nat {
        return (n + m);
    };

    //Challenge 2
    public func square (n : Nat) : async Nat {
        return (n * n);
    };

    //Challenge 3
    public func days_to_second (n : Nat) : async Nat {
        return (n * 24 * 60 * 60);
    };

    //Challenge 4
    //New mutable variable called counter that will be used among functions
    //Since its counter I assume that the starting value will be 0
    var counter : Nat = 0;
    
    //increment counter by value n
    public func increment_counter (n : Nat) : async Nat {
        counter := counter + n;
        return (counter);
    };

    //reset counter to 0 and let the user know that it had beeen reseted
    public func clear_counter () : async Text {
        counter := 0;
        return ("Counter has been reseted to 0");
    };
    
    //just printing the value of counter withou modifying it, just for testing purpose
    public func print_counter () : async Nat {
        return (counter);
    };

    //Challenge 5
    //to get to know if n can be divided by m with result of natural number,
    //we have to test if modulo equals 0, in that case it can be divided, otherwise not
    public func divide (m : Nat, n : Nat) : async Bool {
        if ( n % m == 0) {
            return true;
        } else {
            return false;
        }
    }; 

    //Challenge 6
    //to find out if the number is even, we just have to test if modulo of that number equals 0
    public func is_even (n : Nat) : async Bool {
        if ( n % 2 == 0) {
            return true;
        } else {
            return false;
        }
    };

    //Challenge 7
    //I set up an array, then I itterate through it an adding each
    //number to the variable x that is used to calculate the sum
    let array : [Nat] = [5, 3, 4, 1, 7, 4, 12];
    public func sum_of_array() : async Nat {
        var x : Nat = 0;
        for (value in array.vals()){
            x := x + value;
        };
        return x;
    };

    //Challenge 8
    //similar to previous challenge, I am using the same array and comparing value
    //of each array element with my max variable, if its bigger than max, then
    //I update the max variable with value from that array element
    public func maximum() : async Nat {
        var max : Nat = 0;
        for (value in array.vals()){
            if (value > max) {
                max := value;
            };
        };
        return max;
    };

    //Challenge 9
    //I am using the filter function to compare my original array with
    //a number n, it is copied into the new field only if the value of
    //variable n is not equal to the value of the array element
    //Input for dfx:  dfx canister call day_1 remove_from_array '(vec{2;5;4;8;6;3;2;9},2)'
    public func remove_from_array(array: [Nat], n: Nat) : async [Nat] {
        Array.filter(array, func(val: Nat) : Bool { n != val });
    };
    //I have tried another way to make it, but it didnt work out because
    //of the index overflow, but I dont understand why
    public func remove_from_array2(n : Nat) {
        var index : Nat = 0;
        var new_array : [var Nat] = [var];
        for (value in array.vals()) {
            if (value != n) {
                new_array[index] := value;
                index := index + 1;
            };
        };
    };
    //testing function to print new array
    public func print_new_array(new_array : [Nat]) {
        for (value in new_array.vals()){
            Debug.print(debug_show(value))
        };
    };

    //Challenge 10
    public func selection_sort(array : [Nat]) : async [Nat] {
        Array.sort(array, Nat.compare(array)) == [1, 2, 4, 5, 6]);
        return array;
            
    };
    
    
}