import 'dart:collection';

class BinaryTreeNode<T> {
  final T value;
  final BinaryTreeNode<T> left, right;
  const BinaryTreeNode(this.value, {this.left, this.right});
}

class BinaryTree<T> {
  final BinaryTreeNode<T> root;
  BinaryTree(
    T value, {
    BinaryTreeNode<T> left,
    BinaryTreeNode<T> right,
  }) : root = BinaryTreeNode(value, left: left, right: right);

  List<T> bfs() {
    if (root == null) return null;

    const blank = null;
    final q = Queue<BinaryTreeNode<T>>();
    final l = <T>[];
    q.add(root);
    q.add(blank);
    while (q.length > 1) {
      var v = q.removeFirst();
      if (v == blank) {
        q.add(blank);
        continue;
      }
      l.add(v.value);
      if (v.left != null) q.add(v.left);
      if (v.right != null) q.add(v.right);
    }
    return l;
  }

  List<T> dfsPreorderNonRecursive() {
    if (root == null) return null;

    // this is not a queue but a stack actually
    final s = Queue();
    final l = <T>[];
    s.addFirst(root);
    while (s.isNotEmpty) {
      var v = s.removeFirst();
      l.add(v.value);
      if (v.right != null) s.addFirst(v.right);
      if (v.left != null) s.addFirst(v.left);
    }
    return l;
  }

  List<T> dfsPreorder() {
    if (root == null) return null;

    final l = <T>[];
    void inner(BinaryTreeNode<T> node) {
      if (node == null) return;
      l.add(node.value);
      inner(node.left);
      inner(node.right);
    }

    inner(root);
    return l;
  }

  List<T> dfsInorder() {
    if (root == null) return null;

    final l = <T>[];
    void inner(BinaryTreeNode<T> node) {
      if (node == null) return;
      inner(node.left);
      l.add(node.value);
      inner(node.right);
    }

    inner(root);
    return l;
  }

  List<T> dfsPostorder() {
    if (root == null) return null;

    final l = <T>[];
    void inner(BinaryTreeNode<T> node) {
      if (node == null) return;
      inner(node.left);
      inner(node.right);
      l.add(node.value);
    }

    inner(root);
    return l;
  }
}
