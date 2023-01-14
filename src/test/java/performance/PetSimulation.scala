package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

import scala.concurrent.duration.DurationInt

class PetSimulation extends Simulation {

  val protocol = karateProtocol(
    "/v2/user/{username}" -> Nil
  )

  protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

  val createUser = scenario("Pet Scenarios")
    .exec(karateFeature("classpath:petstore/features/pet_example.feature"))

  setUp(
    createUser.inject(
      atOnceUsers(10),
      nothingFor(4 seconds),
      constantUsersPerSec(1) during (3 seconds)
    ).protocols(protocol)
  )
}