//
//  FindTheCityWithTheSmallestNumberofNeighborsataThresholdDistance(1334).swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-08-26.
//

import Foundation

func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        // 1. adjacency matrix (n x n)
  var d = [[Int]](repeating: [Int](repeating: 10001, count: n), count: n)
  for edge in edges {
    let u = edge[0]
    let v = edge[1]
    let w = edge[2]
    d[u][v] = w
    d[v][u] = w
  }
  for i in 0..<n {
    d[i][i] = 0
  }
  
  // 2. floyd-warshall (all pairs)
  for k in 0..<n {
    for u in 0..<n {
      for v in 0..<n {
        if d[u][v] > d[u][k] + d[k][v] {
          d[u][v] = d[u][k] + d[k][v]
        }
      }
    }
  }
  
  // 3. check with threshold (smallest)
  var smallest = n
  var city = 0
  for u in 0..<n {
    var count = 0
    for v in 0..<n {
      if d[u][v] <= distanceThreshold {
        count += 1
      }
    }
    if count <= smallest {
      smallest = count
      city = u
    }
  }
  
  return city
        
}

