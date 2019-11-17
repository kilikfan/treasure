import io.kotlintest.specs.StringSpec
import io.kotlintest.shouldBe

class HandTest : StringSpec() {

    init {
        "the toString method output the hand details in a human readable way" {
            val testHand = Hand(1,2,3,4,5,6)
            testHand.toString() shouldBe "Maps: 1\tCrew: 2\tLandlubbers: 3\tFood: 4\tDoubloons: 5\tInfamy: 6"
        }
    }

}