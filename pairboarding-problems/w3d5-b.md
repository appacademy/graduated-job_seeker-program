# Partner B

## Weak Sauce (1 minute)
What is your greatest weakness as a software engineer? What are you doing to overcome that weakness?

## Knowledge Question (5 minutes)
What happens during the lifecycle of a React component?

### Solution
(taken from [codementor](https://www.codementor.io/reactjs/tutorial/5-essential-reactjs-interview-questions))
#### High-level component lifecycle
At the highest level, React components have lifecycle events that fall into three general categories:

1. Initialization
2. State/Property Updates
3. Destruction

Every React component defines these events as a mechanism for managing its properties, state, and rendered output. Some of these events only happen once, others happen more frequently; understanding these three general categories should help you clearly visualize when certain logic needs to be applied.

For example, a component may need to add event listeners to the DOM when it first mounts. However, it should probably remove those event listeners when the component unmounts from the DOM so that irrelevant processing does not occur.
```js
class MyComponent extends React.Component {
    // when the component is added to the DOM...
    componentDidMount() {
        window.addEventListener(‘resize’, this.onResizeHandler);
    }

    // when the component is removed from the DOM...
    componentWillUnmount() {
        window.removeEventListener(‘resize’, this.onResizeHandler);
    }

    onResizeHandler() {
        console.log(‘The window has been resized!’);
    }
}
```

#### Low-level component lifecycle
![specific component lifecycles](./images/component-lifecycle.png)

Within these three general buckets exist a number of specific lifecycle hooks — essentially abstract methods — that can be utilized by any React component to more accurately manage updates. Understanding how and when these hooks fire is key to building stable components and will enable you to control the rendering process (improving performance).

Take a look at the diagram above. The events under “Initialization” only happen when a component is first initialized or added to the DOM. Similarly, the events under “Destruction” only happen once (when the component is removed from the DOM). However, the events under “Update” happen every time the properties or state of the component change.

For example, components will automatically re-render themselves any time their properties or state change. However, in some cases a component might not need to update — so preventing the component from re-rendering might improve the performance of our application.

```js
class MyComponent extends React.Component {

    // only re-render if the ID has changed!
    shouldComponentUpdate(nextProps, nextState) {
        return nextProps.id === this.props.id;
    }
}
```
**For more specific details**, go through [React docs on component lifecycle](https://facebook.github.io/react/docs/react-component.html)

## Whiteboarding Question (40 minutes)
Given two nodes in a binary tree, design an algorithm that computes their Least Common Ancestor (LCA). Assume that each node has a parent pointer.

For example, given this BST:
```
           (A)
          /   \
        (B)   (F)
       /   \
    (C)    (E)
    /
  (D)
```
The LCA of `D` and `E` would be `B`.

### Notes for the interviewer
* Please set a timer for 40 minutes for this problem.
* If your interviewee comes up with a sub-optimal solution before 40 minutes, then push them to keep working towards the optimal solution until the 40 minutes is up.
* Be sure to ask about time and space complexity.
* Bonus: If your interviewee reaches the optimal solution, thoroughly and clearly performs the time/space complexity analysis, and tests the solution before the 40 minutes, consider challenging your interviewee to solve the same problem **assuming that each node DOES NOT have a parent pointer.** In the bonus scenario, assume that the tree is being given as an input.

### Solution
A brute-force approach is to store the nodes on the search path from the root to one of the nodes in a hash table. This is easily done since we can use the parent field. Then we go up from the second node, stopping as soon as we hit a node in the hash table. The time and space complexity are both O(h), where h is the height of the tree.

Brute-force solution:
```ruby
def lca(node_0, node_1)
  node_zero_path = {}

  while node_0.parent
    node_zero_path[node_0.parent] = true
    node_0 = node_0.parent
  end

  while node_1
    shared_ancestor = node_zero_path[node_1.parent]
    return shared_ancestor if shared_ancestor
    node_1 = node_1.parent
  end

  nil
end
```

We know the two nodes have a common ancestor, namely the root. If the nodes are at the same depth, we can move up the tree in tandem from both nodes, stopping at the first common node, which is the LCA. However, if they are not the same depth, we need to keep the set of traversed nodes to know when we find the first common node. We can circumvent having to store these nodes by ascending from the deeper node to get the same depth as the shallower node, and then performing the tandem upward movement.

For example, given this BST:
```
                    A(314)
                /           \
            B(6)              I(6)
          /     \             /    \
      C(217)    F(561)      J(2)    O(271)
    /    \            \        \        \
D(28)   E(0)         G(3)      K(1)      P(28)
                    /         /    \
                H(17)       L(401)  N(257)
                                \
                              M(641)
```
Nodes M and P are depths 5 and 3, respectively. Their search paths are [A, I, J, K, L, M] and [A, I, O, P]. If we ascend to depth 3 from M, we get to K. Now when we move upwards in tandem, the first common node is I, which is the LCA of M and P.

Computing the depth is straightforward since we have the parent field --the time complexity is O(h) and the space complexity is O(1). Once we have the depths, we can perform the tandem move to get the LCA.

```ruby
def lca(node_0, node_1)
  depth_0 = get_depth(node_0)
  depth_1 = get_depth(node_1)

  # Makes node_0 as the deeper node in order to simplify the code.
  if depth_1 > depth_0
    node_0, node_1 = node_1, node_0
  end

  # Ascends from the deeper node.
  depth_diff = (depth_0 - depth_1).abs
  while depth_diff
    node_0 = node_0.parent
    depth_diff -= 1
  end

  # Now ascends both nodes until we reach the LCA.
  while node_0 != node_1
    node_0 = node_0.parent
    node_1 = node_1.parent
  end

  # Return the LCA
  node_0
end

def get_depth(node)
  depth = 0
  while node
    depth += 1
    node = node.parent
  end
  depth
end
```
