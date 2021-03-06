# 数据结构之树与二叉树

## 基本概念
* 树状结构是结点间有分支的、层次的结构，它是一种常见的有很重要的非线性结构。
```
## 树(tree)是 n (n>=0)个结点的有限集合T，如果T为空，则它是一棵空树(null tree),否则
  1> T中有一个特别标出的称为 根 的结点；
  2> 除根结点之外，其余结点被分成 m(m>=0) 个互不相交的非空集合T1,T2,...Tm ,其中每个集合本身又都是树。且称为T的子树(subtree)。

```

* 度数(degree):             一个结点的字数个数。
* 树叶(leaf):               没有子树的结点称为树叶或终端结点。
* 分支结点(branch node):     非终端结点。
* 子女(child)或儿子(son):    一个结点的子树的根是该结点的子女或儿子。
* 父母(parent):             若结点c是结点p的儿子，则结点p是结点c的父母或父亲。
* 兄弟(sibling):            有相同父母结点的结点互为兄弟。
* 子孙(descendent):         根为r的树(或子树)中所有结点都是r的子孙。除r之外，它们又都是它的真子孙(proper ancestor)。
* 祖先(ancestor):           从根r到祖先p的路径(有且仅有一条这样的路径)上的所有结点都是p的祖先。除 p 之外它们又都是p的真祖先。
* 有序树(ordered tree):     树中各结点的儿子都是有序的。
* 层数(level):              定义树根的层数为1，其他结点的层数等于其父母结点的层数加1。
* 高度(或深度)(height):      树中结点的最大层数，规定空树的高度为0。
* 树林(或森林)(forest):      n(n>=0)个互不相交的树的集合。
* 二叉树(binary tree)是树状结构的一个重要类型。二叉树的每个结点至多有两个子女，而且子女有左右之分。二叉树的储存结构简单，存储效率较高，树运算的算法实现也相对简单。二叉树还可用来表示树。


```
## 二叉树由结点的有限集合构成，这个有限集合或者为空集，或者由一个根结点及两颗不相交的分别称作这个根的左子树和右子树的二叉树组成。

>> 任何一棵含有n(n>0)个结点的二叉树恰有 n-1 条边。

>> 深度为 h 的二叉树至多有 (2^h  - 1) 个结点。

>> 设二叉树的结点为 n ，深度为 h ，则
                          [log2(n+1)] <= h <= n

>> 一棵深度为 h 且 有 2^h - 1 个结点的二叉树称为满二叉树(full binary tree)。

>> 深度为 h 且 有 n 个结点的二叉树，当且仅当其每个结点都与深度为h的满二叉树中编号从 1~n 的结点一一对应时，称为完全二叉树。


>> 如果对一棵有 n 个结点的完全二叉树的结点，按层次次序编号(每层从左至右)，则对任意结点i(1<=i<=n)，下述结论成立：
    （1）若 i = 1，则结点i为二叉树的根结点；i>1,则结点[i/2]为其父母结点；
    （2）若2*i > n,则结点i无左子女，否则结点2*i为结点i的左子女；
    （3）若2*i+1>n,则结点i无右子女，否则结点2*i+1为结点i的有子女。

```

### 二叉树的存储方式
* 顺序存储

* 链接存储
    1> LeftChild-RightChild 表示法
    2> 三重链表示

### 二叉树的遍历方式
* 我们可以将一个二叉树结构分为三个部分：根结点、左子树、右子树。
* 先序遍历的访问顺序
    根结点 --- > 左子树 --- > 右子树。
* 中序遍历的访问顺序
     左子树 --- > 根结点 --- > 右子树。
* 后序遍历的访问顺序
     左子树 --- > 子树 --- > 根结点。
