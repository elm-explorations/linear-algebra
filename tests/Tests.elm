module Tests exposing (suite)

import Test exposing (Test, describe, test, fuzz, fuzz3)
import Fuzz
import Expect
import Math.Vector2 as V2
import Math.Vector3 as V3
import Math.Matrix4 as M4


suite : Test
suite =
    describe "elm-linear-algebra"
        [ describe "Vector2 module"
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
        , describe "Matrix4 module"
            [ describe "inverse"
                [ test "Identity is its own inverse" <|
                    \_ ->
                        M4.inverse M4.identity |> Expect.equal (Just M4.identity)
                , test "Scaling in 3D inverts to shrinking" <|
                    \_ ->
                        M4.makeScale3 2 3 (1 / 8)
                            |> M4.inverse
                            |> Expect.equal (Just (M4.makeScale3 0.5 (1 / 3) 8))
                , fuzz3 Fuzz.float Fuzz.float Fuzz.float "Translating in 3D inverts to translating the other way" <|
                    \x y z ->
                        M4.makeTranslate3 x y z
                            |> M4.inverse
                            |> Expect.equal (Just (M4.makeTranslate3 -x -y -z))
                , Test.concat <|
                    -- using constants instead of fuzz because of floating point errors
                    (flip List.map) [ pi, 1.5 * pi, pi / 12, pi / 50 ]
                        (\theta ->
                            test ("Rotation by " ++ toString theta) <|
                                \_ ->
                                    let
                                        m =
                                            M4.makeRotate theta V3.i
                                    in
                                        m
                                            |> M4.inverse
                                            |> Maybe.map (M4.mul m)
                                            |> Expect.equal (Just M4.identity)
                        )
                , test "cannot invert a singular matrix" <|
                    \_ ->
                        M4.makeBasis V3.i V3.j (V3.fromTuple ( 0, 0, 0 ))
                            |> M4.inverse
                            |> Expect.equal Nothing
                , test "inverts a known matrix" <|
                    \_ ->
                        M4.makeBasis
                            (V3.fromTuple ( 2, 9, -3 ))
                            (V3.fromTuple ( -4, 3, 14 ))
                            (V3.fromTuple ( 1, 12, 6 ))
                            |> M4.inverse
                            |> Expect.equal
                                (M4.makeBasis
                                    (V3.fromTuple ( -150, -90, 135 ))
                                    (V3.fromTuple ( 38, 15, -16 ))
                                    (V3.fromTuple ( -51, -15, 42 ))
                                    |> M4.scale3 (1 / 195) (1 / 195) (1 / 195)
                                    |> Just
                                )
                ]
            ]
        ]
