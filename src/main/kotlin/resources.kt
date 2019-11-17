//TODO - turn this into a data class
class Hand(var map: Int = 0, var crew: Int = 2, var landlubber: Int = 2, var food: Int = 2, var doubloon: Int = 2,
           var infamy: Int = 0
) {
    override fun toString(): String = "Maps: $map\tCrew: $crew\tLandlubbers: $landlubber\tFood: $food\tDoubloons: $doubloon\tInfamy: $infamy"
}