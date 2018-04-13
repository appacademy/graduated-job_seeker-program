require 'rspec'
require 'bst'

describe BinarySearchTree do
  let(:bst) { BinarySearchTree.new }
  let(:prefilled_bst) do
    bst = BinarySearchTree.new
    [5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
      bst.insert(el)
    end

    bst
  end
  #############################
  # prefilled_bst looks like: #
  #             (5)           #
  #            /   \          #
  #          (3)   (7)        #
  #         /  \      \       #
  #      (1)   (4)    (9)     #
  #     /   \            \    #
  #   (0)   (2)          (10) #
  #        /                  #
  #      (1.5)                #
  #############################

  describe '#initialize' do
    it 'sets @root to nil' do
      expect(bst.root).to eq(nil)
    end
  end

  describe '#insert' do
    it 'inserts values in the correct order' do
      bst.insert(5)
      expect(bst.root.value).to eq(5)

      bst.insert(2)
      expect(bst.root.left.value).to eq(2)

      bst.insert(8)
      expect(bst.root.right.value).to eq(8)

      bst.insert(1)
      intermediate_root = bst.root.left
      # intermediate_root is the node with value of 2

      expect(intermediate_root.left.value).to eq(1)

      expect(prefilled_bst.root.value).to eq(5)
      expect(prefilled_bst.root.left.value).to eq(3)
      expect(prefilled_bst.root.left.left.value).to eq(1)
      expect(prefilled_bst.root.left.left.left.value).to eq(0)
      expect(prefilled_bst.root.left.left.right.value).to eq(2)
      expect(prefilled_bst.root.left.left.right.left.value).to eq(1.5)
      expect(prefilled_bst.root.left.right.value).to eq(4)
      expect(prefilled_bst.root.left.right.right).to eq(nil)
      expect(prefilled_bst.root.right.value).to eq(7)
      expect(prefilled_bst.root.right.left).to eq(nil)
      expect(prefilled_bst.root.right.right.value).to eq(9)
      expect(prefilled_bst.root.right.right.right.value).to eq(10)
    end
  end

  describe '#find' do
    it 'returns nil if the value is not in the BST' do
      expect(prefilled_bst.find(-5)).to eq(nil)
    end

    it 'returns the correct node if value is in the BST' do
      found_node = prefilled_bst.find(4)
      expect(found_node).to be_instance_of(BSTNode)
      expect(found_node.value).to eq(4)
    end
  end

  describe '#delete' do
    context 'if target node has no children' do
      it 'deletes the target node' do
        parent_of_four = prefilled_bst.root.left
        prefilled_bst.delete(4)

        expect(parent_of_four.right).to eq(nil)
      end

      it 'sets the root to nil if the target node is the root' do
        bst.insert(5)
        bst.delete(5)

        expect(bst.root).to eq(nil)
      end
    end

    context 'if target node has one child' do
      it 'deletes the target node and promotes its child' do
        parent_of_seven = prefilled_bst.root
        prefilled_bst.delete(7)

        expect(parent_of_seven.right.value).to eq(9)
      end
    end

    context 'if target node has two children' do
      it 'replaces target node with maximum of target\'s left tree' do
        parent_of_three = prefilled_bst.root
        prefilled_bst.delete(3)

        expect(parent_of_three.left.value).to eq(2)
      end

      context 'when promoted child has its own child' do
        it 'promotes its child to take its place' do
          parent_of_two = prefilled_bst.root.left.left
          prefilled_bst.delete(3)
          # the above action promotes 2 to replace 3

          expect(parent_of_two.right.value).to eq(1.5)
        end
      end
    end
  end

  describe '#maximum' do
    it 'finds the maximum' do
      expect(prefilled_bst.maximum.value).to eq(10)
    end

    it 'finds the maximum of subtrees' do
      subtree_root = prefilled_bst.root.left

      expect(prefilled_bst.maximum(subtree_root).value).to eq(4)
    end
  end

  describe '#depth' do
    it 'finds the depth of the tree' do
      bst.insert(5)
      expect(bst.depth).to eq(0)
      expect(prefilled_bst.depth).to eq(4)
    end
  end

  describe '#is_balanced?' do
    let(:balanced_bst) do
      bst = BinarySearchTree.new
      [14, 4, 16, 1, 10, 20].each do |el|
        bst.insert(el)
      end

      bst
    end
    context 'when tree is balanced' do
      it 'returns true' do
        expect(balanced_bst.is_balanced?).to eq(true)
      end
    end

    context 'when tree is unbalanced' do
      it 'returns false' do
        expect(prefilled_bst.is_balanced?).to eq(false)
      end
    end
  end

  describe '#in_order_traversal' do
    it 'visits left children, then itself, then right children' do
      in_order_array = [0, 1, 1.5, 2, 3, 4, 5, 7, 9, 10]
      expect(prefilled_bst.in_order_traversal).to eq(in_order_array)
    end
  end
end
