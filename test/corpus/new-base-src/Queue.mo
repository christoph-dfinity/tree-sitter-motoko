=========
Queue.mo
=========

/// A mutable double-ended queue of elements.
/// The queue has two ends, front and back.
/// Elements can be added and removed at the two ends.
///
/// This can be used for different use cases, such as:
/// * Queue (FIFO) by using `pushBack()` and `popFront()`
/// * Stack (LIFO) by using `pushFront()` and `popFront()`.
///
/// Example:
/// ```motoko
/// import Queue "Queue";
/// import Debug "Debug";
///
/// persistent actor {
///   let orders = Queue.empty<Text>();
///   Queue.pushBack(orders, "Antipasta");
///   Queue.pushBack(orders, "Spaghetti");
///   Queue.pushBack(orders, "Bistecca");
///   Queue.pushBack(orders, "Dolce");
///   label iteration loop {
///     switch (Queue.popFront(orders)) {
///       case null { break iteration };
///       case (?description) {
///         Debug.print(description)
///       }
///     }
///   }
///   // prints:
///   // `Antipasta`
///   // `Spaghetti`
///   // `Bistecca`
///   // `Dolce`
/// }
/// ```
///
/// The internal implementation is a doubly-linked list.
///
/// Performance:
/// * Runtime: `O(1)` for push, pop, and peek operations.
/// * Space: `O(n)`.
/// `n` denotes the number of elements stored in the queue.

import PureQueue "pure/Queue";
import Iter "Iter";
import Order "Order";
import Types "Types";

module {
  public type Queue<T> = Types.Queue.Queue<T>;

  type Node<T> = Types.Queue.Node<T>;

  /// Converts a mutable queue to an immutable, purely functional queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   let pureQueue = Queue.toPure<Nat>(queue);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func toPure<T>(queue : Queue<T>) : PureQueue.Queue<T> {
    let pureQueue = PureQueue.empty<T>();
    let iter = values(queue);
    var current = pureQueue;
    loop {
      switch (iter.next()) {
        case null { return current };
        case (?val) { current := PureQueue.pushBack(current, val) }
      }
    }
  };

  /// Converts an immutable, purely functional queue to a mutable queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  /// import PureQueue "mo:base/pure/Queue";
  ///
  /// persistent actor {
  ///   let pureQueue = PureQueue.fromIter<Nat>([1, 2, 3].values());
  ///   let queue = Queue.fromPure<Nat>(pureQueue);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func fromPure<T>(pureQueue : PureQueue.Queue<T>) : Queue<T> {
    let queue = empty<T>();
    let iter = PureQueue.values(pureQueue);
    loop {
      switch (iter.next()) {
        case null { return queue };
        case (?val) { pushBack(queue, val) }
      }
    }
  };

  /// Create a new empty mutable double-ended queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  /// import Nat "mo:base/Nat";
  /// import Debug "mo:base/Debug";
  ///
  /// persistent actor {
  ///   let queue = Queue.empty<Text>();
  ///   Debug.print(Nat.toText(Queue.size(queue))); // prints `0`
  /// }
  /// ```
  ///
  /// Runtime: `O(1)`.
  /// Space: `O(1)`.
  public func empty<T>() : Queue<T> {
    { var front = null; var back = null; var size = 0 }
  };

  /// Creates a new queue with a single element.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.singleton<Nat>(123);
  ///   assert (Queue.size(queue) == 1);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func singleton<T>(element : T) : Queue<T> {
    let queue = empty<T>();
    pushBack(queue, element);
    queue
  };

  /// Removes all elements from the queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   Queue.clear(queue);
  ///   assert (Queue.isEmpty(queue));
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func clear<T>(queue : Queue<T>) {
    queue.front := null;
    queue.back := null;
    queue.size := 0
  };

  /// Creates a deep copy of the queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let original = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   let copy = Queue.clone(original);
  ///   Queue.clear(original);
  ///   assert (Queue.size(copy) == 3);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func clone<T>(queue : Queue<T>) : Queue<T> {
    let copy = empty<T>();
    for (element in values(queue)) {
      pushBack(copy, element)
    };
    copy
  };

  /// Returns the number of elements in the queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Text>(["A", "B", "C"].values());
  ///   assert (Queue.size(queue) == 3);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func size<T>(queue : Queue<T>) : Nat {
    queue.size
  };

  /// Returns `true` if the queue contains no elements.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.empty<Nat>();
  ///   assert (Queue.isEmpty(queue));
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func isEmpty<T>(queue : Queue<T>) : Bool {
    queue.size == 0
  };

  /// Checks if an element exists in the queue using the provided equality function.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  /// import Nat "mo:base/Nat";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.contains(queue, Nat.equal, 2));
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(1)
  /// `n` denotes the number of elements stored in the queue.
  public func contains<T>(queue : Queue<T>, equal : (T, T) -> Bool, element : T) : Bool {
    for (existing in values(queue)) {
      if (equal(existing, element)) {
        return true
      }
    };
    false
  };

  /// Returns the first element in the queue without removing it.
  /// Returns null if the queue is empty.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.peekFront(queue) == ?1);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func peekFront<T>(queue : Queue<T>) : ?T {
    switch (queue.front) {
      case null null;
      case (?node) ?node.value
    }
  };

  /// Returns the last element in the queue without removing it.
  /// Returns null if the queue is empty.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.peekBack(queue) == ?3);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func peekBack<T>(queue : Queue<T>) : ?T {
    switch (queue.back) {
      case null null;
      case (?node) ?node.value
    }
  };

  /// Adds an element to the front of the queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.empty<Nat>();
  ///   Queue.pushFront(queue, 1);
  ///   assert (Queue.peekFront(queue) == ?1);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func pushFront<T>(queue : Queue<T>, element : T) {
    let node : Node<T> = {
      value = element;
      var next = queue.front;
      var previous = null
    };
    switch (queue.front) {
      case null {};
      case (?first) first.previous := ?node
    };
    queue.front := ?node;
    switch (queue.back) {
      case null queue.back := ?node;
      case (?_) {}
    };
    queue.size += 1
  };

  /// Adds an element to the back of the queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.empty<Nat>();
  ///   Queue.pushBack(queue, 1);
  ///   assert (Queue.peekBack(queue) == ?1);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func pushBack<T>(queue : Queue<T>, element : T) {
    let node : Node<T> = {
      value = element;
      var next = null;
      var previous = queue.back
    };
    switch (queue.back) {
      case null {};
      case (?last) last.next := ?node
    };
    queue.back := ?node;
    switch (queue.front) {
      case null queue.front := ?node;
      case (?_) {}
    };
    queue.size += 1
  };

  /// Removes and returns the first element in the queue.
  /// Returns null if the queue is empty.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.popFront(queue) == ?1);
  ///   assert (Queue.size(queue) == 2);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func popFront<T>(queue : Queue<T>) : ?T {
    switch (queue.front) {
      case null null;
      case (?first) {
        queue.front := first.next;
        switch (queue.front) {
          case null { queue.back := null };
          case (?newFirst) { newFirst.previous := null }
        };
        queue.size -= 1;
        ?first.value
      }
    }
  };

  /// Removes and returns the last element in the queue.
  /// Returns null if the queue is empty.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.popBack(queue) == ?3);
  ///   assert (Queue.size(queue) == 2);
  /// }
  /// ```
  ///
  /// Runtime: O(1)
  /// Space: O(1)
  public func popBack<T>(queue : Queue<T>) : ?T {
    switch (queue.back) {
      case null null;
      case (?last) {
        queue.back := last.previous;
        switch (queue.back) {
          case null { queue.front := null };
          case (?newLast) { newLast.next := null }
        };
        queue.size -= 1;
        ?last.value
      }
    }
  };

  /// Creates a new queue from an iterator.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Text>(["A", "B", "C"].values());
  ///   assert (Queue.size(queue) == 3);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func fromIter<T>(iter : Iter.Iter<T>) : Queue<T> {
    let queue = empty<T>();
    for (element in iter) {
      pushBack(queue, element)
    };
    queue
  };

  /// Returns an iterator over the elements in the queue.
  /// Iterates from front to back.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  /// import Debug "mo:base/Debug";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Text>(["A", "B", "C"].values());
  ///   for (element in Queue.values(queue)) {
  ///     Debug.print(element);
  ///   }
  ///   // prints:
  ///   // `"A"`
  ///   // `"B"`
  ///   // `"C"`
  /// }
  /// ```
  ///
  /// Runtime: O(1) for iterator creation, O(n) for full iteration
  /// Space: O(1)
  public func values<T>(queue : Queue<T>) : Iter.Iter<T> {
    object {
      var current = queue.front;

      public func next() : ?T {
        switch (current) {
          case null null;
          case (?node) {
            current := node.next;
            ?node.value
          }
        }
      }
    }
  };

  /// Tests whether all elements in the queue satisfy the given predicate.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([2, 4, 6].values());
  ///   assert (Queue.all<Nat>(queue, func(x) { x % 2 == 0 }));
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(1)
  public func all<T>(queue : Queue<T>, predicate : T -> Bool) : Bool {
    for (element in values(queue)) {
      if (not predicate(element)) {
        return false
      }
    };
    true
  };

  /// Tests whether any element in the queue satisfies the given predicate.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.any<Nat>(queue, func (x) { x > 2 }));
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(1)
  /// `n` denotes the number of elements stored in the queue.
  public func any<T>(queue : Queue<T>, predicate : T -> Bool) : Bool {
    for (element in values(queue)) {
      if (predicate(element)) {
        return true
      }
    };
    false
  };

  /// Applies the given operation to all elements in the queue.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   var sum = 0;
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   Queue.forEach<Nat>(queue, func(x) { sum += x });
  ///   assert (sum == 6);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(1)
  /// `n` denotes the number of elements stored in the queue.
  public func forEach<T>(queue : Queue<T>, operation : T -> ()) {
    for (element in values(queue)) {
      operation(element)
    }
  };

  /// Creates a new queue by applying the given function to all elements.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   let doubled = Queue.map<Nat, Nat>(queue, func(x) { x * 2 });
  ///   assert (Queue.peekFront(doubled) == ?2);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func map<T, U>(queue : Queue<T>, project : T -> U) : Queue<U> {
    let result = empty<U>();
    for (element in values(queue)) {
      pushBack(result, project(element))
    };
    result
  };

  /// Creates a new queue containing only elements that satisfy the given predicate.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3, 4].values());
  ///   let evens = Queue.filter<Nat>(queue, func(x) { x % 2 == 0 });
  ///   assert (Queue.size(evens) == 2);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func filter<T>(queue : Queue<T>, criterion : T -> Bool) : Queue<T> {
    let result = empty<T>();
    for (element in values(queue)) {
      if (criterion(element)) {
        pushBack(result, element)
      }
    };
    result
  };

  /// Creates a new queue by applying the given function to all elements
  /// and keeping only the non-null results.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3, 4].values());
  ///   let evenDoubled = Queue.filterMap<Nat, Nat>(
  ///     queue,
  ///     func(x) {
  ///       if (x % 2 == 0) { ?(x * 2) } else  { null }
  ///     }
  ///   );
  ///   assert (Queue.size(evenDoubled) == 2);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func filterMap<T, U>(queue : Queue<T>, project : T -> ?U) : Queue<U> {
    let result = empty<U>();
    for (element in values(queue)) {
      switch (project(element)) {
        case null {};
        case (?newElement) pushBack(result, newElement)
      }
    };
    result
  };

  /// Compares two queues for equality using the provided equality function.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  /// import Nat "mo:base/Nat";
  ///
  /// persistent actor {
  ///   let queue1 = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   let queue2 = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.equal(queue1, queue2, Nat.equal));
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(1)
  /// `n` denotes the number of elements stored in the queue.
  public func equal<T>(queue1 : Queue<T>, queue2 : Queue<T>, equal : (T, T) -> Bool) : Bool {
    if (size(queue1) != size(queue2)) {
      return false
    };
    let iterator1 = values(queue1);
    let iterator2 = values(queue2);
    loop {
      let element1 = iterator1.next();
      let element2 = iterator2.next();
      switch (element1, element2) {
        case (null, null) {
          return true
        };
        case (?element1, ?element2) {
          if (not equal(element1, element2)) {
            return false
          }
        };
        case _ { return false }
      }
    }
  };

  /// Converts a queue to its string representation using the provided element formatter.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  /// import Nat "mo:base/Nat";
  ///
  /// persistent actor {
  ///   let queue = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.toText(queue, Nat.toText) == "Queue[1, 2, 3]");
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(n)
  /// `n` denotes the number of elements stored in the queue.
  public func toText<T>(queue : Queue<T>, format : T -> Text) : Text {
    var text = "Queue[";
    var sep = "";
    for (element in values(queue)) {
      text #= sep # format(element);
      sep := ", "
    };
    text #= "]";
    text
  };

  /// Compares two queues using the provided comparison function.
  /// Returns #less, #equal, or #greater.
  ///
  /// Example:
  /// ```motoko
  /// import Queue "mo:base/Queue";
  /// import Nat "mo:base/Nat";
  ///
  /// persistent actor {
  ///   let queue1 = Queue.fromIter<Nat>([1, 2].values());
  ///   let queue2 = Queue.fromIter<Nat>([1, 2, 3].values());
  ///   assert (Queue.compare(queue1, queue2, Nat.compare) == #less);
  /// }
  /// ```
  ///
  /// Runtime: O(n)
  /// Space: O(1)
  /// `n` denotes the number of elements stored in the queue.
  public func compare<T>(queue1 : Queue<T>, queue2 : Queue<T>, compareItem : (T, T) -> Order.Order) : Order.Order {
    let iterator1 = values(queue1);
    let iterator2 = values(queue2);
    loop {
      switch (iterator1.next(), iterator2.next()) {
        case (null, null) return #equal;
        case (null, _) return #less;
        case (_, null) return #greater;
        case (?element1, ?element2) {
          let comparison = compareItem(element1, element2);
          if (comparison != #equal) {
            return comparison
          }
        }
      }
    }
  }
}

---

(source_file
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (doc_comment)
  (import
    (var_pat
      (identifier))
    (text_literal))
  (import
    (var_pat
      (identifier))
    (text_literal))
  (import
    (var_pat
      (identifier))
    (text_literal))
  (import
    (var_pat
      (identifier))
    (text_literal))
  (obj_dec
    (obj_sort)
    (obj_body
      (dec_field
        (vis)
        (typ_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (path_typ
            (typ_path
              (identifier)
              (identifier)
              (type_identifier))
            (path_typ
              (typ_path
                (type_identifier))))))
      (dec_field
        (typ_dec
          (type_identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (path_typ
            (typ_path
              (identifier)
              (identifier)
              (type_identifier))
            (path_typ
              (typ_path
                (type_identifier))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (identifier)
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))
              (var_dec
                (var_pat
                  (identifier))
                (var_exp
                  (identifier)))
              (exp_dec
                (loop_exp
                  (block_exp
                    (exp_dec
                      (switch_exp
                        (par_exp
                          (call_exp_object
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier))
                            (par_exp)))
                        (case
                          (lit_pat
                            (null_literal))
                          (block_exp
                            (exp_dec
                              (return_exp
                                (var_exp
                                  (identifier))))))
                        (case
                          (tup_pat
                            (quest_pat
                              (var_pat
                                (identifier))))
                          (block_exp
                            (exp_dec
                              (assign_exp_object
                                (var_exp
                                  (identifier))
                                (call_exp_object
                                  (dot_exp_object
                                    (var_exp
                                      (identifier))
                                    (identifier))
                                  (par_exp
                                    (var_exp
                                      (identifier))
                                    (var_exp
                                      (identifier)))))))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (identifier)
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))
              (exp_dec
                (loop_exp
                  (block_exp
                    (exp_dec
                      (switch_exp
                        (par_exp
                          (call_exp_object
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier))
                            (par_exp)))
                        (case
                          (lit_pat
                            (null_literal))
                          (block_exp
                            (exp_dec
                              (return_exp
                                (var_exp
                                  (identifier))))))
                        (case
                          (tup_pat
                            (quest_pat
                              (var_pat
                                (identifier))))
                          (block_exp
                            (exp_dec
                              (call_exp_object
                                (var_exp
                                  (identifier))
                                (par_exp
                                  (var_exp
                                    (identifier))
                                  (var_exp
                                    (identifier))))))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat)
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (object_exp
                  (exp_field
                    (identifier)
                    (lit_exp
                      (null_literal)))
                  (exp_field
                    (identifier)
                    (lit_exp
                      (null_literal)))
                  (exp_field
                    (identifier)
                    (lit_exp
                      (int_literal)))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (exp_dec
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier))
                    (var_exp
                      (identifier)))))
              (exp_dec
                (var_exp
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (func_body
            (block_exp
              (exp_dec
                (assign_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (lit_exp
                    (null_literal))))
              (exp_dec
                (assign_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (lit_exp
                    (null_literal))))
              (exp_dec
                (assign_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (lit_exp
                    (int_literal))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier))))))))
              (exp_dec
                (var_exp
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (dot_exp_object
                  (var_exp
                    (identifier))
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (bin_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (rel_op)
                  (lit_exp
                    (int_literal))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (tup_typ
                    (typ_item
                      (path_typ
                        (typ_path
                          (type_identifier))))
                    (typ_item
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (if_exp
                        (par_exp
                          (call_exp_object
                            (var_exp
                              (identifier))
                            (par_exp
                              (var_exp
                                (identifier))
                              (var_exp
                                (identifier)))))
                        (block_exp
                          (exp_dec
                            (return_exp
                              (lit_exp
                                (bool_literal))))))))))
              (exp_dec
                (lit_exp
                  (bool_literal)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (quest_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (lit_exp
                      (null_literal)))
                  (case
                    (tup_pat
                      (quest_pat
                        (var_pat
                          (identifier))))
                    (quest_exp
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (quest_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (lit_exp
                      (null_literal)))
                  (case
                    (tup_pat
                      (quest_pat
                        (var_pat
                          (identifier))))
                    (quest_exp
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (func_body
            (block_exp
              (let_dec
                (annot_pat
                  (var_pat
                    (identifier))
                  (typ_annot
                    (path_typ
                      (typ_path
                        (type_identifier))
                      (path_typ
                        (typ_path
                          (type_identifier))))))
                (object_exp
                  (exp_field
                    (identifier)
                    (var_exp
                      (identifier)))
                  (exp_field
                    (identifier)
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (exp_field
                    (identifier)
                    (lit_exp
                      (null_literal)))))
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (block_exp))
                  (case
                    (tup_pat
                      (quest_pat
                        (var_pat
                          (identifier))))
                    (assign_exp_block
                      (dot_exp_block
                        (var_exp
                          (identifier))
                        (identifier))
                      (quest_exp
                        (var_exp
                          (identifier)))))))
              (exp_dec
                (assign_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (quest_exp
                    (var_exp
                      (identifier)))))
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (assign_exp_block
                      (dot_exp_block
                        (var_exp
                          (identifier))
                        (identifier))
                      (quest_exp
                        (var_exp
                          (identifier)))))
                  (case
                    (tup_pat
                      (quest_pat
                        (wild_pat)))
                    (block_exp))))
              (exp_dec
                (binassign_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (binassign_op)
                  (lit_exp
                    (int_literal))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))))))
          (func_body
            (block_exp
              (let_dec
                (annot_pat
                  (var_pat
                    (identifier))
                  (typ_annot
                    (path_typ
                      (typ_path
                        (type_identifier))
                      (path_typ
                        (typ_path
                          (type_identifier))))))
                (object_exp
                  (exp_field
                    (identifier)
                    (var_exp
                      (identifier)))
                  (exp_field
                    (identifier)
                    (lit_exp
                      (null_literal)))
                  (exp_field
                    (identifier)
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))))
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (block_exp))
                  (case
                    (tup_pat
                      (quest_pat
                        (var_pat
                          (identifier))))
                    (assign_exp_block
                      (dot_exp_block
                        (var_exp
                          (identifier))
                        (identifier))
                      (quest_exp
                        (var_exp
                          (identifier)))))))
              (exp_dec
                (assign_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (quest_exp
                    (var_exp
                      (identifier)))))
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (assign_exp_block
                      (dot_exp_block
                        (var_exp
                          (identifier))
                        (identifier))
                      (quest_exp
                        (var_exp
                          (identifier)))))
                  (case
                    (tup_pat
                      (quest_pat
                        (wild_pat)))
                    (block_exp))))
              (exp_dec
                (binassign_exp_object
                  (dot_exp_object
                    (var_exp
                      (identifier))
                    (identifier))
                  (binassign_op)
                  (lit_exp
                    (int_literal))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (quest_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (lit_exp
                      (null_literal)))
                  (case
                    (tup_pat
                      (quest_pat
                        (var_pat
                          (identifier))))
                    (block_exp
                      (exp_dec
                        (assign_exp_object
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))))
                      (exp_dec
                        (switch_exp
                          (par_exp
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier)))
                          (case
                            (lit_pat
                              (null_literal))
                            (block_exp
                              (exp_dec
                                (assign_exp_object
                                  (dot_exp_object
                                    (var_exp
                                      (identifier))
                                    (identifier))
                                  (lit_exp
                                    (null_literal))))))
                          (case
                            (tup_pat
                              (quest_pat
                                (var_pat
                                  (identifier))))
                            (block_exp
                              (exp_dec
                                (assign_exp_object
                                  (dot_exp_object
                                    (var_exp
                                      (identifier))
                                    (identifier))
                                  (lit_exp
                                    (null_literal))))))))
                      (exp_dec
                        (binassign_exp_object
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))
                          (binassign_op)
                          (lit_exp
                            (int_literal))))
                      (exp_dec
                        (quest_exp
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (quest_typ
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (exp_dec
                (switch_exp
                  (par_exp
                    (dot_exp_object
                      (var_exp
                        (identifier))
                      (identifier)))
                  (case
                    (lit_pat
                      (null_literal))
                    (lit_exp
                      (null_literal)))
                  (case
                    (tup_pat
                      (quest_pat
                        (var_pat
                          (identifier))))
                    (block_exp
                      (exp_dec
                        (assign_exp_object
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))))
                      (exp_dec
                        (switch_exp
                          (par_exp
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier)))
                          (case
                            (lit_pat
                              (null_literal))
                            (block_exp
                              (exp_dec
                                (assign_exp_object
                                  (dot_exp_object
                                    (var_exp
                                      (identifier))
                                    (identifier))
                                  (lit_exp
                                    (null_literal))))))
                          (case
                            (tup_pat
                              (quest_pat
                                (var_pat
                                  (identifier))))
                            (block_exp
                              (exp_dec
                                (assign_exp_object
                                  (dot_exp_object
                                    (var_exp
                                      (identifier))
                                    (identifier))
                                  (lit_exp
                                    (null_literal))))))))
                      (exp_dec
                        (binassign_exp_object
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))
                          (binassign_op)
                          (lit_exp
                            (int_literal))))
                      (exp_dec
                        (quest_exp
                          (dot_exp_object
                            (var_exp
                              (identifier))
                            (identifier))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (identifier)
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (var_exp
                    (identifier))
                  (block_exp
                    (exp_dec
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier))))))))
              (exp_dec
                (var_exp
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (identifier)
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (obj_dec
                (obj_sort)
                (obj_body
                  (dec_field
                    (var_dec
                      (var_pat
                        (identifier))
                      (dot_exp_object
                        (var_exp
                          (identifier))
                        (identifier))))
                  (dec_field
                    (vis)
                    (func_dec
                      (identifier)
                      (tup_pat)
                      (typ_annot
                        (quest_typ
                          (path_typ
                            (typ_path
                              (type_identifier)))))
                      (func_body
                        (block_exp
                          (exp_dec
                            (switch_exp
                              (par_exp
                                (var_exp
                                  (identifier)))
                              (case
                                (lit_pat
                                  (null_literal))
                                (lit_exp
                                  (null_literal)))
                              (case
                                (tup_pat
                                  (quest_pat
                                    (var_pat
                                      (identifier))))
                                (block_exp
                                  (exp_dec
                                    (assign_exp_object
                                      (var_exp
                                        (identifier))
                                      (dot_exp_object
                                        (var_exp
                                          (identifier))
                                        (identifier))))
                                  (exp_dec
                                    (quest_exp
                                      (dot_exp_object
                                        (var_exp
                                          (identifier))
                                        (identifier))))))))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (if_exp
                        (par_exp
                          (not_exp
                            (call_exp_object
                              (var_exp
                                (identifier))
                              (par_exp
                                (var_exp
                                  (identifier))))))
                        (block_exp
                          (exp_dec
                            (return_exp
                              (lit_exp
                                (bool_literal))))))))))
              (exp_dec
                (lit_exp
                  (bool_literal)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (if_exp
                        (par_exp
                          (call_exp_object
                            (var_exp
                              (identifier))
                            (par_exp
                              (var_exp
                                (identifier)))))
                        (block_exp
                          (exp_dec
                            (return_exp
                              (lit_exp
                                (bool_literal))))))))))
              (exp_dec
                (lit_exp
                  (bool_literal)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (tup_typ)))))
          (func_body
            (block_exp
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier))
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))
                          (call_exp_object
                            (var_exp
                              (identifier))
                            (par_exp
                              (var_exp
                                (identifier))))))))))
              (exp_dec
                (var_exp
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (if_exp
                        (par_exp
                          (call_exp_object
                            (var_exp
                              (identifier))
                            (par_exp
                              (var_exp
                                (identifier)))))
                        (block_exp
                          (exp_dec
                            (call_exp_object
                              (var_exp
                                (identifier))
                              (par_exp
                                (var_exp
                                  (identifier))
                                (var_exp
                                  (identifier)))))))))))
              (exp_dec
                (var_exp
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier))
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (quest_typ
                    (path_typ
                      (typ_path
                        (type_identifier))))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))
              (path_typ
                (typ_path
                  (type_identifier)))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (inst
                    (path_typ
                      (typ_path
                        (type_identifier))))
                  (par_exp)))
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (switch_exp
                        (par_exp
                          (call_exp_object
                            (var_exp
                              (identifier))
                            (par_exp
                              (var_exp
                                (identifier)))))
                        (case
                          (lit_pat
                            (null_literal))
                          (block_exp))
                        (case
                          (tup_pat
                            (quest_pat
                              (var_pat
                                (identifier))))
                          (call_exp_block
                            (var_exp
                              (identifier))
                            (par_exp
                              (var_exp
                                (identifier))
                              (var_exp
                                (identifier))))))))))
              (exp_dec
                (var_exp
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (tup_typ
                    (typ_item
                      (path_typ
                        (typ_path
                          (type_identifier))))
                    (typ_item
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (exp_dec
                (if_exp
                  (par_exp
                    (bin_exp_object
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))))
                      (rel_op)
                      (call_exp_object
                        (var_exp
                          (identifier))
                        (par_exp
                          (var_exp
                            (identifier))))))
                  (block_exp
                    (exp_dec
                      (return_exp
                        (lit_exp
                          (bool_literal)))))))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))
              (exp_dec
                (loop_exp
                  (block_exp
                    (let_dec
                      (var_pat
                        (identifier))
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp)))
                    (let_dec
                      (var_pat
                        (identifier))
                      (call_exp_object
                        (dot_exp_object
                          (var_exp
                            (identifier))
                          (identifier))
                        (par_exp)))
                    (exp_dec
                      (switch_exp
                        (par_exp
                          (var_exp
                            (identifier))
                          (var_exp
                            (identifier)))
                        (case
                          (tup_pat
                            (lit_pat
                              (null_literal))
                            (lit_pat
                              (null_literal)))
                          (block_exp
                            (exp_dec
                              (return_exp
                                (lit_exp
                                  (bool_literal))))))
                        (case
                          (tup_pat
                            (quest_pat
                              (var_pat
                                (identifier)))
                            (quest_pat
                              (var_pat
                                (identifier))))
                          (block_exp
                            (exp_dec
                              (if_exp
                                (par_exp
                                  (not_exp
                                    (call_exp_object
                                      (var_exp
                                        (identifier))
                                      (par_exp
                                        (var_exp
                                          (identifier))
                                        (var_exp
                                          (identifier))))))
                                (block_exp
                                  (exp_dec
                                    (return_exp
                                      (lit_exp
                                        (bool_literal)))))))))
                        (case
                          (wild_pat)
                          (block_exp
                            (exp_dec
                              (return_exp
                                (lit_exp
                                  (bool_literal)))))))))))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (path_typ
                    (typ_path
                      (type_identifier)))
                  (path_typ
                    (typ_path
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (type_identifier))))
          (func_body
            (block_exp
              (var_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (text_literal)))
              (var_dec
                (var_pat
                  (identifier))
                (lit_exp
                  (text_literal)))
              (exp_dec
                (for_exp
                  (var_pat
                    (identifier))
                  (call_exp_object
                    (var_exp
                      (identifier))
                    (par_exp
                      (var_exp
                        (identifier))))
                  (block_exp
                    (exp_dec
                      (binassign_exp_object
                        (var_exp
                          (identifier))
                        (binassign_op)
                        (bin_exp_object
                          (var_exp
                            (identifier))
                          (bin_op)
                          (call_exp_object
                            (var_exp
                              (identifier))
                            (par_exp
                              (var_exp
                                (identifier)))))))
                    (exp_dec
                      (assign_exp_object
                        (var_exp
                          (identifier))
                        (lit_exp
                          (text_literal)))))))
              (exp_dec
                (binassign_exp_object
                  (var_exp
                    (identifier))
                  (binassign_op)
                  (lit_exp
                    (text_literal))))
              (exp_dec
                (var_exp
                  (identifier)))))))
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (doc_comment)
      (dec_field
        (vis)
        (func_dec
          (identifier)
          (typ_params
            (typ_bind
              (type_identifier)))
          (tup_pat
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (path_typ
                  (typ_path
                    (type_identifier))
                  (path_typ
                    (typ_path
                      (type_identifier))))))
            (annot_pat
              (var_pat
                (identifier))
              (typ_annot
                (func_typ
                  (tup_typ
                    (typ_item
                      (path_typ
                        (typ_path
                          (type_identifier))))
                    (typ_item
                      (path_typ
                        (typ_path
                          (type_identifier)))))
                  (path_typ
                    (typ_path
                      (identifier)
                      (type_identifier)))))))
          (typ_annot
            (path_typ
              (typ_path
                (identifier)
                (type_identifier))))
          (func_body
            (block_exp
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))
              (let_dec
                (var_pat
                  (identifier))
                (call_exp_object
                  (var_exp
                    (identifier))
                  (par_exp
                    (var_exp
                      (identifier)))))
              (exp_dec
                (loop_exp
                  (block_exp
                    (exp_dec
                      (switch_exp
                        (par_exp
                          (call_exp_object
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier))
                            (par_exp))
                          (call_exp_object
                            (dot_exp_object
                              (var_exp
                                (identifier))
                              (identifier))
                            (par_exp)))
                        (case
                          (tup_pat
                            (lit_pat
                              (null_literal))
                            (lit_pat
                              (null_literal)))
                          (return_exp
                            (hash_exp
                              (identifier))))
                        (case
                          (tup_pat
                            (lit_pat
                              (null_literal))
                            (wild_pat))
                          (return_exp
                            (hash_exp
                              (identifier))))
                        (case
                          (tup_pat
                            (wild_pat)
                            (lit_pat
                              (null_literal)))
                          (return_exp
                            (hash_exp
                              (identifier))))
                        (case
                          (tup_pat
                            (quest_pat
                              (var_pat
                                (identifier)))
                            (quest_pat
                              (var_pat
                                (identifier))))
                          (block_exp
                            (let_dec
                              (var_pat
                                (identifier))
                              (call_exp_object
                                (var_exp
                                  (identifier))
                                (par_exp
                                  (var_exp
                                    (identifier))
                                  (var_exp
                                    (identifier)))))
                            (exp_dec
                              (if_exp
                                (par_exp
                                  (bin_exp_object
                                    (var_exp
                                      (identifier))
                                    (rel_op)
                                    (hash_exp
                                      (identifier))))
                                (block_exp
                                  (exp_dec
                                    (return_exp
                                      (var_exp
                                        (identifier)))))))))))))))))))))
