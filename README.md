# Project 13 - Curve Length
## Crofton Formula

## Step
1. Draw the curve with parameter eqations of x and y coordinates, and find range of radius from the origin with corresponding point. Let the range be a closed interval [0, b].
2. For each iteration in MAX_N iterations, random pick point (theta, p) in [0, 2\*pi] x [0, b], calculate the number of intersections with corresponding line and the curve.
3. Sum all the number of each result in each iteration in step 2.
4. Divide the result by MAX_N, then we get a averaage value.
5. Multiple the average with the integral domain, then divided by 2, we get the length of curve.
