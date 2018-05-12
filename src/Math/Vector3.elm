module Math.Vector3
    exposing
        ( Vec3
        , add
        , cross
        , direction
        , distance
        , distanceSquared
        , dot
        , fromRecord
        , fromTuple
        , getX
        , getY
        , getZ
        , i
        , j
        , k
        , length
        , lengthSquared
        , negate
        , normalize
        , scale
        , setX
        , setY
        , setZ
        , sub
        , toRecord
        , toTuple
        , vec3
        )

{-| A high performance linear algebra library using native JS arrays. Geared
towards 3D graphics and use with `Graphics.WebGL`. All vectors are immutable.


# Create

@docs Vec3, vec3, i, j, k


# Get and Set

The set functions create a new copy of the vector, updating a single field.

@docs getX, getY, getZ, setX, setY, setZ


# Operations

@docs add, sub, negate, scale, dot, cross, normalize, direction
@docs length, lengthSquared, distance, distanceSquared


# Conversions

@docs toTuple, fromTuple, toRecord, fromRecord

-}

import Elm.Kernel.MJS


{-| Three dimensional vector type
-}
type Vec3
    = Vec3


{-| Creates a new 3-element vector with the given values.
-}
vec3 : Float -> Float -> Float -> Vec3
vec3 =
    Elm.Kernel.MJS.v3


{-| The unit vector &icirc; which points in the x direction: `vec3 1 0 0`
-}
i : Vec3
i =
    Elm.Kernel.MJS.v3 1 0 0


{-| The unit vector &jcirc; which points in the y direction: `vec3 0 1 0`
-}
j : Vec3
j =
    Elm.Kernel.MJS.v3 0 1 0


{-| The unit vector k&#0770; which points in the z direction: `vec3 0 0 1`
-}
k : Vec3
k =
    Elm.Kernel.MJS.v3 0 0 1


{-| Extract the x component of a vector.
-}
getX : Vec3 -> Float
getX =
    Elm.Kernel.MJS.v3getX


{-| Extract the y component of a vector.
-}
getY : Vec3 -> Float
getY =
    Elm.Kernel.MJS.v3getY


{-| Extract the z component of a vector.
-}
getZ : Vec3 -> Float
getZ =
    Elm.Kernel.MJS.v3getZ


{-| Update the x component of a vector, returning a new vector.
-}
setX : Float -> Vec3 -> Vec3
setX =
    Elm.Kernel.MJS.v3setX


{-| Update the y component of a vector, returning a new vector.
-}
setY : Float -> Vec3 -> Vec3
setY =
    Elm.Kernel.MJS.v3setY


{-| Update the z component of a vector, returning a new vector.
-}
setZ : Float -> Vec3 -> Vec3
setZ =
    Elm.Kernel.MJS.v3setZ


{-| Convert a vector to a tuple.
-}
toTuple : Vec3 -> ( Float, Float, Float )
toTuple =
    Elm.Kernel.MJS.v3toTuple


{-| Convert a vector to a record.
-}
toRecord : Vec3 -> { x : Float, y : Float, z : Float }
toRecord =
    Elm.Kernel.MJS.v3toRecord


{-| Convert a tuple to a vector.
-}
fromTuple : ( Float, Float, Float ) -> Vec3
fromTuple =
    Elm.Kernel.MJS.v3fromTuple


{-| Convert a record to a vector.
-}
fromRecord : { x : Float, y : Float, z : Float } -> Vec3
fromRecord =
    Elm.Kernel.MJS.v3fromRecord


{-| Vector addition: a + b
-}
add : Vec3 -> Vec3 -> Vec3
add =
    Elm.Kernel.MJS.v3add


{-| Vector subtraction: a - b
-}
sub : Vec3 -> Vec3 -> Vec3
sub =
    Elm.Kernel.MJS.v3sub


{-| Vector negation: -a
-}
negate : Vec3 -> Vec3
negate =
    Elm.Kernel.MJS.v3negate


{-| The normalized direction from b to a: (a - b) / |a - b|
-}
direction : Vec3 -> Vec3 -> Vec3
direction =
    Elm.Kernel.MJS.v3direction


{-| The length of the given vector: |a|
-}
length : Vec3 -> Float
length =
    Elm.Kernel.MJS.v3length


{-| The square of the length of the given vector: |a| * |a|
-}
lengthSquared : Vec3 -> Float
lengthSquared =
    Elm.Kernel.MJS.v3lengthSquared


{-| The distance between two vectors.
-}
distance : Vec3 -> Vec3 -> Float
distance =
    Elm.Kernel.MJS.v3distance


{-| The square of the distance between two vectors.
-}
distanceSquared : Vec3 -> Vec3 -> Float
distanceSquared =
    Elm.Kernel.MJS.v3distanceSquared


{-| A unit vector with the same direction as the given vector: a / |a|
-}
normalize : Vec3 -> Vec3
normalize =
    Elm.Kernel.MJS.v3normalize


{-| Multiply the vector by a scalar: s * v
-}
scale : Float -> Vec3 -> Vec3
scale =
    Elm.Kernel.MJS.v3scale


{-| The dot product of a and b
-}
dot : Vec3 -> Vec3 -> Float
dot =
    Elm.Kernel.MJS.v3dot


{-| The cross product of a and b
-}
cross : Vec3 -> Vec3 -> Vec3
cross =
    Elm.Kernel.MJS.v3cross
