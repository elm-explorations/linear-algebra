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

import Native.MJS


{-| Three dimensional vector type
-}
type Vec3
    = Vec3


{-| Creates a new 3-element vector with the given values.
-}
vec3 : Float -> Float -> Float -> Vec3
vec3 =
    Native.MJS.vec3


{-| The unit vector &icirc; which points in the x direction: `vec3 1 0 0`
-}
i : Vec3
i =
    Native.MJS.vec3 1 0 0


{-| The unit vector &jcirc; which points in the y direction: `vec3 0 1 0`
-}
j : Vec3
j =
    Native.MJS.vec3 0 1 0


{-| The unit vector k&#0770; which points in the z direction: `vec3 0 0 1`
-}
k : Vec3
k =
    Native.MJS.vec3 0 0 1


{-| Extract the x component of a vector.
-}
getX : Vec3 -> Float
getX =
    Native.MJS.v3getX


{-| Extract the y component of a vector.
-}
getY : Vec3 -> Float
getY =
    Native.MJS.v3getY


{-| Extract the z component of a vector.
-}
getZ : Vec3 -> Float
getZ =
    Native.MJS.v3getZ


{-| Update the x component of a vector, returning a new vector.
-}
setX : Float -> Vec3 -> Vec3
setX =
    Native.MJS.v3setX


{-| Update the y component of a vector, returning a new vector.
-}
setY : Float -> Vec3 -> Vec3
setY =
    Native.MJS.v3setY


{-| Update the z component of a vector, returning a new vector.
-}
setZ : Float -> Vec3 -> Vec3
setZ =
    Native.MJS.v3setZ


{-| Convert a vector to a tuple.
-}
toTuple : Vec3 -> ( Float, Float, Float )
toTuple =
    Native.MJS.toTuple3


{-| Convert a vector to a record.
-}
toRecord : Vec3 -> { x : Float, y : Float, z : Float }
toRecord =
    Native.MJS.toRecord3


{-| Convert a tuple to a vector.
-}
fromTuple : ( Float, Float, Float ) -> Vec3
fromTuple =
    Native.MJS.fromTuple3


{-| Convert a record to a vector.
-}
fromRecord : { x : Float, y : Float, z : Float } -> Vec3
fromRecord =
    Native.MJS.fromRecord3


{-| Vector addition: a + b
-}
add : Vec3 -> Vec3 -> Vec3
add =
    Native.MJS.v3add


{-| Vector subtraction: a - b
-}
sub : Vec3 -> Vec3 -> Vec3
sub =
    Native.MJS.v3sub


{-| Vector negation: -a
-}
negate : Vec3 -> Vec3
negate =
    Native.MJS.v3neg


{-| The normalized direction from b to a: (a - b) / |a - b|
-}
direction : Vec3 -> Vec3 -> Vec3
direction =
    Native.MJS.v3direction


{-| The length of the given vector: |a|
-}
length : Vec3 -> Float
length =
    Native.MJS.v3length


{-| The square of the length of the given vector: |a| * |a|
-}
lengthSquared : Vec3 -> Float
lengthSquared =
    Native.MJS.v3lengthSquared


{-| The distance between two vectors.
-}
distance : Vec3 -> Vec3 -> Float
distance =
    Native.MJS.v3distance


{-| The square of the distance between two vectors.
-}
distanceSquared : Vec3 -> Vec3 -> Float
distanceSquared =
    Native.MJS.v3distanceSquared


{-| A unit vector with the same direction as the given vector: a / |a|
-}
normalize : Vec3 -> Vec3
normalize =
    Native.MJS.v3normalize


{-| Multiply the vector by a scalar: s * v
-}
scale : Float -> Vec3 -> Vec3
scale =
    Native.MJS.v3scale


{-| The dot product of a and b
-}
dot : Vec3 -> Vec3 -> Float
dot =
    Native.MJS.v3dot


{-| The cross product of a and b
-}
cross : Vec3 -> Vec3 -> Vec3
cross =
    Native.MJS.v3cross
