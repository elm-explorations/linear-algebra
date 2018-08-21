module Math.Vector4
    exposing
        ( Vec4
        , add
        , direction
        , distance
        , distanceSquared
        , dot
        , fromRecord
        , getW
        , getX
        , getY
        , getZ
        , length
        , lengthSquared
        , negate
        , normalize
        , scale
        , setW
        , setX
        , setY
        , setZ
        , sub
        , toRecord
        , vec4
        )

{-| A high performance linear algebra library using native JS arrays. Geared
towards 3D graphics and use with `Graphics.WebGL`. All vectors are immutable.


# Create

@docs Vec4, vec4


# Get and Set

The set functions create a new copy of the vector, updating a single field.

@docs getX, getY, getZ, getW, setX, setY, setZ, setW


# Operations

@docs add, sub, negate, scale, dot, normalize, direction
@docs length, lengthSquared, distance, distanceSquared


# Conversions

@docs toRecord, fromRecord

-}

import Elm.Kernel.MJS


{-| Four dimensional vector type
-}
type Vec4
    = Vec4


{-| Creates a new 4-element vector with the given x, y, z, and w values.
-}
vec4 : Float -> Float -> Float -> Float -> Vec4
vec4 =
    Elm.Kernel.MJS.v4


{-| Extract the x component of a vector.
-}
getX : Vec4 -> Float
getX =
    Elm.Kernel.MJS.v4getX


{-| Extract the y component of a vector.
-}
getY : Vec4 -> Float
getY =
    Elm.Kernel.MJS.v4getY


{-| Extract the z component of a vector.
-}
getZ : Vec4 -> Float
getZ =
    Elm.Kernel.MJS.v4getZ


{-| Extract the w component of a vector.
-}
getW : Vec4 -> Float
getW =
    Elm.Kernel.MJS.v4getW


{-| Update the x component of a vector, returning a new vector.
-}
setX : Float -> Vec4 -> Vec4
setX =
    Elm.Kernel.MJS.v4setX


{-| Update the y component of a vector, returning a new vector.
-}
setY : Float -> Vec4 -> Vec4
setY =
    Elm.Kernel.MJS.v4setY


{-| Update the z component of a vector, returning a new vector.
-}
setZ : Float -> Vec4 -> Vec4
setZ =
    Elm.Kernel.MJS.v4setZ


{-| Update the w component of a vector, returning a new vector.
-}
setW : Float -> Vec4 -> Vec4
setW =
    Elm.Kernel.MJS.v4setW


{-| Convert a vector to a record.
-}
toRecord : Vec4 -> { x : Float, y : Float, z : Float, w : Float }
toRecord =
    Elm.Kernel.MJS.v4toRecord


{-| Convert a record to a vector.
-}
fromRecord : { x : Float, y : Float, z : Float, w : Float } -> Vec4
fromRecord =
    Elm.Kernel.MJS.v4fromRecord


{-| Vector addition: a + b
-}
add : Vec4 -> Vec4 -> Vec4
add =
    Elm.Kernel.MJS.v4add


{-| Vector subtraction: a - b
-}
sub : Vec4 -> Vec4 -> Vec4
sub =
    Elm.Kernel.MJS.v4sub


{-| Vector negation: -a
-}
negate : Vec4 -> Vec4
negate =
    Elm.Kernel.MJS.v4negate


{-| The normalized direction from b to a: (a - b) / |a - b|
-}
direction : Vec4 -> Vec4 -> Vec4
direction =
    Elm.Kernel.MJS.v4direction


{-| The length of the given vector: |a|
-}
length : Vec4 -> Float
length =
    Elm.Kernel.MJS.v4length


{-| The square of the length of the given vector: |a| * |a|
-}
lengthSquared : Vec4 -> Float
lengthSquared =
    Elm.Kernel.MJS.v4lengthSquared


{-| The distance between two vectors.
-}
distance : Vec4 -> Vec4 -> Float
distance =
    Elm.Kernel.MJS.v4distance


{-| The square of the distance between two vectors.
-}
distanceSquared : Vec4 -> Vec4 -> Float
distanceSquared =
    Elm.Kernel.MJS.v4distanceSquared


{-| A unit vector with the same direction as the given vector: a / |a|
-}
normalize : Vec4 -> Vec4
normalize =
    Elm.Kernel.MJS.v4normalize


{-| Multiply the vector by a scalar: s * v
-}
scale : Float -> Vec4 -> Vec4
scale =
    Elm.Kernel.MJS.v4scale


{-| The dot product of a and b
-}
dot : Vec4 -> Vec4 -> Float
dot =
    Elm.Kernel.MJS.v4dot
