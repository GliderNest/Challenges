import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor {

    
    //Challenge 1
    public func nat_to_nat8(n : Nat) : async Nat8 {
        if (n < 256) {
            return Nat8.fromNat(n);
        } else {
            return 0;
        }
    };

    //Challenge 2
    public func max_number_with_n_bits (n : Nat) : async Nat {
        return ((Nat.pow(2,n))-1);
    };
    
    //Challenge 3
    //It is not done yet, needs to reverse the order of the bits in the text, but I dont have enough time to finish it
    public func decimal_to_bits (n : Nat) : async Text {
        var m = n;
        var mod : Nat = 0;
        var binary : Text = "";
        while (m != 0) {
            mod := m % 2;
            binary := Text.concat(binary, Nat.toText(mod));
            m := m / 2;
        };
        return (binary);
    };

};