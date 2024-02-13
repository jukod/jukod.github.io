Introduction to Computational Geometry with Haskell
===================================================

2019-2023 Rudy Matela

(translated from my original lecture notes of 2019 in Portuguese)


Geometry
--------

One should be familiar with the following:

* point;
* line;
* line segment;
* open/closed segments;
* polygons;
* convex polygons;
* star polygons.


Haskell
-------

Haskell is a pure functional language
with static typing and non-strict (lazy) evaluation.

This intro uses Haskell
and is presented as a literate Haskell file.

Some (basic) features of Haskell were not used to protect the innocent!
(Notably parametric polymorphism, points are monomorphic here.)

> import Data.Function (on)
> import Data.List hiding (intersect)
> import Data.Tuple (swap)
> import System.Exit (exitFailure)
> import Test.LeanCheck
> import Test.LeanCheck.Utils

> minimumOn :: Ord b => (a -> b) -> [a] -> a
> minimumOn f  =  minimumBy (compare `on` f)

> maximumOn :: Ord b => (a -> b) -> [a] -> a
> maximumOn f  =  maximumBy (compare `on` f)

Here is an example
/O(n log n)/
sorting function implemented in Haskell.

> usort :: Ord a => [a] -> [a]
> usort []  =  []
> usort (x:xs)  =  usort [y | y <- xs, y < x]
>               ++ [x]
>               ++ usort [y | y <- xs, y > x]


Point
-----

Here is a point in the Cartesian plane:

> type N  =  Int
> type Point  =  (N, N)


Warming up: distance between points
-----------------------------------

* TODO: Kattis distance between points

> sqDistance :: Point -> Point -> N
> sqDistance (x0,y0) (x1,y1)  =  (x1-x0)^2 + (y1-y0)^2

> compareDistanceFrom :: Point -> Point -> Point -> Ordering
> compareDistanceFrom p0  =  compare `on` sqDistance p0

> minimumOnDistanceFrom :: Point -> [Point] -> Point
> minimumOnDistanceFrom  =  minimumBy . compareDistanceFrom

> maximumOnDistanceFrom :: Point -> [Point] -> Point
> maximumOnDistanceFrom  =  maximumBy . compareDistanceFrom

> sortOnDistanceFrom :: Point -> [Point] -> [Point]
> sortOnDistanceFrom p0  =  sortOn (sqDistance p0)


Warming up: point and rectangle
-------------------------------

Here is a rectangle whose sides are parallel to the axes:

> type Rectangle  =  (Point, N, N) -- origin, width and height

Given a point and such a rectangle,
can you define a function that checks whether
this point is inside this rectangle?

> onRectangle :: Point -> Rectangle -> Bool
> onRectangle (x,y) ((x0,y0),w,h)  =  x0 <= x && x <= x0 + w
>                                  && y0 <= y && y <= y0 + h


Question: how to check if a point is inside a triangle?
-------------------------------------------------------

Here is a triangle represented as a trio of arbitrary points in the plane:

> type Triangle  =  (Point, Point, Point)

Can you define a function that
returns whether a point is within such a triangle?

< onTriangle :: Point -> Triangle -> Bool
< onTriangle p (p0,p1,p2)  =  ???

It is not so easy anymore without the edges parallel to the axes...

Let's forget about this for now and think about something more basic.


Orientation of 3 points (takeaway)
-----------------------

* TODO: kattis problem with this

Can you implement a function that checks the orientation of three points?
That is,
if they are placed clockwise, counter-clockwise or in line?

Orientation can be determined by the determinant of the following matrix:

    | 1 x0 y0 |
    | 1 x1 y1 |
    | 1 x2 y2 |

If the determinant is positive, they are placed counter-clockwise.
If the determinant is negative, they are placed clockwise.
If the determinant is zero, they are in a line.

> orientation :: Point -> Point -> Point -> N
> orientation (x0,y0) (x1,y1) (x2,y2)  =  x0*y1 + x1*y2 + x2*y0
>                                      -  x0*y2 - x1*y0 - x2*y1

> orientation' :: Point -> Point -> Point -> N
> orientation' p0 p1 p2  =  signum (orientation p0 p1 p2)

This function is the __heart__ of computational geometry.


Is a point inside a triangle?
-----------------------------

Now, how to check if a point is inside a triangle?

> onTriangle :: Point -> Triangle -> Bool
> onTriangle p (p0,p1,p2)  =  all (<= 0) ls
>                          || all (>= 0) ls
>   where
>   segments  =  [(p0,p1),(p1,p2),(p2,p0)]
>   ls  =  [orientation q0 q1 p | (q0,q1) <- segments]


Inside a convex polygon
-----------------------

The above method generalizes to any convex polygon.

> type Polygon  =  [Point]

> onCPoly :: Point -> Polygon -> Bool
> onCPoly p ps  =  all (<= 0) ls
>               || all (>= 0) ls
>   where
>   segments  =  ps `zip` tail (cycle ps)
>   ls  =  [orientation q0 q1 p | (q0,q1) <- segments]


Crossing segments
-----------------

* Problem: [segmentdistance]

> type Segment  =  (Point, Point)

Can you implement a function that checks whether two segments cross?

> intersect :: Segment -> Segment -> Bool
> intersect (p0,p1) (q0,q1)  =
>   0 `between` (orientation p0 p1 q0, orientation p0 p1 q1) &&
>   0 `between` (orientation q0 q1 p0, orientation q0 q1 p1)
>   where
>   x `between` (y,z)  =  y <= x && x <= z
>                      || z <= x && x <= y

[segmentdistance]: https://open.kattis.com/problems/segmentdistance


Inside a simple polygon
-----------------------

* Problem: [pointinpolygon]

TODO: ???

[pointinpolygon]: https://open.kattis.com/problems/pointinpolygon


Clockwise ordering of points
----------------------------

Using the orientation check,
it is possible to order points (counter-)clockwise.

> compareCCWFrom :: Point -> Point -> Point -> Ordering
> compareCCWFrom p0 p1 p2  =  0 `compare` orientation p0 p1 p2

Note that the above function does not establish a true order relation
as it is not transitive when comparing with the origin or going around the origin.

However, it does establish an order relation in any set of points located
in an arc of less than 180 from the origin, excluding it.

> sortCCWFrom :: Point -> [Point] -> [Point]
> sortCCWFrom p0  =  sortBy
>                 $  compareCCWFrom p0 <> (compare `on` sqDistance p0)

Reminder: `toStar` depends on `sqDistance`.


Convex Hull
-----------

[convexhull]: https://open.kattis.com/problems/convexhull
[wrapping]: https://open.kattis.com/problems/wrapping

* Problems: [convexhull], [wrapping]

Can you now devise a convex hull algorithm?

/O(n^4)/

> veryNaiveConvexHull :: [Point] -> Polygon
> veryNaiveConvexHull ps'  =  sortCCWFrom (minimum ps)
>   [ p | triangles /= []
>       , p <- ps
>       , none (\t -> p `notElem` t && p `onCPoly` t) triangles
>       ]
>   where
>   ps  =  nub ps'
>   triangles = [ [p0,p1,p2] | p0 <- ps
>                            , p1 <- ps
>                            , p2 <- ps
>                            , orientation p0 p1 p2 /= 0
>                            ]
>   none p = not . any p


/O(n^2)/

> naiveConvexHull :: [Point] -> [Point]
> naiveConvexHull []   =  []
> naiveConvexHull ps'  =  o : from o
>   where
>   ps  =  nub ps'
>   o  =  minimum ps
>   from p  =  case minimumCCWFrom p ps of
>              q | q == o    -> []
>                | otherwise -> q : from q
>   minimumCCWFrom p  =  minimumBy
>                     $  compareCCWFrom p
>                     <> (flip compare `on` sqDistance p)

Can you devise an O(n log n) algorithm to discover the convex hull of a set of points?

/O(n log n)/

The following assumes that the first point (x,y) in the polygon
contains the least value of x then y.

> starConvexHull :: Polygon -> Polygon
> starConvexHull (p:q:r:ps)
>   | orientation' p q r > 0  =  p : starConvexHull (q:r:ps)
>   | otherwise               =  starConvexHull (p:r:ps)
> starConvexHull ps  =  ps

> toStar :: [Point] -> Polygon
> toStar []   =  []
> toStar ps'  =  o : sortCCWFrom o ps
>   where
>   (o:ps)  =  usort ps'

> convexHull :: [Point] -> Polygon
> convexHull  =  starConvexHull . toStar


Representing straight lines
---------------------------

One could think of the following naïve representation
for (geometric) straight lines:

    y = ax + c

or

    f(x) = ax + c

However,
it does not work for vertical lines,
so it makes it so that we have to deal with exceptions
when implementing algorithms involving lines.

Here is a better representation:

    ax + by + c = 0

In Haskell:

> type Line  =  (N,N,N)  -- a, b, c in ax + by + c = 0

There are of course many ways to represent the same line:

    2x + y + 7 = 0

Is the same as:

    4x + 2y + 14 = 0


Testing a point against a line
------------------------------

Consider the following function:

> pointLine :: Point -> Line -> N
> pointLine (x,y) (a,b,c)  =  a*x + b*y + c

When its result is 0,
that means the point (x,y) is part of the line:

> onLine :: Point -> Line -> Bool
> onLine p r  =  pointLine p r == 0 

The signal of the `pointLine` function
indicates which "side" of the line a point is in.
So one can use it to check if two points are on opposite sides:

> oppositeSidesOf :: Line -> Point -> Point -> Bool
> oppositeSidesOf r p q  =  signum (pointLine p r) /= signum (pointLine q r)


Line from points
----------------

We can compute a line formed by two points with:

> lineFromPoints :: Point -> Point -> Line
> lineFromPoints (x0,y0) (x1,y1)  =  (y1-y0, x0-x1, x1*y0-x0*y1)

There is one degenerate case that is very easy to detect.
When running the above function with a repeated point
one gets `(0,0,0)` as a line.


Point from lines
----------------

We can compute the point of intersection of two lines with:

> pointFromLines :: Line -> Line -> Point
> pointFromLines (a0,b0,c0) (a1,b1,c1)  =  (x / w, y / w)
>   where
>   x  =  c1*b0 - c0*b1
>   y  =  c0*a1 - c1*a0
>   w  =  a0*b1 - a1*b0
>   (/)  =  div  -- hack!  will fail for fractional values


Plane Sweeping
--------------

...


Closest Point
-------------

...



References
----------

* Jorge Stolfi e Pedro Rezende, Fundamentos da Geometria Computacional


Interesting problems
--------------------

* [countingtriangles]
* [dogs]
* [UW-Madison Computational Geometry Practice](https://open.kattis.com/contests/t8vbbm)

[countingtriangles]: https://open.kattis.com/problems/countingtriangles
[dogs]: https://open.kattis.com/problems/dogs


Tests
------

> pointsA :: [Point]
> pointsA  =  [(1,1), (2,2), (4,4), (3,2), (2,3), (3,5)]

> pointsB :: [Point]
> pointsB  =  pointsA ++ [(-1,5), (-1,2), (-2,0), (-2,-2), (0,-1), (2,-1), (-1,2), (3,-2)]

> isDegenerate :: Polygon -> Bool
> isDegenerate ps  =  length ps < 3

> convexHull' :: [Point] -> [Point]
> convexHull' ps | isDegenerate poly  =  []
>                | otherwise          =  poly
>   where
>   poly  =  convexHull ps

> main :: IO ()
> main  =  runTests

> runTests :: IO ()
> runTests  =  case elemIndices False tests of
>   [] -> putStrLn "Tests passed!"
>   is -> putStrLn ("Failed tests:" ++ show is) >> exitFailure

> tests :: [Bool]
> tests  =
>   [ True
>
>   , sqDistance (0,0) (1,1) == 2
>   , sqDistance (0,0) (3,4) == 25
>   , sqDistance (10,10) (13,14) == 25
>
>   , holds n $ \p q -> sqDistance q p == sqDistance p q
>   , holds n $ \p q -> sqDistance (swap p) (swap q) == sqDistance p q
>
>   , onRectangle (2,2)   ((1,1),   2,  2)  == True
>   , onRectangle (3,5)   ((1,1),   2,  2)  == False
>   , onRectangle (-3,-5) ((1,1),   2,  2)  == False
>   , onRectangle (-3,-5) ((0,0),   10, 10) == False
>   , onRectangle (3,5)   ((0,0),   10, 10) == True
>   , onRectangle (0,0)   ((-1,-1), 2,  2)  == True
>   , onRectangle (1,1)   ((-1,-1), 2,  2)  == True
>   , onRectangle (2,2)   ((-1,-1), 2,  2)  == False
>   , onRectangle (5,3)   ((0,0),   3,  5) == False
>   , onRectangle (3,5)   ((0,0),   3,  5) == True
>
>   , holds n $ \p r@(p0,w,h) -> onRectangle (swap p) (swap p0,h,w) == onRectangle p r
>
>   , orientation' (1,1) (3,2) (2,3) == 1
>   , orientation' (1,1) (2,3) (3,2) == -1
>   , orientation' (1,1) (2,2) (4,4) == 0
>
>   , holds n $ \p q r -> negate (orientation p r q) == orientation p q r
>   , holds n $ \p q r -> negate (orientation r q p) == orientation p q r
>   , holds n $ \p q r s -> p /= q
>                        && orientation p q r == 0
>                        && orientation p q s == 0
>                       ==> orientation q r s == 0
>
>   , intersect ((1,1), (4,4)) ((2,3), (3,2)) == True
>   , intersect ((1,1), (2,2)) ((2,3), (3,2)) == False
>   , intersect ((2,2), (4,4)) ((3,2), (3,5)) == True
>   , intersect ((2,2), (4,4)) ((1,1), (2,3)) == False
>   , intersect ((2,3), (4,4)) ((3,2), (3,5)) == True
>   , holds n $ \s t -> intersect t s == intersect s t
>   , holds n $ \s t -> swap s `intersect` t == s `intersect` t
>   , holds n $ \p q r -> (p,q) `intersect` (q,r) == True
>
>   , (2,2) `onCPoly` [(1,1), (3,2), (2,3)] == True
>   , (4,4) `onCPoly` [(1,1), (3,2), (2,3)] == False
>   , (2,2) `onCPoly` [(1,1), (3,2), (4,4), (3,5)] == True
>   , (2,3) `onCPoly` [(1,1), (3,2), (4,4), (3,5)] == True
>   , (1,5) `onCPoly` [(1,1), (3,2), (4,4), (3,5)] == False
>-- , holds n $ \p ps -> isConvex ps && p `elem` ps ==> p `onCPoly` ps
>   , holds n $ \p ps -> p `onCPoly` reverse ps == p `onCPoly` ps
>
>   , compareCCWFrom (1,1) (3,2) (2,3) == LT
>   , compareCCWFrom (0,0) (1,1) (2,2) == EQ
>   , compareCCWFrom (1,1) (2,3) (3,2) == GT
>   , compareCCWFrom (3,2) (4,4) (2,3) == LT
>   , compareCCWFrom (1,1) (3,2) (2,-1) == GT
>
>   -- in general compareCCW does not map to a total ordering
>   , fails n $ \o -> isComparison (compareCCWFrom o)
>
>   -- it is when all other points are within a span of < 180degrees of the origin excluding it
>   , holds n $ \o p q r -> all (o <) [p,q,r] ==> isComparison (compareCCWFrom o) p q r
>   , holds n $ \o p q r -> all (o >) [p,q,r] ==> isComparison (compareCCWFrom o) p q r
>
>   , sortCCWFrom (0,0) [(1,1), (2,2), (2,3), (3,2), (3,5), (4,4)]
>     == [(3,2),(1,1),(2,2),(4,4),(2,3),(3,5)]
>   , holds n $ \ps' -> let o = minimum ps'
>                           ps = filter (/= o) ps'
>                       in sortCCWFrom o (reverse ps) == sortCCWFrom o ps
>   , holds n $ \ps' -> let o = minimum ps'
>                           ps = filter (/= o) ps'
>                       in sortCCWFrom o (sort ps) == sortCCWFrom o ps
>
>   , holds n $ \ps -> let hull = convexHull ps in not (null hull) ==> minimum ps `elem` hull
>   , holds n $ \ps -> let hull = convexHull ps in not (null hull) ==> all (`onCPoly` hull) ps
>   , holds n $ \p q r -> orientation p q r /= 0 ==> convexHull [p,q,r] == sortCCWFrom (minimum [p,q,r]) [p,q,r]
>   , holds n $ \p q r -> orientation p q r == 0 ==> isDegenerate (convexHull [p,q,r])
>
>   , holds n $ naiveConvexHull === convexHull
>   , holds n $ veryNaiveConvexHull === convexHull'
>   , holds n $ \p q r -> orientation p q r == 0 ==> veryNaiveConvexHull [p,q,r] == []
>
>   , holds n $ toStar . reverse === toStar
>   , holds n $ toStar . sort === toStar
>
>   , onLine (2,2) (lineFromPoints (0,0) (1,1))
>   , onLine (2,4) (lineFromPoints (0,0) (1,2))
>   , holds n $ \p q -> p /= q ==> onLine p (lineFromPoints p q)
>   , holds n $ \p q -> p /= q ==> onLine q (lineFromPoints p q)
>   , holds n $ \p@(x,_) q@(_,y) -> p /= q && (x,y) `notElem` [p,q] ==> not (onLine (x,y) (lineFromPoints p q))
>   , holds n $ \p@(_,y) q@(x,_) -> p /= q && (x,y) `notElem` [p,q] ==> not (onLine (x,y) (lineFromPoints p q))
>   , holds n $ \p q r -> onLine r (lineFromPoints p q) == (orientation p q r == 0)
>
>   , pointFromLines (lineFromPoints (0,0) (2,2)) (lineFromPoints (2,0) (0,2)) == (1,1)
>   , pointFromLines (lineFromPoints (2,2) (4,4)) (lineFromPoints (4,2) (2,4)) == (3,3)
>   , pointFromLines (lineFromPoints (0,0) (4,6)) (lineFromPoints (1,4) (3,2)) == (2,3)
>   ]
>   where n = 5040
