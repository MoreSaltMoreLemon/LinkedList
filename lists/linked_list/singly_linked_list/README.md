# Singly Linked List

# O(n) Performance

| Complexity | Insertion | Removal | Searching | Access |
| --- | --- | --- | --- | --- |
| singly linked list | O(1), constant | O(1) - O(n) | O(n) | O(n) |

Singly Linked lists have excellent performance for insertion and deletion as, unlike an indexed list like an array, there is no association between elements beyond their immediate connections.

However they have some performance drawbacks compared to arrays as they do not have adjacent storage, and rely upon a dictionary/hash/object style data structure for lookups, increasing space complexity. But most significantly, to perform operations like searching, sorting or removing nodes, the list may require a full iteration for each operation. Something as simple as going to the previous node in the sequence requires visiting each prior node starting with the head of the list.

They may also contain cycles if a node's next value points to a node already in the sequence.

Excellent for stacks and queues, bad for collections which need to be re-arranged or searched quickly.