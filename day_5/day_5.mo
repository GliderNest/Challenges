import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";

shared ({ caller = creator }) actor class MyCanister() = {

    //Challenge 1
    public shared({caller}) func whoami() : async Principal {
        return(caller);
    };

    public shared({caller}) func is_anonymous() : async Bool {
        let anonymous : Principal = Principal.fromText ("2vxsx-fae");
        if (caller == anonymous){
            return(true);
        } else {
            return(false);
        };
    };

    //Challenge 2

    let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
    favoriteNumber.put(anonymous_principal, 33);

    public func get_favorite_number() : async ?Nat {
        return(favoriteNumber.get(Principal.fromText("2vxsx-fae")));
    };

    //Guide example
    /*
    let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
    let users = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);
    users.put(anonymous_principal, "This is the anonymous principal");
_
    public func test() : async ?Text {
        return(users.get(Principal.fromText("2vxsx-fae")));
    };
    */

    //Challenge 3
    public shared({caller}) func add_favorite_number (number : Nat) : async () {
        favoriteNumber.put (caller, number);
    };

    public shared({caller}) func show_favorite_number () : async ?Nat {
        return(favoriteNumber.get(caller));
    };

    /*
    public func deposit_cycles(): async Nat {
        let n = Cycles.accept(Cycles.available());
        return(n);
    };

    stable var version_number : Nat = 0;
    system func postupgrade() {
        version_number := version_number + 1;
    };
    public func version() : async Nat {
      return version_number; 
    };
    */
}
