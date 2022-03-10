module {
    public type Animal = {
        species : Text;
        energy : Nat;
    };

    public func sleep (animal : Animal) : Animal {
        let animal2 : Animal = {
            species = animal.species;
            energy = animal.energy + 10;
        };
        return animal2;
    };
}