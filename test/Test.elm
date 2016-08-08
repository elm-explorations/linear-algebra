module Test exposing (main)

import ElmTest exposing (Test, Assertion, assert, assertEqual, test, suite, runSuiteHtml)
import Math.Vector2 as V2


main : Program Never
main =
    runSuiteHtml <|
        suite "all"
            [ test "vec2" <|
                assertEqual
                    (V2.vec2 3 4)
                    (V2.vec2 3 4)
            , test "setX" <|
                assertEqual
                    (V2.vec2 5 4)
                    (V2.vec2 3 4 |> V2.setX 5)
            , test "setY" <|
                assertEqual
                    (V2.vec2 3 6)
                    (V2.vec2 3 4 |> V2.setY 6)
            ]
