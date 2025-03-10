/*
 * Copyright (c) 2007 INRIA
 *
 * SPDX-License-Identifier: GPL-2.0-only
 *
 * Author: Mathieu Lacage <mathieu.lacage@sophia.inria.fr>
 */
#ifndef NS3_VECTOR_H
#define NS3_VECTOR_H

#include "attribute-helper.h"
#include "attribute.h"

/**
 * @file
 * @ingroup geometry
 * ns3::Vector, ns3::Vector2D and ns3::Vector3D declarations.
 */

namespace ns3
{

/**
 * @ingroup core
 * @defgroup geometry Geometry primitives
 * @brief Primitives for geometry, such as vectors and angles.
 */

/**
 * @ingroup geometry
 * @brief a 3d vector
 * @see attribute_Vector3D
 */
class Vector3D
{
  public:
    /**
     * @param [in] _x X coordinate of vector
     * @param [in] _y Y coordinate of vector
     * @param [in] _z Z coordinate of vector
     *
     * Create vector (_x, _y, _z)
     */
    Vector3D(double _x, double _y, double _z);
    /** Create vector (0.0, 0.0, 0.0) */
    Vector3D();

    double x; //!< x coordinate of vector
    double y; //!< y coordinate of vector
    double z; //!< z coordinate of vector

    /**
     * Compute the length (magnitude) of the vector.
     * @returns the vector length.
     */
    double GetLength() const;

    /**
     * Compute the squared length of the vector.
     * @returns the vector length squared.
     */
    double GetLengthSquared() const;

    /**
     * @brief Calculate the Cartesian distance between two points.
     * @param [in] a One point
     * @param [in] b Another point
     * @returns The distance between \pname{a} and \pname{b}.
     */
    friend double CalculateDistance(const Vector3D& a, const Vector3D& b);

    /**
     * @brief Calculate the squared Cartesian distance between two points.
     * @param [in] a One point
     * @param [in] b Another point
     * @returns The distance between \pname{a} and \pname{b}.
     */
    friend double CalculateDistanceSquared(const Vector3D& a, const Vector3D& b);

    /**
     * Output streamer.
     * Vectors are written as "x:y:z".
     *
     * @param [in,out] os The stream.
     * @param [in] vector The vector to stream
     * @return The stream.
     */
    friend std::ostream& operator<<(std::ostream& os, const Vector3D& vector);

    /**
     * Input streamer.
     *
     * Vectors are expected to be in the form "x:y:z".
     *
     * @param [in,out] is The stream.
     * @param [in] vector The vector.
     * @returns The stream.
     */
    friend std::istream& operator>>(std::istream& is, Vector3D& vector);

    /**
     * Less than comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is less than \pname{b}
     */
    friend bool operator<(const Vector3D& a, const Vector3D& b);

    /**
     * Less than or equal to comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is less than or equal to \pname{b}.
     */
    friend bool operator<=(const Vector3D& a, const Vector3D& b);

    /**
     * Greater than comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is greater than \pname{b}.
     */
    friend bool operator>(const Vector3D& a, const Vector3D& b);

    /**
     * Greater than or equal to comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is greater than or equal to \pname{b}.
     */
    friend bool operator>=(const Vector3D& a, const Vector3D& b);

    /**
     * Equality operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns \c true if \pname{a} is equal to \pname{b}.
     */
    friend bool operator==(const Vector3D& a, const Vector3D& b);

    /**
     * Inequality operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns \c true if \pname{a} is not equal to \pname{b}.
     */
    friend bool operator!=(const Vector3D& a, const Vector3D& b);

    /**
     * Addition operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns The vector sum of \pname{a} and \pname{b}.
     */
    friend Vector3D operator+(const Vector3D& a, const Vector3D& b);

    /**
     * Subtraction operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns The vector difference of \pname{a} and \pname{b}.
     */
    friend Vector3D operator-(const Vector3D& a, const Vector3D& b);

    /**
     * Scalar multiplication operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs scalar.
     * @returns The vector \pname{a} scaled by \pname{b}.
     */
    friend Vector3D operator*(const Vector3D& a, double b);

    /**
     * Scalar multiplication operator.
     * @param [in] a lhs scalar.
     * @param [in] b rhs vector.
     * @returns The vector \pname{b} scaled by \pname{a}.
     */
    friend Vector3D operator*(double a, const Vector3D& b);

    /**
     * Dot product operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns The dot product of \pname{a} and \pname{b}.
     */
    friend double operator*(const Vector3D& a, const Vector3D& b);
};

/**
 * @ingroup geometry
 * @brief a 2d vector
 * @see attribute_Vector2D
 */
class Vector2D
{
  public:
    /**
     * @param [in] _x X coordinate of vector
     * @param [in] _y Y coordinate of vector
     *
     * Create vector (_x, _y)
     */
    Vector2D(double _x, double _y);
    /** Constructor: (0.0, 0.0) */
    Vector2D();
    double x; //!< x coordinate of vector
    double y; //!< y coordinate of vector

    // works:  /** \copydoc ns3::Vector3D::GetLength() */
    /** @copydoc Vector3D::GetLength() */
    double GetLength() const;

    /** @copydoc Vector3D::GetLengthSquared() */
    double GetLengthSquared() const;

    /**
     * @brief Calculate the Cartesian distance between two points.
     * @param [in] a One point
     * @param [in] b Another point
     * @returns The distance between \pname{a} and \pname{b}.
     */
    friend double CalculateDistance(const Vector2D& a, const Vector2D& b);

    /**
     * @brief Calculate the squared Cartesian distance between two points.
     * @param [in] a One point
     * @param [in] b Another point
     * @returns The distance between \pname{a} and \pname{b}.
     */
    friend double CalculateDistanceSquared(const Vector2D& a, const Vector2D& b);

    /**
     * Output streamer.
     * Vectors are written as "x:y".
     *
     * @param [in,out] os The stream.
     * @param [in] vector The vector to stream
     * @return The stream.
     */
    friend std::ostream& operator<<(std::ostream& os, const Vector2D& vector);

    /**
     * Input streamer.
     *
     * Vectors are expected to be in the form "x:y".
     *
     * @param [in,out] is The stream.
     * @param [in] vector The vector.
     * @returns The stream.
     */
    friend std::istream& operator>>(std::istream& is, Vector2D& vector);

    /**
     * Less than comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is less than \pname{b}
     */
    friend bool operator<(const Vector2D& a, const Vector2D& b);

    /**
     * Less than or equal to comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is less than or equal to \pname{b}.
     */
    friend bool operator<=(const Vector2D& a, const Vector2D& b);

    /**
     * Greater than comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is greater than \pname{b}.
     */
    friend bool operator>(const Vector2D& a, const Vector2D& b);

    /**
     * Greater than or equal to comparison operator
     * @param [in] a lhs vector
     * @param [in] b rhs vector
     * @returns \c true if \pname{a} is greater than or equal to \pname{b}.
     */
    friend bool operator>=(const Vector2D& a, const Vector2D& b);

    /**
     * Equality operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns \c true if \pname{a} is equal to \pname{b}.
     */
    friend bool operator==(const Vector2D& a, const Vector2D& b);

    /**
     * Inequality operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns \c true if \pname{a} is not equal to \pname{b}.
     */
    friend bool operator!=(const Vector2D& a, const Vector2D& b);

    /**
     * Addition operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns The vector sum of \pname{a} and \pname{b}.
     */
    friend Vector2D operator+(const Vector2D& a, const Vector2D& b);

    /**
     * Subtraction operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns The vector difference of \pname{a} and \pname{b}.
     */
    friend Vector2D operator-(const Vector2D& a, const Vector2D& b);

    /**
     * Scalar multiplication operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs scalar.
     * @returns The vector \pname{a} scaled by \pname{b}.
     */
    friend Vector2D operator*(const Vector2D& a, double b);

    /**
     * Scalar multiplication operator.
     * @param [in] a lhs scalar.
     * @param [in] b rhs vector.
     * @returns The vector \pname{b} scaled by \pname{a}.
     */
    friend Vector2D operator*(double a, const Vector2D& b);

    /**
     * Dot product operator.
     * @param [in] a lhs vector.
     * @param [in] b rhs vector.
     * @returns The dot product of \pname{a} and \pname{b}.
     */
    friend double operator*(const Vector2D& a, const Vector2D& b);
};

double CalculateDistance(const Vector3D& a, const Vector3D& b);
double CalculateDistance(const Vector2D& a, const Vector2D& b);
double CalculateDistanceSquared(const Vector3D& a, const Vector3D& b);
double CalculateDistanceSquared(const Vector2D& a, const Vector2D& b);
std::ostream& operator<<(std::ostream& os, const Vector3D& vector);
std::ostream& operator<<(std::ostream& os, const Vector2D& vector);
std::istream& operator>>(std::istream& is, Vector3D& vector);
std::istream& operator>>(std::istream& is, Vector2D& vector);
bool operator<(const Vector3D& a, const Vector3D& b);
bool operator<(const Vector2D& a, const Vector2D& b);

ATTRIBUTE_HELPER_HEADER(Vector3D);
ATTRIBUTE_HELPER_HEADER(Vector2D);

/**
 * @ingroup attribute_Vector3D
 * @relates Vector3D
 * Vector alias typedef for compatibility with mobility models
 */
typedef Vector3D Vector;

/**
 * @ingroup attribute_Vector3D
 * @relates Vector3D
 * Vector alias typedef for compatibility with mobility models
 */
typedef Vector3DValue VectorValue;

/**
 * @ingroup attribute_Vector3D
 * @relates Vector3D
 * Vector alias typedef for compatibility with mobility models
 */
typedef Vector3DChecker VectorChecker;

ATTRIBUTE_ACCESSOR_DEFINE(Vector);

Ptr<const AttributeChecker> MakeVectorChecker();

} // namespace ns3

// Document these by hand so they go in group attribute_Vector3D

/**
 * @ingroup attribute_Vector3D
 * \fn ns3::Ptr<const ns3::AttributeAccessor> ns3::MakeVectorAccessor (T1 a1)
 * @copydoc ns3::MakeAccessorHelper(T1)
 * @see AttributeAccessor
 */

/**
 * @ingroup attribute_Vector3D
 * \fn ns3::Ptr<const ns3::AttributeAccessor> ns3::MakeVectorAccessor (T1 a1, T2 a2)
 * @copydoc ns3::MakeAccessorHelper(T1,T2)
 * @see AttributeAccessor
 */

/**
 * @ingroup attribute_Vector3D
 * \fn ns3::Ptr<const ns3::AttributeChecker> ns3::MakeVectorChecker ()
 * @returns The AttributeChecker.
 * @see AttributeChecker
 */

#endif /* NS3_VECTOR_H */
