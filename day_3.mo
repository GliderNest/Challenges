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
        
    }
}