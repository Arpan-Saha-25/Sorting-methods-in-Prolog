# predicate(atoms,atoms)
likes(john, pizza).
likes(mary, pasta).

loves(romeo, juliet).
loves(juliet, romeo).

# if condition in PL
# Basically it is a RULE.
loves(juliet, romeo) :- loves(romeo, juliet).
