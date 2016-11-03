module Tests exposing (suite)

import Test exposing (Test, describe, test)
import Expect
import Math.Vector2 as V2


suite : Test
suite =
    describe "Vector2 module"
        [ test "vec2" <|
            \() ->
                Expect.equal
                    (V2.vec2 3 4)
                    (V2.vec2 3 4)
        , test "setX" <|
            \() ->
                Expect.equal
                    (V2.vec2 5 4)
                    (V2.vec2 3 4 |> V2.setX 5)
        , test "setY" <|
            \() ->
                Expect.equal
                    (V2.vec2 3 6)
                    (V2.vec2 3 4 |> V2.setY 6)
        ]
