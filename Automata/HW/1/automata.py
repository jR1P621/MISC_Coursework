#
# Copyright 2020 by
#
# University of Alaska Anchorage, College of Engineering.
#
# All rights reserved.
#
# Contributors: Jon Rippe  and
#               Christoph Lauter
#
#
#


class DFA:
    """Deterministic Finite Automaton

       Either positional arguments or keyword arguments are supported,
       but not a mix of both.

       Positional arguments:

       DFA(regex) : get the DFA corresponding to the regex, which must
                    be a non-empty string

       DFA(M) : get a copy of the DFA M, renumbering the states as
                integers

       DFA(regex, Sigma) : get the DFA corresponding to the regex,
                           over the alphabet Sigma, which is a set of
                           1-character strings. The regex is a string,
                           which may be empty (yields DFA for empty
                           word)

       DFA(M, Sigma) : get a copy of the DFA M, possibly extending the alphabet to Sigma

       DFA(type, Q, Sigma, delta, q, F) : get the DFA corresponding to the 
                                          finite automaton M = (Q, Sigma, delta, q, F)

                                          type is a string, either "DFA" or "NFA"
                                          
                                          If type is "DFA", M is considered a deterministic
                                          finite automaton, i.e. delta(q, a) returns a single
                                          state and no epsilon-transitions are supported.

                                          If type is "NFA", M is considered a non-deterministic
                                          finite automaton, i.e. delta(q, a) returns a set of 
                                          states and epsilon-transitions are supported.

                                          Q is a set or frozenset of states (of any hashable Python type)
                                          
                                          Sigma is a set of 1-character strings
                                          
                                          delta is either a function taking a state and a 1-character
                                          string in argument (positional arguments in this order) and
                                          returning either a state or a frozenset of states (see above) 
                                          or a dictionary mapping pairs (q,a) of a state q and a 1-character
                                          string a to a state or to a frozenset of states (see above).

                                          delta must be defined on all possible combinations of states
                                          and symbols in the alphabet, i.e. the automaton must have a 
                                          transition with every symbol in the alphabet for every state, 
                                          possibly to a capture state.

                                          In the case when the type is "NFA", delta additionally accept
                                          the empty string '' instead of a character, which describes an
                                          epsilon-transition from the correspondent state to a (frozen) set
                                          of other states. Epsilon-transitions may be defined for some states
                                          and not for others.

                                          q is the start state, which must be in the set of states

                                          F is a frozenset, subset of the set of states, indicating the final 
                                          (accepting) states

    Keyword arguments:

    DFA(regex = r) is equivalent to DFA(r)
    
    DFA(regex = r, Sigma = S) is equivalent to DFA(r, S)

    DFA(DFA = M) is equivalent to DFA(M)

    DFA(DFA = M, Sigma = S) is equivalent to DFA(M, S)

    DFA(type = t, Q = Q, Sigma = S, delta = d, q = q, F = F) is equivalent to DFA(t, Q, S, d, q, F)
    

    """
    def __init__(self, *args, **kwargs):
        if (len(args) != 0) and (len(kwargs) != 0):
            raise Exception(
                "Combinations of positional and keyword arguments not allowed")
        if len(kwargs) > 0:
            if "regex" in kwargs:
                if not isinstance(kwargs["regex"], str):
                    raise Exception("Wrong type for keyword argument")
                if "Sigma" in kwargs:
                    if len(kwargs) > 2:
                        raise Exception("Too many keyword arguments")
                    M = DFA(kwargs["regex"], kwargs["Sigma"])
                else:
                    if len(kwargs) > 1:
                        raise Exception("Too many keyword arguments")
                    M = DFA(kwargs["regex"])
            elif "DFA" in kwargs:
                if not isinstance(kwargs["DFA"], DFA):
                    raise Exception("Wrong type for keyword argument")
                if "Sigma" in kwargs:
                    if len(kwargs) > 2:
                        raise Exception("Too many keyword arguments")
                    M = DFA(kwargs["DFA"], kwargs["Sigma"])
                else:
                    if len(kwargs) > 1:
                        raise Exception("Too many keyword arguments")
                    M = DFA(kwargs["DFA"])
            elif ("type"
                  in kwargs) and ("Q" in kwargs) and ("Sigma" in kwargs) and (
                      "delta" in kwargs) and ("q" in kwargs) and ("F"
                                                                  in kwargs):
                if len(kwargs) > 6:
                    raise Exception("Too many keyword arguments")
                M = DFA(kwargs["type"], kwargs["Q"], kwargs["Sigma"],
                        kwargs["delta"], kwargs["q"], kwargs["F"])
            else:
                raise Exception("Unsupported keyword arguments")
            self.__states = frozenset(M.__states)
            self.__alphabet = frozenset(M.__alphabet)
            self.__delta = M.__delta
            self.__start = M.__start
            self.__final = frozenset(M.__final)
            self.__check_consistance()
        else:
            if len(args) == 1:
                if isinstance(args[0], str):
                    if len(args[0]) > 0:
                        Sigma = {
                            a
                            for a in args[0] if not a in {'(', ')', '|', '*'}
                        }
                        M = DFA(args[0], Sigma)
                        self.__states = frozenset(M.__states)
                        self.__alphabet = frozenset(M.__alphabet)
                        self.__delta = M.__delta
                        self.__start = M.__start
                        self.__final = frozenset(M.__final)
                        self.__check_consistance()
                    else:
                        raise Exception(
                            "Empty regular expressions supported only when alphabet is given"
                        )
                elif isinstance(args[0], DFA):
                    M = args[0]
                    i = 0
                    Q = set()
                    mapping = dict()
                    for q in M.__states:
                        Q.add(i)
                        mapping[q] = i
                        i = i + 1
                    Q = frozenset(Q)
                    q0 = mapping[M.__start]
                    F = set()
                    for q in M.__final:
                        F.add(mapping[q])
                    F = frozenset(F)
                    delta = dict()
                    for q in M.__states:
                        for a in M.__alphabet:
                            delta[(mapping[q], a)] = mapping[M.__delta[(q, a)]]
                    self.__states = Q
                    self.__alphabet = frozenset(M.__alphabet)
                    self.__delta = delta
                    self.__start = q0
                    self.__final = F
                    self.__check_consistance()
                else:
                    raise Exception(
                        "Unimplemented case: argument must be a string or another DFA"
                    )
            elif (len(args) == 2):
                if isinstance(args[0], str):
                    if len(args[0]) == 0:
                        self.__states = frozenset({1, 2})
                        self.__alphabet = self.__check_alphabet(
                            frozenset(args[1]))
                        self.__delta = dict()
                        for a in self.__alphabet:
                            self.__delta[(1, a)] = 2
                            self.__delta[(2, a)] = 2
                        self.__start = 1
                        self.__final = frozenset({1})
                        self.__check_consistance()
                    elif len(args[0]) == 1:
                        if not (args[0][0] in frozenset(args[1])):
                            raise Exception(
                                "Character in regular expression not in alphabet"
                            )
                        if args[0][0] in {'(', '|', ')', '*'}:
                            raise Exception("Malformed regular expression")
                        self.__states = frozenset({1, 2, 3})
                        self.__alphabet = self.__check_alphabet(
                            frozenset(args[1]))
                        self.__delta = dict()
                        self.__delta[(1, args[0][0])] = 2
                        for a in self.__alphabet:
                            if not a == args[0][0]:
                                self.__delta[(1, a)] = 3
                            self.__delta[(2, a)] = 3
                            self.__delta[(3, a)] = 3
                        self.__start = 1
                        self.__final = frozenset({2})
                        self.__check_consistance()
                    else:
                        M = self.__regular_expression_to_dfa(
                            args[0], self.__check_alphabet(frozenset(args[1])))
                        self.__states = frozenset(M.__states)
                        self.__alphabet = frozenset(M.__alphabet)
                        self.__delta = M.__delta
                        self.__start = M.__start
                        self.__final = frozenset(M.__final)
                        self.__check_consistance()
                elif isinstance(args[0], DFA):
                    M = args[0].__extend_alphabet(
                        self.__check_alphabet(args[1]))
                    self.__states = frozenset(M.__states)
                    self.__alphabet = frozenset(M.__alphabet)
                    self.__delta = M.__delta
                    self.__start = M.__start
                    self.__final = frozenset(M.__final)
                    self.__check_consistance()
                else:
                    raise Exception(
                        "Unimplemented case: argument not a string nor another DFA"
                    )
            elif len(args) == 6:
                if args[0] == "DFA":
                    self.__states = frozenset(args[1])
                    self.__alphabet = self.__check_alphabet(frozenset(args[2]))
                    if isinstance(args[3], dict):
                        self.__delta = args[3]
                    else:
                        self.__delta = dict()
                        for q in self.__states:
                            for a in self.__alphabet:
                                self.__delta[(q, a)] = args[3](q, a)
                    self.__start = args[4]
                    self.__final = frozenset(args[5])
                    self.__check_consistance()
                elif args[0] == "NFA":
                    if isinstance(args[3], dict):
                        NFA_D = args[3]
                    else:
                        NFA_D = dict()
                        for q in args[1]:
                            for a in args[2]:
                                NFA_D[(q, a)] = args[3](q, a)
                            if (not args[3](q, '') == None) and (not frozenset(
                                    args[3](q, '')) == frozenset()):
                                NFA_D[(q, '')] = args[3](q, '')
                    NFA_Q = args[1]
                    NFA_start = args[4]
                    NFA_Sigma = self.__check_alphabet(frozenset(args[2]))
                    NFA_delta, NFA_F = self.__remove_epsilon(
                        NFA_Q, NFA_Sigma, NFA_D, args[5])
                    if self.__nfa_delta_without_epsilon_is_deterministic(
                            NFA_delta, NFA_Q, NFA_Sigma):
                        self.__states = NFA_Q
                        self.__alphabet = NFA_Sigma
                        self.__start = NFA_start
                        self.__delta = {(q, a): next(iter(NFA_delta[(q, a)]))
                                        for q in NFA_Q for a in NFA_Sigma}
                        self.__final = NFA_F
                        self.__check_consistance()
                    else:
                        self.__alphabet = NFA_Sigma
                        self.__start = frozenset({NFA_start})
                        delta = dict()
                        T = dict()
                        stable = False
                        while not stable:
                            stable = True
                            for tt in T:
                                T[tt] = 0
                            T[self.__start] = 1
                            for a in self.__alphabet:
                                H = {tt for tt in T}
                                while len(H) > 0:
                                    tt = H.pop()
                                    s = set()
                                    for q in tt:
                                        for r in NFA_delta[(q, a)]:
                                            s.add(r)
                                    fs = frozenset(s)
                                    delta[(tt, a)] = fs
                                    if fs in T:
                                        T[fs] = T[fs] + 1
                                    else:
                                        T[fs] = 1
                                        H.add(fs)
                                        stable = False

                        Q = {q for q in T if T[q] > 0}
                        F = {q for q in Q if len(q.intersection(NFA_F)) != 0}
                        self.__states = frozenset(Q)
                        self.__delta = delta
                        self.__final = frozenset(F)
                        self.__check_consistance()
                else:
                    raise Exception(
                        "Unimplemented case: first argument must be 'DFA' or 'NFA'"
                    )
            else:
                raise Exception(
                    "Unimplemented case: too many or too few arguments")

    def __check_consistance(self):
        """Internal method: checks whether the automaton is consistant"""
        if not (self.__start in self.__states):
            raise Exception("Start state not in set of states")
        for q in self.__final:
            if not (q in self.__states):
                raise Exception("Final states not subset of set of states")
        for a in self.__alphabet:
            if not isinstance(a, str):
                raise Exception(
                    "Alphabet must be formed of 1-character strings")
            if len(a) != 1:
                raise Exception(
                    "Alphabet must be formed of 1-character strings")
            if a[0] in {'(', ')', '|', '*'}:
                raise Exception(
                    "Alphabet cannot include characters '(', ')', '|' or '*'")
        for q in self.__states:
            for a in self.__alphabet:
                if not ((q, a) in self.__delta):
                    raise Exception(
                        "Transition function must be complete, i.e. defined for all pairs (q,a)"
                    )

    def __check_alphabet(self, Sigma):
        """Internal method: check that all elements of the alphabet are 1-character strings"""
        for a in Sigma:
            if not isinstance(a, str):
                raise Exception(
                    "Alphabet must be formed of 1-character strings")
            if len(a) != 1:
                raise Exception(
                    "Alphabet must be formed of 1-character strings")
            if a[0] in {'(', ')', '|', '*'}:
                raise Exception(
                    "Alphabet cannot include characters '(', ')', '|' or '*'")
        return Sigma

    def __nfa_delta_without_epsilon_is_deterministic(self, delta, Q, Sigma):
        """Internal method: checks if a NFA without epsilon-transitions
           happens to be deterministic
        """
        for q in Q:
            for a in Sigma:
                if len(delta[(q, a)]) != 1:
                    return False
        return True

    def __remove_epsilon(self, Q, Sigma, delta, F):
        """Internal method: removes epsilon-transitions on delta for an
           automaton (Q, Sigma, delta, <some start>, F)
        """
        for q in Q:
            if (q, '') in delta:
                if not frozenset(delta[(q, '')]) == frozenset():
                    from_state = q
                    to_state = next(iter(delta[(q, '')]))
                    other_to_states = frozenset(
                        {q
                         for q in delta[(q, '')] if not q == to_state})
                    deltaprime = dict()
                    for q in Q:
                        if q == from_state:
                            if from_state == to_state:
                                if not other_to_states == frozenset():
                                    deltaprime[(q, '')] = other_to_states
                                for a in Sigma:
                                    deltaprime[(q, a)] = delta[(q, a)]
                            else:
                                if not other_to_states == frozenset():
                                    if (to_state, '') in delta:
                                        T = other_to_states.union(
                                            delta[(to_state, '')])
                                        deltaprime[(q, '')] = frozenset({
                                            q
                                            for q in T if not q == to_state
                                        })
                                    else:
                                        deltaprime[(q, '')] = other_to_states
                                else:
                                    if (to_state, '') in delta:
                                        T = delta[(to_state, '')]
                                        deltaprime[(q, '')] = frozenset({
                                            q
                                            for q in T if not q == to_state
                                        })
                                for a in Sigma:
                                    deltaprime[(q, a)] = delta[(q, a)].union(
                                        delta[(to_state, a)])
                        else:
                            if (q, '') in delta:
                                deltaprime[(q, '')] = delta[(q, '')]
                            for a in Sigma:
                                deltaprime[(q, a)] = delta[(q, a)]
                    if (not from_state in F) and (to_state in F):
                        T = {q for q in F}
                        T.add(from_state)
                        Fprime = frozenset(T)
                    else:
                        Fprime = F
                    return self.__remove_epsilon(Q, Sigma, deltaprime, Fprime)
        return (delta, F)

    def __regular_expression_to_dfa(self, expr, Sigma):
        """Internal method: parses the regex string expr (which must be over
           the alphabet Sigma) and creates the corresponding DFA
        """
        def regular_expression_to_dfa_helper(expr, Sigma, l, r):
            """Internal helper method for the parser: does the work"""
            def find_first_matching_close_parenthesis(expr, l, r):
                """Internal helper method for the parser: finds matching close parenthesis"""
                if (r <= l):
                    return -1
                if (expr[l] != '('):
                    return -1
                lev = 0
                for i in range(l, r):
                    if expr[i] == '(':
                        lev = lev + 1
                    elif expr[i] == ')':
                        lev = lev - 1
                        if lev == 0:
                            return i
                return -1

            def expr_is_trivial_concatenation(expr, l, r):
                """Internal helper method for the parser: checks if regexp string expr
                   happens to be a trivial concatenation of letters
                """
                for i in range(l, r):
                    if expr[i] in {'(', ')', '|', '*'}:
                        return False
                return True

            # Parser code starts here
            if r < l:
                raise Exception("Malformed expression")
            elif l == r:
                return DFA('', Sigma)
            elif l == r - 1:
                if expr[l] in {'(', ')', '|', '*'}:
                    raise Exception("Malformed expression")
                return DFA(expr[l], Sigma)
            else:
                if expr_is_trivial_concatenation(expr, l, r):
                    subexpr = expr[l:r]
                    Q = frozenset({i for i in range(0, len(subexpr) + 2)})
                    final = len(subexpr)
                    catch = final + 1
                    q0 = 0
                    F = frozenset({final})
                    delta = dict()
                    for i in range(0, len(subexpr)):
                        c = subexpr[i]
                        delta[(i, c)] = i + 1
                        for a in Sigma:
                            if not a == c:
                                delta[(i, a)] = catch
                    for a in Sigma:
                        delta[(catch, a)] = catch
                        delta[(final, a)] = catch
                    return DFA("DFA", Q, Sigma, delta, q0, F)

                if expr[l] == '(':
                    m = find_first_matching_close_parenthesis(expr, l, r)
                    if m < l:
                        raise Exception(
                            "Could not find matching close parenthesis")
                    if m == r - 1:
                        return regular_expression_to_dfa_helper(
                            expr, Sigma, l + 1, r - 1)
                    else:
                        if expr[m + 1] == '|':
                            left = regular_expression_to_dfa_helper(
                                expr, Sigma, l, m + 1)
                            right = regular_expression_to_dfa_helper(
                                expr, Sigma, m + 2, r)
                            return left.union(right)
                        elif expr[m + 1] == '*':
                            i = m + 1
                            while (i < r) and (expr[i] == '*'):
                                i = i + 1
                            if i == r:
                                left = regular_expression_to_dfa_helper(
                                    expr, Sigma, l, r - 1)
                                return left.star()
                            else:
                                if expr[i] == '|':
                                    left = regular_expression_to_dfa_helper(
                                        expr, Sigma, l, i)
                                    right = regular_expression_to_dfa_helper(
                                        expr, Sigma, i + 1, r)
                                    return left.union(right)
                                else:
                                    left = regular_expression_to_dfa_helper(
                                        expr, Sigma, l, i)
                                    right = regular_expression_to_dfa_helper(
                                        expr, Sigma, i, r)
                                    return left.concat(right)
                        else:
                            left = regular_expression_to_dfa_helper(
                                expr, Sigma, l, m + 1)
                            right = regular_expression_to_dfa_helper(
                                expr, Sigma, m + 1, r)
                            return left.concat(right)
                else:
                    if expr[l] in {'|', '*'}:
                        raise Exception("Malformed expression")
                    if expr[l + 1] == '|':
                        left = regular_expression_to_dfa_helper(
                            expr, Sigma, l, l + 1)
                        right = regular_expression_to_dfa_helper(
                            expr, Sigma, l + 2, r)
                        return left.union(right)
                    elif expr[l + 1] == '*':
                        i = l + 1
                        while (i < r) and (expr[i] == '*'):
                            i = i + 1
                        if i == r:
                            left = regular_expression_to_dfa_helper(
                                expr, Sigma, l, r - 1)
                            return left.star()
                        else:
                            if expr[i] == '|':
                                left = regular_expression_to_dfa_helper(
                                    expr, Sigma, l, i)
                                right = regular_expression_to_dfa_helper(
                                    expr, Sigma, i + 1, r)
                                return left.union(right)
                            else:
                                left = regular_expression_to_dfa_helper(
                                    expr, Sigma, l, i)
                                right = regular_expression_to_dfa_helper(
                                    expr, Sigma, i, r)
                                return left.concat(right)
                    else:
                        i = l + 1
                        while (i < r) and (not (expr[i] in {'|', '('})):
                            i = i + 1
                        if i == r:
                            j = r - 1
                            while (j > l) and (expr[j] == '*'):
                                j = j - 1
                            left = regular_expression_to_dfa_helper(
                                expr, Sigma, l, j)
                            right = regular_expression_to_dfa_helper(
                                expr, Sigma, j, r)
                            return left.concat(right)
                        else:
                            if expr[i] == '|':
                                left = regular_expression_to_dfa_helper(
                                    expr, Sigma, l, i)
                                right = regular_expression_to_dfa_helper(
                                    expr, Sigma, i + 1, r)
                                return left.union(right)
                            else:
                                left = regular_expression_to_dfa_helper(
                                    expr, Sigma, l, i)
                                right = regular_expression_to_dfa_helper(
                                    expr, Sigma, i, r)
                                return left.concat(right)

        return DFA(regular_expression_to_dfa_helper(expr, Sigma, 0, len(expr)))

    def __extend_alphabet(self, Sigma):
        """Internal method: returns a DFA equivalent of self with the extended alphabet Sigma"""
        NSigma = frozenset(frozenset(Sigma).union(frozenset(self.__alphabet)))
        AddedSigma = frozenset({a for a in NSigma if not a in self.__alphabet})
        if AddedSigma == frozenset():
            return self
        Q = {(1, q) for q in self.__states}
        Q.add((2, 0))
        Q = frozenset(Q)
        F = {(1, q) for q in self.__final}
        q0 = (1, self.__start)
        delta = dict()
        for q in self.__states:
            for a in self.__alphabet:
                delta[((1, q), a)] = (1, self.__delta[(q, a)])
            for a in AddedSigma:
                delta[((1, q), a)] = (2, 0)
        for a in NSigma:
            delta[((2, 0), a)] = (2, 0)
        return DFA("DFA", Q, NSigma, delta, q0, F)

    def get_Q(self):
        """Returns a set of objects, representing the states of the DFA"""
        return {q for q in self.__states}

    def get_Sigma(self):
        """Returns a set of 1-character strings, representing the alphabet of the DFA"""
        return {a for a in self.__alphabet}

    def get_delta_as_dictionary(self):
        """Returns a dictionnary, representing the transition function of the
           DFA. The dictionnary maps a pair (q,a) of a state and a
           symbol in the alphabet to the next state.

        """
        return self.__delta

    def get_q(self):
        """Returns an object, representing the start state of the DFA"""
        return self.__start

    def get_F(self):
        """Returns a set of objects, representing the final states of the DFA"""
        return {q for q in self.__final}

    def get_delta(self):
        """Returns the transition function of the DFA. The returned function
           takes a state q and a symbol in the alphabet in argument
           (as positional arguments in this order) and returns the
           state the automaton transitions into.
        """
        d = dict(self.__delta)
        S = frozenset(self.__alphabet)
        Q = frozenset(self.__states)

        def aux(q, a, d, S, Q):
            """Internal auxilliary function"""
            if not isinstance(a, str):
                raise Exception("Given symbol must be 1-character string")
            if len(a) != 1:
                raise Exception("Given symbol must be 1-character string")
            if not (a in S):
                raise Exception("Given symbol must be in alphabet")
            if not (q in Q):
                raise Exception("Given state must be state of automaton")
            if not ((q, a) in d):
                raise Exception("Given symbol must be in alphabet")
            return d[(q, a)]

        return (lambda q, a: aux(q, a, d, S, Q))

    def get_extended_delta(self):
        """Returns the extended transition function of the DFA. The returned
           function takes a state q and a string formed by symbols in
           the alphabet in argument (as positional arguments in this
           order) and returns the state the automaton transitions
           into. The string may be empty, in which case the state in
           argument is returned.
        """
        d = self.get_delta()
        Q = frozenset(self.__states)

        def aux(q, w, delta, Q):
            """Internal auxilliary function"""
            if not isinstance(w, str):
                raise Exception("Given word must be a string")
            if w == "":
                if not (q in Q):
                    raise Exception("Given state must be state of automaton")
                return q
            else:
                a = w[0]
                v = w[1:]
                return aux(delta(q, a), v, delta, Q)

        return (lambda q, w: aux(q, w, d, Q))

    def recognize(self, w):
        """Given a string, returns a boolean indicating whether or not the DFA accepts the string."""
        if not isinstance(w, str):
            raise Exception("Given word must be a string")
        q = self.__start
        for a in w:
            if not a in self.__alphabet:
                return False
            q = self.__delta[(q, a)]
        return q in self.__final

    def __convert_to_nfa(self):
        """Internal method: converts the DFA to a 5-tuple representing a non-deterministic finite automaton"""
        Q = frozenset({frozenset({q}) for q in self.__states})
        Sigma = self.__alphabet
        delta = {(frozenset({q}), a):
                 frozenset({frozenset({self.__delta[(q, a)]})})
                 for q in self.__states for a in self.__alphabet}
        q0 = frozenset({self.__start})
        F = frozenset({frozenset({q}) for q in self.__final})
        return (Q, Sigma, delta, q0, F)

    def complement(self):  #students
        """Returns the DFA for the complement language of the language accepted by the DFA"""
        (QA, SigmaA, deltaA, q0A, FA) = self.__convert_to_nfa()
        (Q, Sigma, delta, q0, F) = (QA, SigmaA, deltaA, q0A, set())

        # The DFA should be identical except F = F'
        for q in QA:
            if q not in FA:
                F.add(q)
        F = frozenset(F)

        return DFA("NFA", Q, Sigma, delta, q0, F)
        raise Exception("Unimplemented. Job to be done by UAA students.")

    def union(self, other):  #students
        """Returns the DFA for the union language of the languages accepted by the DFA and the DFA given in argument"""
        if not self.__alphabet == other.__alphabet:
            combinedSigma = frozenset(self.__alphabet.union(other.__alphabet))
            M = DFA(self, combinedSigma)
            N = DFA(other, combinedSigma)
            return M.union(N)
        (QA, SigmaA, deltaA, q0A, FA) = self.__convert_to_nfa()
        (QB, SigmaB, deltaB, q0B, FB) = other.__convert_to_nfa()

        Sigma = SigmaA

        # Q = {q0} U QA U QB
        # q0 = set of start states
        Q = set()
        q0 = frozenset({(1, q0A), (2, q0B)})
        Q.add(q0)
        for q in QA:
            Q.add((1, q))
        for q in QB:
            Q.add((2, q))
        Q = frozenset(Q)

        # F = FA U FB
        F = set()
        for q in FA:
            F.add((1, q))
        for q in FB:
            F.add((2, q))
        F = frozenset(F)

        delta = dict()
        for q in QA:
            for a in Sigma:
                delta[((1, q), a)] = frozenset({(1, r)
                                                for r in deltaA[(q, a)]})
        for q in QB:
            for a in Sigma:
                delta[((2, q), a)] = frozenset({(2, r)
                                                for r in deltaB[(q, a)]})

        delta[(q0, '')] = q0

        for a in Sigma:
            delta[(q0, a)] = frozenset({})

        return DFA("NFA", Q, Sigma, delta, q0, F)
        raise Exception("Unimplemented. Job to be done by UAA students.")

    def intersection(self, other):  #students
        """Returns the DFA for the intersection language of the languages accepted by the DFA and the DFA given in argument."""
        if not self.__alphabet == other.__alphabet:
            combinedSigma = frozenset(self.__alphabet.union(other.__alphabet))
            M = DFA(self, combinedSigma)
            N = DFA(other, combinedSigma)
            return M.intersection(N)
        # Demorgan's Law: (A * B) = (A' + B')'
        # Create A' & B'
        M = self.complement()
        N = other.complement()

        # Get (A' + B')'
        (Q, Sigma, delta, q0,
         F) = M.union(N).complement()._DFA__convert_to_nfa()

        return DFA("NFA", Q, Sigma, delta, q0, F)
        raise Exception("Unimplemented. Job to be done by UAA students.")

    def concat(self, other):
        """Returns the DFA for the concatenation language of the languages accepted by the DFA and the DFA given in argument"""
        if not self.__alphabet == other.__alphabet:
            combinedSigma = frozenset(self.__alphabet.union(other.__alphabet))
            M = DFA(self, combinedSigma)
            N = DFA(other, combinedSigma)
            return M.concat(N)
        (QA, SigmaA, deltaA, q0A, FA) = self.__convert_to_nfa()
        (QB, SigmaB, deltaB, q0B, FB) = other.__convert_to_nfa()
        Sigma = SigmaA
        Q = set()
        for q in QA:
            Q.add((1, q))
        for q in QB:
            Q.add((2, q))
        Q = frozenset(Q)
        q0 = (1, q0A)
        F = set()
        for q in FB:
            F.add((2, q))
        F = frozenset(F)
        delta = dict()
        for q in QA:
            for a in SigmaA:
                delta[((1, q), a)] = frozenset({(1, r)
                                                for r in deltaA[(q, a)]})
        for q in QB:
            for a in SigmaB:
                delta[((2, q), a)] = frozenset({(2, r)
                                                for r in deltaB[(q, a)]})
        for q in FA:
            delta[((1, q), '')] = frozenset({(2, q0B)})
        return DFA("NFA", Q, Sigma, delta, q0, F)

    def star(self):  #students
        """Returns the DFA for the star language of the language accepted by the DFA"""
        (QA, SigmaA, deltaA, q0A, FA) = self.__convert_to_nfa()
        Sigma = SigmaA

        # Q = {q0} U QA
        # q0 = set of start states
        Q = set()
        q0 = frozenset({q0A})
        Q.add(q0)
        for q in QA:
            Q.add(q)
        Q = frozenset(Q)

        # F = {q0} U FA
        F = set()
        F.add(q0)
        for q in FA:
            F.add(q)
        F = frozenset(F)

        delta = dict()
        for q in QA:
            for a in SigmaA:
                delta[(q, a)] = frozenset({r for r in deltaA[(q, a)]})
        for q in FA:
            delta[(q, '')] = q0
        delta[(q0, '')] = q0
        for a in Sigma:
            delta[(q0, a)] = frozenset({})

        return DFA("NFA", Q, Sigma, delta, q0, F)
        raise Exception("Unimplemented. Job to be done by UAA students.")
