# Tautology investigation

This is Haskell code to determine the approximate relationship between the number of formulas of size $n$ and the number of tautologies of size $n$. I am looking for an aapproximation, not an exact formula.

To be precise, if $T(s, v)$ counts the number of tautologies of size $s$ with $v$ variables and $F(s, v)$ counts the number of formulas of size $s$ and $v$ variables, I am looking to approximate $T(s, v) / F(s , v)$ (speaking loosely, the probability that an arbitrarily selected formulas would be a tautology).

# What is a Tautology

A tautology is a formula that is true for all substitutions. For example, here are all 180 tautologies with size at most 6 on 3 variables:

``` 
Not (Not (Or (Not (v1)) (v1)))
Not (Not (Or (Not (v2)) (v2)))
Not (Not (Or (Not (v3)) (v3)))
Not (Not (Or (v1) (Not (v1))))
Not (Not (Or (v2) (Not (v2))))
Not (Not (Or (v3) (Not (v3))))
Not (And (Not (v1)) (v1))
Not (And (Not (v2)) (v2))
Not (And (Not (v3)) (v3))
Not (And (Not (v1)) (v1))
Not (And (Not (v2)) (v2))
Not (And (Not (v3)) (v3))
Not (And (v1) (Not (v1)))
Not (And (v2) (Not (v2)))
Not (And (v3) (Not (v3)))
Not (And (v1) (Not (v1)))
Not (And (v2) (Not (v2)))
Not (And (v3) (Not (v3)))
Or (Not (v1)) (v1)
Or (Not (Not (Not (v1)))) (v1)
Or (Not (And (v1) (v1))) (v1)
Or (Not (Or (v1) (v1))) (v1)
Or (Not (And (v2) (v1))) (v1)
Or (Not (And (v3) (v1))) (v1)
Or (Not (And (v1) (v2))) (v1)
Or (Not (And (v1) (v3))) (v1)
Or (Or (Not (v1)) (v1)) (v1)
Or (Or (Not (v1)) (v2)) (v1)
Or (Or (Not (v2)) (v2)) (v1)
Or (Or (Not (v1)) (v3)) (v1)
Or (Or (Not (v3)) (v3)) (v1)
Or (Or (v1) (Not (v1))) (v1)
Or (Or (v2) (Not (v1))) (v1)
Or (Or (v3) (Not (v1))) (v1)
Or (Or (v2) (Not (v2))) (v1)
Or (Or (v3) (Not (v3))) (v1)
Or (Not (v2)) (v2)
Or (Not (Not (Not (v2)))) (v2)
Or (Not (And (v2) (v1))) (v2)
Or (Not (And (v1) (v2))) (v2)
Or (Not (And (v2) (v2))) (v2)
Or (Not (Or (v2) (v2))) (v2)
Or (Not (And (v3) (v2))) (v2)
Or (Not (And (v2) (v3))) (v2)
Or (Or (Not (v1)) (v1)) (v2)
Or (Or (Not (v2)) (v1)) (v2)
Or (Or (Not (v2)) (v2)) (v2)
Or (Or (Not (v2)) (v3)) (v2)
Or (Or (Not (v3)) (v3)) (v2)
Or (Or (v1) (Not (v1))) (v2)
Or (Or (v1) (Not (v2))) (v2)
Or (Or (v2) (Not (v2))) (v2)
Or (Or (v3) (Not (v2))) (v2)
Or (Or (v3) (Not (v3))) (v2)
Or (Not (v3)) (v3)
Or (Not (Not (Not (v3)))) (v3)
Or (Not (And (v3) (v1))) (v3)
Or (Not (And (v3) (v2))) (v3)
Or (Not (And (v1) (v3))) (v3)
Or (Not (And (v2) (v3))) (v3)
Or (Not (And (v3) (v3))) (v3)
Or (Not (Or (v3) (v3))) (v3)
Or (Or (Not (v1)) (v1)) (v3)
Or (Or (Not (v3)) (v1)) (v3)
Or (Or (Not (v2)) (v2)) (v3)
Or (Or (Not (v3)) (v2)) (v3)
Or (Or (Not (v3)) (v3)) (v3)
Or (Or (v1) (Not (v1))) (v3)
Or (Or (v2) (Not (v2))) (v3)
Or (Or (v1) (Not (v3))) (v3)
Or (Or (v2) (Not (v3))) (v3)
Or (Or (v3) (Not (v3))) (v3)
Or (Not (v1)) (v1)
Or (Not (v2)) (v2)
Or (Not (v3)) (v3)
Or (v1) (Not (v1))
Or (Not (Not (v1))) (Not (v1))
Or (And (v1) (v1)) (Not (v1))
Or (Or (v1) (v1)) (Not (v1))
Or (Or (v2) (v1)) (Not (v1))
Or (Or (v3) (v1)) (Not (v1))
Or (Or (v1) (v2)) (Not (v1))
Or (Or (v1) (v3)) (Not (v1))
Or (v2) (Not (v2))
Or (Not (Not (v2))) (Not (v2))
Or (Or (v2) (v1)) (Not (v2))
Or (Or (v1) (v2)) (Not (v2))
Or (And (v2) (v2)) (Not (v2))
Or (Or (v2) (v2)) (Not (v2))
Or (Or (v3) (v2)) (Not (v2))
Or (Or (v2) (v3)) (Not (v2))
Or (v3) (Not (v3))
Or (Not (Not (v3))) (Not (v3))
Or (Or (v3) (v1)) (Not (v3))
Or (Or (v3) (v2)) (Not (v3))
Or (Or (v1) (v3)) (Not (v3))
Or (Or (v2) (v3)) (Not (v3))
Or (And (v3) (v3)) (Not (v3))
Or (Or (v3) (v3)) (Not (v3))
Or (Not (v1)) (v1)
Or (Not (v2)) (v2)
Or (Not (v3)) (v3)
Or (v1) (Not (v1))
Or (v2) (Not (v2))
Or (v3) (Not (v3))
Or (Not (v1)) (Not (Not (v1)))
Or (Not (v2)) (Not (Not (v2)))
Or (Not (v3)) (Not (Not (v3)))
Or (Not (v1)) (And (v1) (v1))
Or (Not (v1)) (Or (v1) (v1))
Or (Not (v1)) (Or (v2) (v1))
Or (Not (v2)) (Or (v2) (v1))
Or (Not (v1)) (Or (v3) (v1))
Or (Not (v3)) (Or (v3) (v1))
Or (Not (v1)) (Or (v1) (v2))
Or (Not (v2)) (Or (v1) (v2))
Or (Not (v2)) (And (v2) (v2))
Or (Not (v2)) (Or (v2) (v2))
Or (Not (v2)) (Or (v3) (v2))
Or (Not (v3)) (Or (v3) (v2))
Or (Not (v1)) (Or (v1) (v3))
Or (Not (v3)) (Or (v1) (v3))
Or (Not (v2)) (Or (v2) (v3))
Or (Not (v3)) (Or (v2) (v3))
Or (Not (v3)) (And (v3) (v3))
Or (Not (v3)) (Or (v3) (v3))
Or (v1) (Not (v1))
Or (v2) (Not (v2))
Or (v3) (Not (v3))
Or (v1) (Not (Not (Not (v1))))
Or (v2) (Not (Not (Not (v2))))
Or (v3) (Not (Not (Not (v3))))
Or (v1) (Not (And (v1) (v1)))
Or (v1) (Not (Or (v1) (v1)))
Or (v1) (Not (And (v2) (v1)))
Or (v2) (Not (And (v2) (v1)))
Or (v1) (Not (And (v3) (v1)))
Or (v3) (Not (And (v3) (v1)))
Or (v1) (Not (And (v1) (v2)))
Or (v2) (Not (And (v1) (v2)))
Or (v2) (Not (And (v2) (v2)))
Or (v2) (Not (Or (v2) (v2)))
Or (v2) (Not (And (v3) (v2)))
Or (v3) (Not (And (v3) (v2)))
Or (v1) (Not (And (v1) (v3)))
Or (v3) (Not (And (v1) (v3)))
Or (v2) (Not (And (v2) (v3)))
Or (v3) (Not (And (v2) (v3)))
Or (v3) (Not (And (v3) (v3)))
Or (v3) (Not (Or (v3) (v3)))
Or (v1) (Or (Not (v1)) (v1))
Or (v2) (Or (Not (v1)) (v1))
Or (v3) (Or (Not (v1)) (v1))
Or (v2) (Or (Not (v2)) (v1))
Or (v3) (Or (Not (v3)) (v1))
Or (v1) (Or (Not (v1)) (v2))
Or (v1) (Or (Not (v2)) (v2))
Or (v2) (Or (Not (v2)) (v2))
Or (v3) (Or (Not (v2)) (v2))
Or (v3) (Or (Not (v3)) (v2))
Or (v1) (Or (Not (v1)) (v3))
Or (v2) (Or (Not (v2)) (v3))
Or (v1) (Or (Not (v3)) (v3))
Or (v2) (Or (Not (v3)) (v3))
Or (v3) (Or (Not (v3)) (v3))
Or (v1) (Or (v1) (Not (v1)))
Or (v2) (Or (v1) (Not (v1)))
Or (v3) (Or (v1) (Not (v1)))
Or (v1) (Or (v2) (Not (v1)))
Or (v1) (Or (v3) (Not (v1)))
Or (v2) (Or (v1) (Not (v2)))
Or (v1) (Or (v2) (Not (v2)))
Or (v2) (Or (v2) (Not (v2)))
Or (v3) (Or (v2) (Not (v2)))
Or (v2) (Or (v3) (Not (v2)))
Or (v3) (Or (v1) (Not (v3)))
Or (v3) (Or (v2) (Not (v3)))
Or (v1) (Or (v3) (Not (v3)))
Or (v2) (Or (v3) (Not (v3)))
Or (v3) (Or (v3) (Not (v3)))
```

# Table 

| Size (s) | Vars (v) | Tautologies T(s,v) | Total Formulas F(s,v) | Ratio T(s,v)/F(s,v) |
|:--------:|:--------:|:------------------:|:---------------------:|:-------------------:|
| 1        | 1        | 0                  | 1                     | 0.00000             |
| 1        | 2        | 0                  | 2                     | 0.00000             |
| 1        | 3        | 0                  | 3                     | 0.00000             |
| 1        | 4        | 0                  | 4                     | 0.00000             |
| 1        | 5        | 0                  | 5                     | 0.00000             |
| 1        | 6        | 0                  | 6                     | 0.00000             |
| 1        | 7        | 0                  | 7                     | 0.00000             |
| 2        | 1        | 0                  | 2                     | 0.00000             |
| 2        | 2        | 0                  | 4                     | 0.00000             |
| 2        | 3        | 0                  | 6                     | 0.00000             |
| 2        | 4        | 0                  | 8                     | 0.00000             |
| 2        | 5        | 0                  | 10                    | 0.00000             |
| 2        | 6        | 0                  | 12                    | 0.00000             |
| 2        | 7        | 0                  | 14                    | 0.00000             |
| 3        | 1        | 0                  | 5                     | 0.00000             |
| 3        | 2        | 0                  | 14                    | 0.00000             |
| 3        | 3        | 0                  | 27                    | 0.00000             |
| 3        | 4        | 0                  | 44                    | 0.00000             |
| 3        | 5        | 0                  | 65                    | 0.00000             |
| 3        | 6        | 0                  | 90                    | 0.00000             |
| 3        | 7        | 0                  | 119                   | 0.00000             |
| 4        | 1        | 2                  | 14                    | 0.14286             |
| 4        | 2        | 4                  | 48                    | 0.08333             |
| 4        | 3        | 6                  | 102                   | 0.05882             |
| 4        | 4        | 8                  | 176                   | 0.04545             |
| 4        | 5        | 10                 | 270                   | 0.03704             |
| 4        | 6        | 12                 | 384                   | 0.03125             |
| 4        | 7        | 14                 | 518                   | 0.02703             |
| 5        | 1        | 6                  | 43                    | 0.13953             |
| 5        | 2        | 12                 | 194                   | 0.06186             |
| 5        | 3        | 18                 | 501                   | 0.03593             |
| 5        | 4        | 24                 | 1012                  | 0.02372             |
| 5        | 5        | 30                 | 1775                  | 0.01690             |
| 5        | 6        | 36                 | 2838                  | 0.01268             |
| 5        | 7        | 42                 | 4249                  | 0.00988             |
| 6        | 1        | 28                 | 140                   | 0.20000             |
| 6        | 2        | 88                 | 804                   | 0.10945             |
| 6        | 3        | 180                | 2376                  | 0.07576             |
| 6        | 4        | 304                | 5240                  | 0.05802             |
| 6        | 5        | 460                | 9780                  | 0.04703             |
| 6        | 6        | 648                | 16380                 | 0.03956             |
| 6        | 7        | 868                | 25424                 | 0.03414             |
| 7        | 1        | 92                 | 475                   | 0.19368             |
| 7        | 2        | 352                | 3518                  | 0.10006             |
| 7        | 3        | 780                | 12297                 | 0.06343             |
| 7        | 4        | 1376               | 30940                 | 0.04447             |
| 7        | 5        | 2140               | 64535                 | 0.03316             |
| 7        | 6        | 3072               | 119130                | 0.02579             |
| 7        | 7        | 4172               | 201733                | 0.02068             |
| 8        | 1        | 352                | 1660                  | 0.21205             |
| 8        | 2        | 1912               | 15744                 | 0.12144             |
| 8        | 3        | 5352               | 63852                 | 0.08382             |
| 8        | 4        | 11344              | 178144                | 0.06368             |
| 8        | 5        | 20560              | 401340                | 0.05123             |
| 8        | 6        | 33672              | 786720                | 0.04280             |
| 8        | 7        | 51352              | 1398124               | 0.03673             |
| 9        | 1        | 1256               | 5933                  | 0.21170             |
| 9        | 2        | 8720               | 72226                 | 0.12073             |
| 9        | 3        | 27576              | 343359                | 0.08031             |
| 9        | 4        | 63008              | 1080932               | 0.05829             |
| 9        | 5        | 120200             | 2690545               | 0.04467             |
| 9        | 6        | 204336             | 5748678               | 0.03554             |
| 9        | 7        | 320600             | 11029571              | 0.02907             |
| 10       | 1        | 4716               | 21582                 | 0.21852             |
| 10       | 2        | 43856              | 336740                | 0.13024             |
| 10       | 3        | 168204             | 1865730               | 0.09015             |
| 10       | 4        | 446976             | 6556008               | 0.06818             |
| 10       | 5        | 967820             | 17758550              | 0.05450             |
| 10       | 6        | 1836816            | 40604172              | 0.04524             |
| 10       | 7        | 3178476            | 82379850              | 0.03858             |



| Size (s) | v = 1   | v = 2   | v = 3   | v = 4   | v = 5   | v = 6   | v = 7   |
|:--------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|
| **1**    | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 |
| **2**    | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 |
| **3**    | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 | 0.00000 |
| **4**    | 0.14286 | 0.08333 | 0.05882 | 0.04545 | 0.03704 | 0.03125 | 0.02703 |
| **5**    | 0.13953 | 0.06186 | 0.03593 | 0.02372 | 0.01690 | 0.01268 | 0.00988 |
| **6**    | 0.20000 | 0.10945 | 0.07576 | 0.05802 | 0.04703 | 0.03956 | 0.03414 |
| **7**    | 0.19368 | 0.10006 | 0.06343 | 0.04447 | 0.03316 | 0.02579 | 0.02068 |
| **8**    | 0.21205 | 0.12144 | 0.08382 | 0.06368 | 0.05123 | 0.04280 | 0.03673 |
| **9**    | 0.21170 | 0.12073 | 0.08031 | 0.05829 | 0.04467 | 0.03554 | 0.02907 |
| **10**   | 0.21852 | 0.13024 | 0.09015 | 0.06818 | 0.05450 | 0.04524 | 0.03858 |

