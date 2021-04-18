Graph
=====

A graph is a data stucture which consists of:

1. a finite set of **vertices** (or **nodes**)
2. a finite set of ordered pairs which refer to and connect vertices

<img src="https://github.com/friendofdog/se-docs/raw/master/img/graph.png" width=500>

- vertex: name for a **node** in a graph
    - order: total number of vertices in the graph
    - vertex degree: the number of edges connected to a vertex
    - isolated vertex: a vertex that does not connect to any other vertices
- edge: the connection(s) between vertices
    - size: the number of edges in the graph
    - self-loop: an edge which connects a vertex to itself
- Vertices are **adjacent** when they are connected by the same edge.
- A graph **strongly connected** when all vertices are reachable from one another.

Direction
---------

Edges can be either **directed** or **undirected**.

Directed edges point in a single direction from a start vertex to a end vertex. That is, one vertex points to second one; but the second vertex does not point back. A graph where edges are directed is a **directed graph**.

Undirected edges have no direction. The edges between two vertices point to each other. A graph with undirected edges is an **undirected graph**.

Weight
------

Edges can carry a value, referred to as **weight**. A graph where edges have weight is a **weighted graph**, and one where edges have no weight is an **unweighted graph**.

A use case for weight is a graph where vertices represent cities and edges represent the distance between them.

Further reading
---------------

- https://towardsdatascience.com/10-graph-algorithms-visually-explained-e57faa1336f3
