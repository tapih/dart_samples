class Edge {
  final num distance;
  final String node1;
  final String node2;
  const Edge(this.distance, this.node1, this.node2)
      : assert(distance > 0),
        assert(node1 != node2);

  String getNeighbor(String self) {
    if (node1 == self) return node2;
    if (node2 == self) return node1;
    throw NoSuchNodeException(self, [node1, node2]);
  }
}

class Graph {
  Map<String, List<Edge>> nodes = {};

  Graph(List<Edge> edges) {
    for (var edge in edges) {
      if (nodes[edge.node1] == null) {
        nodes[edge.node1] = [edge];
      } else {
        nodes[edge.node1].add(edge);
      }

      if (nodes[edge.node2] == null) {
        nodes[edge.node2] = [edge];
      } else {
        nodes[edge.node2].add(edge);
      }
    }
  }

  List<String> dijkstra(String start, String goal) {
    if (!nodes.containsKey(start)) throw NoSuchNodeException(start, nodes.keys);
    if (!nodes.containsKey(goal)) throw NoSuchNodeException(goal, nodes.keys);

    // this can be replaced with PriorityQueue.
    final distanceTable = <String, num>{};
    for (var k in nodes.keys) {
      distanceTable[k] = double.infinity;
    }
    distanceTable[start] = 0;

    final routes = <String, List<String>>{};
    routes[start] = [start];

    var currentNode = start;
    while (currentNode != goal) {
      for (var edge in nodes[currentNode]) {
        var neighbor = edge.getNeighbor(currentNode);
        var distanceToNeighbor = distanceTable[currentNode] + edge.distance;

        // this means neighbor is alreadly visited.
        if (!distanceTable.containsKey(neighbor)) continue;
        if (distanceTable[neighbor] > distanceToNeighbor) {
          distanceTable[neighbor] = distanceToNeighbor;
          routes[neighbor] = [...routes[currentNode], neighbor];
        }
      }
      distanceTable.remove(currentNode);

      String nodeWithmin;
      num minValue = double.infinity;
      for (var node in distanceTable.keys) {
        if (minValue > distanceTable[node]) {
          minValue = distanceTable[node];
          nodeWithmin = node;
        }
      }
      if (nodeWithmin == null) {
        throw DisconnectedGraphException(nodes, start, goal);
      }
      currentNode = nodeWithmin;
    }
    return routes[goal];
  }
}

class NoSuchNodeException implements Exception {
  final String name;
  final List<String> nodeNames;
  const NoSuchNodeException(this.name, this.nodeNames);

  @override
  String toString() {
    return '${name} is not included in ${nodeNames}';
  }
}

class DisconnectedGraphException implements Exception {
  final Map<String, List<Edge>> nodes;
  final String start, goal;
  const DisconnectedGraphException(this.nodes, this.start, this.goal);

  @override
  String toString() {
    return '${start} is disconnected from ${goal} in the graph ${nodes}';
  }
}
