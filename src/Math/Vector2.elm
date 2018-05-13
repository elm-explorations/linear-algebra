module Math.Vector2
    exposing
        ( Vec2
        , add
        , direction
        , distance
        , distanceSquared
        , dot
        , fromRecord
        , getX
        , getY
        , length
        , lengthSquared
        , negate
        , normalize
        , scale
        , setX
        , setY
        , sub
        , toRecord
        , vec2
        )

{-| A high performance linear algebra library using native JS arrays. Geared
towards 3D graphics and use with `Graphics.WebGL`. All vectors are immutable.


# Create

@docs Vec2, vec2


# Get and Set

The set functions create a new copy of the vector, updating a single field.

@docs getX, getY, setX, setY


# Operations

@docs add, sub, negate, scale, dot, normalize, direction
@docs length, lengthSquared, distance, distanceSquared


# Conversions

@docs toRecord, fromRecord

-}

import Elm.Kernel.Math.Vector2


{-| Two dimensional vector type
-}
type Vec2
    = Vec2


{-| Creates a new 2-element vector with the given values.
-}
vec2 : Float -> Float -> Vec2
vec2 =
    Elm.Kernel.MJS.v2


{-| Extract the x component of a vector.
-}
getX : Vec2 -> Float
getX =
    Elm.Kernel.MJS.v2getX


{-| Extract the y component of a vector.
-}
getY : Vec2 -> Float
getY =
    Elm.Kernel.MJS.v2getY


{-| Update the x component of a vector, returning a new vector.
-}
setX : Float -> Vec2 -> Vec2
setX =
    Elm.Kernel.MJS.v2setX


{-| Update the y component of a vector, returning a new vector.
-}
setY : Float -> Vec2 -> Vec2
setY =
    Elm.Kernel.MJS.v2setY


{-| Convert a vector to a record.
-}
toRecord : Vec2 -> { x : Float, y : Float }
toRecord =
    Elm.Kernel.MJS.v2toRecord


{-| Convert a record to a vector.
-}
fromRecord : { x : Float, y : Float } -> Vec2
fromRecord =
    Elm.Kernel.MJS.v2fromRecord


{-| Vector addition: a + b
-}
add : Vec2 -> Vec2 -> Vec2
add =
    Elm.Kernel.MJS.v2add


{-| Vector subtraction: a - b
-}
sub : Vec2 -> Vec2 -> Vec2
sub =
    Elm.Kernel.MJS.v2sub


{-| Vector negation: -a
-}
negate : Vec2 -> Vec2
negate =
    Elm.Kernel.MJS.v2negate


{-| The normalized direction from b to a: (a - b) / |a - b|
-}
direction : Vec2 -> Vec2 -> Vec2
direction =
    Elm.Kernel.MJS.v2direction


{-| The length of the given vector: |a|
-}
length : Vec2 -> Float
length =
    Elm.Kernel.MJS.v2length


{-| The square of the length of the given vector: |a| * |a|
-}
lengthSquared : Vec2 -> Float
lengthSquared =
    Elm.Kernel.MJS.v2lengthSquared


{-| The distance between two vectors.
-}
distance : Vec2 -> Vec2 -> Float
distance =
    Elm.Kernel.MJS.v2distance


{-| The square of the distance between two vectors.
-}
distanceSquared : Vec2 -> Vec2 -> Float
distanceSquared =
    Elm.Kernel.MJS.v2distanceSquared


{-| A unit vector with the same direction as the given vector: a / |a|
-}
normalize : Vec2 -> Vec2
normalize =
    Elm.Kernel.MJS.v2normalize


{-| Multiply the vector by a scalar: s * v
-}
scale : Float -> Vec2 -> Vec2
scale =
    Elm.Kernel.MJS.v2scale


{-| The dot product of a and b
-}
dot : Vec2 -> Vec2 -> Float
dot =
    Elm.Kernel.MJS.v2dot
