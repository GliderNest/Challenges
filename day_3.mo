import Array "mo:base/Array";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
actor {
    
    //Challenge 1
    //Because its not possible to call directly private function and
    //it also seems that public function cant return a mutable array
    //so I had to create a public function that will transform
    //immutable array into mutable and passes it to the private function
    //for swap, then it converts the result back to immutable array
    public func swap2 (array : [Nat], j : Nat, i: Nat) : async [Nat] {
        return Array.freeze(swap(Array.thaw(array), j, i));
    };
    
    private func swap (array : [var Nat], j : Nat, i: Nat) : [var Nat] {
        let temp = array[i];
        array[i] := array[j];
        array[j] := temp;
        return array;

    };

    //Challenge 2
    //Because as I have learnt in the guide, in Motoko, when the array is created
    //it sets its size that cant be changed. So I firstly initialize an empty
    //array of known size n and then itterate through the array to assign the values
    //to the elements, at the end I had to convert it back to immutable array
    public func init_count (n : Nat) : async [Nat] {
        let array : [var Nat] = Array.init(n,0);
        var i : Nat = 0;
        for (j in Iter.range(0, n-1)) {
            array [j] := j;
            assert(j == i);
            i += 1;
         };
        return Array.freeze(array);
    };

    //Challenge 3
    //Firstly I am cycling through the array and concatenate all the elements
    //converted to the text to one variable called string, then using the functions
    //from base library Text.contains with the pattern to find out if the Text contains any 7 
    public func seven (array : [Nat]) : async Text {
        var string : Text = "";
        for (value in array.vals()){
            string := Text.concat(string, Nat.toText(value));
        };
        if (Text.contains(string, #char '7')) {
            return "Seven has been found!";
        } else {
            return "Seven has not been found!";
        };
        
    };

    //Challenge 4
    public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
        switch(n){
            // Case where n is null
            case(null) {
                return m;
            };
            // Case where n is a nat
            case(?something){
                return something;
            };
        };
    };

    //Challenge 5
    public func  day_of_the_week(n : Nat) : async ?Text {
        switch(n){
            // Cases where n is 1 to 7 for each day of the week
            case(1) {
                return ?"Monday";
            };
            case(2) {
                return ?"Tuesday";
            };
            case(3) {
                return ?"Wednesday";
            };
            case(4) {
                return ?"Thursday";
            };
            case(5) {
                return ?"Friday";
            };
            case(6) {
                return ?"Saturday";
            };
            case(7) {
                return ?"Sunday";
            };
            // Case where n something else than number 1 to 7
            case(something){
                return null;
            };
        };
    };

    //Challenge 6
    //creating the function to be used as a parameter in the map function
    //to convert null elements to 0    
    let f = func (n : ?Nat) : Nat {
        switch(n){
            // Case where n is null
            case(null) {
                return 0;
            };
            // Case where n is a nat
            case(?something){
                return something;
            };
        };
    };
    
    public func populate_array(array : [?Nat]) : async [Nat] {
        return (Array.map(array, f));
    };

    //Challenge 7
    let f_sum = func (m : Nat, n : Nat) : Nat {
        return m + n;
    };
    
    public func sum_of_array(array : [Nat]) : async Nat {
        return Array.foldLeft(array, 0, f_sum);
    };

    //Challenge 8
    let f_square = func (m : Nat) : Nat {
        return m**2;
    };

    public func squared_array(array : [Nat]) : async [Nat] {
        return (Array.map(array, f_square));
    };

    //Challenge 9
    let f_increase = func (m : Nat, index : Nat) : Nat {
        return m + index;
    };
    
    public func increase_by_index(array : [Nat]) : async [Nat] {
        return (Array.mapEntries(array, f_increase));
    };

    //Challenge 10
    //testing function used to compare the values
    let test_func = func (m : Nat, n : Nat) : Bool {
        if (m == n) {
            return true;
        };
        return false;
    };
    
    //the main contains higher order function we should make
    func contains<A>(array: [A], a : A, f : (A, A) -> Bool) : Bool {
        for (value in array.vals()) {
            if (f(value, a)) {
                return true;
            };
        };
        return false;
    };

    //public function for testing functionality of the function above
    public func test_contains_nat(array : [Nat], n: Nat) : async Bool {
        return contains<Nat>(array, n, test_func);
    };
}