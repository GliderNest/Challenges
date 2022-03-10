import Custom "custom";
import Animal "animal";
actor {
    
    //Challenge 1
    public type FortuneTeller = Custom.FortuneTeller;
    
    let george : FortuneTeller = {
        futureJob = "Coder";
        age = 30;
        color = "purple";
        married = false;
    };

    public func fun() : async FortuneTeller {
        return george;
    };
    
    //Challenge 2
    public type Animal = Animal.Animal;
    let rex : Animal = {
        species = "dog";
        energy = 75;
    };

    //Challenge 3
    public func create_animal_then_takes_a_break (species : Text, energy : Nat) : async Animal {
        let animal : Animal = {
            species = species;
            energy = energy;
        };
        return Animal.sleep(animal);
    };
}