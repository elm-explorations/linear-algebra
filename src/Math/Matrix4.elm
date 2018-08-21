module Math.Matrix4
    exposing
        ( Mat4
        , fromRecord
        , identity
        , inverse
        , inverseOrthonormal
        , makeBasis
        , makeFrustum
        , makeLookAt
        , makeOrtho
        , makeOrtho2D
        , makePerspective
        , makeRotate
        , makeScale
        , makeScale3
        , makeTranslate
        , makeTranslate3
        , mul
        , mulAffine
        , rotate
        , scale
        , scale3
        , toRecord
        , transform
        , translate
        , translate3
        , transpose
        )

{-| A high performance linear algebra library using native JS arrays. Geared
towards 3D graphics and use with `Graphics.WebGL`. All matrices are immutable.

This library uses the convention that the prefix `make` is creating a new
array,as without the prefix, you are applying some transform to an
existing matrix.


# Create

@docs Mat4, identity


# Operations

@docs inverse, inverseOrthonormal, mul, mulAffine, transpose, makeBasis, transform


# Projections

@docs makeFrustum, makePerspective, makeOrtho, makeOrtho2D, makeLookAt


# Apply Transformations

@docs rotate, scale, scale3, translate, translate3


# Create Transformations

@docs makeRotate, makeScale, makeScale3, makeTranslate, makeTranslate3


# Conversions

@docs toRecord, fromRecord

-}

import Elm.Kernel.MJS
import Math.Vector3 exposing (Vec3)


{-| 4x4 matrix type
-}
type Mat4
    = Mat4


{-| Multiply a vector by a 4x4 matrix: m * v
-}
transform : Mat4 -> Vec3 -> Vec3
transform =
    Elm.Kernel.MJS.v3mul4x4


{-| A matrix with all 0s, except 1s on the diagonal.
-}
identity : Mat4
identity =
    Elm.Kernel.MJS.m4x4identity


{-| Computes the inverse of any matrix. This is somewhat computationally
intensive. If the matrix is not invertible, `Nothing` is returned.
-}
inverse : Mat4 -> Maybe Mat4
inverse =
    Elm.Kernel.MJS.m4x4inverse


{-| Computes the inverse of the given matrix, assuming that the matrix is
orthonormal. This algorithm is more efficient than general matrix inversion, and
has no possibility of failing.
-}
inverseOrthonormal : Mat4 -> Mat4
inverseOrthonormal =
    Elm.Kernel.MJS.m4x4inverseOrthonormal


{-| Creates a matrix for a projection frustum with the given parameters.

Parameters:

  - left - the left coordinate of the frustum
  - right- the right coordinate of the frustum
  - bottom - the bottom coordinate of the frustum
  - top - the top coordinate of the frustum
  - znear - the near z distance of the frustum
  - zfar - the far z distance of the frustum

-}
makeFrustum : Float -> Float -> Float -> Float -> Float -> Float -> Mat4
makeFrustum =
    Elm.Kernel.MJS.m4x4makeFrustum


{-| Creates a matrix for a perspective projection with the given parameters.

Parameters:

  - fovy - field of view in the y axis, in degrees
  - aspect - aspect ratio
  - znear - the near z distance of the projection
  - zfar - the far z distance of the projection

-}
makePerspective : Float -> Float -> Float -> Float -> Mat4
makePerspective =
    Elm.Kernel.MJS.m4x4makePerspective


{-| Creates a matrix for an orthogonal frustum projection with the given parameters.

Parameters:

  - left - the left coordinate of the frustum
  - right- the right coordinate of the frustum
  - bottom - the bottom coordinate of the frustum
  - top - the top coordinate of the frustum
  - znear - the near z distance of the frustum
  - zfar - the far z distance of the frustum

-}
makeOrtho : Float -> Float -> Float -> Float -> Float -> Float -> Mat4
makeOrtho =
    Elm.Kernel.MJS.m4x4makeOrtho


{-| Creates a matrix for a 2D orthogonal frustum projection with the given
parameters. `znear` and `zfar` are assumed to be -1 and 1, respectively.

Parameters:

  - left - the left coordinate of the frustum
  - right- the right coordinate of the frustum
  - bottom - the bottom coordinate of the frustum
  - top - the top coordinate of the frustum

-}
makeOrtho2D : Float -> Float -> Float -> Float -> Mat4
makeOrtho2D =
    Elm.Kernel.MJS.m4x4makeOrtho2D


{-| Matrix multiplcation: a * b
-}
mul : Mat4 -> Mat4 -> Mat4
mul =
    Elm.Kernel.MJS.m4x4mul


{-| Matrix multiplication, assuming a and b are affine: a * b
-}
mulAffine : Mat4 -> Mat4 -> Mat4
mulAffine =
    Elm.Kernel.MJS.m4x4mulAffine


{-| Creates a transformation matrix for rotation in radians about the
3-element vector axis.
-}
makeRotate : Float -> Vec3 -> Mat4
makeRotate =
    Elm.Kernel.MJS.m4x4makeRotate


{-| Concatenates a rotation in radians about an axis to the given matrix.
-}
rotate : Float -> Vec3 -> Mat4 -> Mat4
rotate =
    Elm.Kernel.MJS.m4x4rotate


{-| Creates a transformation matrix for scaling by 3 scalar values, one for
each of the x, y, and z directions.
-}
makeScale3 : Float -> Float -> Float -> Mat4
makeScale3 =
    Elm.Kernel.MJS.m4x4makeScale3


{-| Creates a transformation matrix for scaling each of the x, y, and z axes by
the amount given in the corresponding element of the 3-element vector.
-}
makeScale : Vec3 -> Mat4
makeScale =
    Elm.Kernel.MJS.m4x4makeScale


{-| Concatenates a scaling to the given matrix.
-}
scale3 : Float -> Float -> Float -> Mat4 -> Mat4
scale3 =
    Elm.Kernel.MJS.m4x4scale3


{-| Concatenates a scaling to the given matrix.
-}
scale : Vec3 -> Mat4 -> Mat4
scale =
    Elm.Kernel.MJS.m4x4scale


{-| Creates a transformation matrix for translating by 3 scalar values, one for
each of the x, y, and z directions.
-}
makeTranslate3 : Float -> Float -> Float -> Mat4
makeTranslate3 =
    Elm.Kernel.MJS.m4x4makeTranslate3


{-| Creates a transformation matrix for translating each of the x, y, and z
axes by the amount given in the corresponding element of the 3-element vector.
-}
makeTranslate : Vec3 -> Mat4
makeTranslate =
    Elm.Kernel.MJS.m4x4makeTranslate


{-| Concatenates a translation to the given matrix.
-}
translate3 : Float -> Float -> Float -> Mat4 -> Mat4
translate3 =
    Elm.Kernel.MJS.m4x4translate3


{-| Concatenates a translation to the given matrix.
-}
translate : Vec3 -> Mat4 -> Mat4
translate =
    Elm.Kernel.MJS.m4x4translate


{-| Creates a transformation matrix for a camera.

Parameters:

  - eye - The location of the camera
  - center - The location of the focused object
  - up - The "up" direction according to the camera

-}
makeLookAt : Vec3 -> Vec3 -> Vec3 -> Mat4
makeLookAt =
    Elm.Kernel.MJS.m4x4makeLookAt


{-| "Flip" the matrix across the diagonal by swapping row index and column
index.
-}
transpose : Mat4 -> Mat4
transpose =
    Elm.Kernel.MJS.m4x4transpose


{-| Creates a transform from a basis consisting of 3 linearly independent vectors.
-}
makeBasis : Vec3 -> Vec3 -> Vec3 -> Mat4
makeBasis =
    Elm.Kernel.MJS.m4x4makeBasis


{-| Convert a matrix to a record. Elements are given by their row and column indices, starting at 1, so `m23` means the element in the second row, third column.
-}
toRecord : Mat4 -> { m11 : Float, m21 : Float, m31 : Float, m41 : Float, m12 : Float, m22 : Float, m32 : Float, m42 : Float, m13 : Float, m23 : Float, m33 : Float, m43 : Float, m14 : Float, m24 : Float, m34 : Float, m44 : Float }
toRecord =
    Elm.Kernel.MJS.m4x4toRecord


{-| Convert a record to a matrix.
-}
fromRecord : { m11 : Float, m21 : Float, m31 : Float, m41 : Float, m12 : Float, m22 : Float, m32 : Float, m42 : Float, m13 : Float, m23 : Float, m33 : Float, m43 : Float, m14 : Float, m24 : Float, m34 : Float, m44 : Float } -> Mat4
fromRecord =
    Elm.Kernel.MJS.m4x4fromRecord
