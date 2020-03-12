Hash Functions
==============

A hash function maps arbitrary data to a particular location in a list. An item's position within a list is determined by hashing. For example, in a list of names the letters comprising each name could be hashed using a formula of some sort.

Open vs. closed addressing
---------------

Open addressing is where any item can occupy any location in a list. Items are added according to a hash formula.

In closed addressing (a.k.a. "chaining"), instead of a location in a list containing a single item it contains a pointer to a linked list. The linked list might contain one or several items.

Collusions
----------

A collision occurs when more than one item has the same calculated address. This will frequently happen where the hashing of an items resolves to the same thing as the hashing of another item.

Open addressing solves collisions by assigning an address other than the calculated one. This means that any item can potentially occupy any location, and it does not matter which one.

### Open addressing solution: linear probing

Linear probing is a kind of open addressing which finds the next linear location when a collision occurs. For example, if two names like "Mia" and "Sue" evaluate to the same address, the colliding item will take the next available location in the array.

### Open addressing solution: large table

In complement to linear probing, increasing the list / table size to something larger than the total number of items will reduce the changes of collusion occurring. That is, you can decrease the "load factor".

Load factor is the ratio of total items stored to size of array. A list being as long as the items stored in it has a 1:1 ratio; a list being twice as long has a 1:2 ratio.

### Closed addressing solution: chaining

Closed addressing inherently solves the issue of collusions by chaining the values in a list, which is pointed to by the hash. Lookup is generally quicker than linear probing, as more items will be at the calculated address. But then, the list itself must be traversed should there be more than one item present.
