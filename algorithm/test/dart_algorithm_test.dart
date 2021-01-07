import 'package:test/test.dart';

import 'package:dart_algorithm/binary_tree.dart';
import 'package:dart_algorithm/merge_sort.dart';
import 'package:dart_algorithm/quick_sort.dart';
import 'package:dart_algorithm/heap_sort.dart';
import 'package:dart_algorithm/dijkstra.dart';

void main() {
  test('merge sort', () {
    expect(mergeSort(<int>[]), <int>[]);
    expect(mergeSort([1]), [1]);
    expect(mergeSort([1, 10, 3, 5, 2], true), [1, 2, 3, 5, 10]);
    expect(mergeSort([1, 10, 3, 5, 2], false), [10, 5, 3, 2, 1]);
  });

  test('quick sort', () {
    expect(quickSort(<int>[]), <int>[]);
    expect(quickSort([1]), [1]);
    expect(quickSort([1, 10, 3, 5, 2], true), [1, 2, 3, 5, 10]);
    expect(quickSort([1, 10, 3, 5, 2], false), [10, 5, 3, 2, 1]);
  });

  test('heap sort', () {
    expect(heapSort(<int>[]), <int>[]);
    expect(heapSort([1]), [1]);
    expect(heapSort([1, 10, 3, 5, 2], true), [1, 2, 3, 5, 10]);
    expect(heapSort([1, 10, 3, 5, 2], false), [10, 5, 3, 2, 1]);
  });

  test('binary tree', () {
    var tree = BinaryTree(
      15,
      left: BinaryTreeNode(
        10,
        left: BinaryTreeNode(
          4,
        ),
        right: BinaryTreeNode(
          14,
          left: BinaryTreeNode(
            12,
          ),
        ),
      ),
      right: BinaryTreeNode(
        19,
        left: BinaryTreeNode(
          17,
        ),
      ),
    );
    expect(tree.bfs(), [15, 10, 19, 4, 14, 17, 12]);
    expect(tree.dfsPreorder(), [15, 10, 4, 14, 12, 19, 17]);
    expect(tree.dfsPreorderNonRecursive(), [15, 10, 4, 14, 12, 19, 17]);
    expect(tree.dfsInorder(), [4, 10, 12, 14, 15, 17, 19]);
    expect(tree.dfsPostorder(), [4, 12, 14, 10, 17, 19, 15]);
  });

  test('dijkstra', () {
    var edges = [
      Edge(5, 'a', 'b'),
      Edge(4, 'a', 'c'),
      Edge(2, 'a', 'd'),
      Edge(2, 'b', 'c'),
      Edge(3, 'c', 'd'),
      Edge(6, 'b', 'e'),
      Edge(2, 'c', 'f'),
      Edge(6, 'd', 'f'),
      Edge(4, 'e', 'f'),
    ];
    var graph = Graph(edges);
    expect(graph.dijkstra('a', 'e'), ['a', 'c', 'f', 'e']);
  });
}
