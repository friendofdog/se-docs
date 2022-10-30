Linked Lists
============

Detecting loops
---------------

```javascript
const hasCycle = (head) => {
    let hare = head;
    let tort = head;
        
    while (hare && hare.next) {
        hare = hare.next.next;
        tort = tort.next;
        
        if (hare === tort) return true;
    }
    
    return false;
};
```
