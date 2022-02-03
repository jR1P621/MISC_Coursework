-- lexit.lua
-- Jon Rippe & Glenn G. Chappell
-- Based on Dr. Chappell's lexer.lua module
--
-- CSCE A331
-- HW3
--
-- Usage:
--
--    program = "print a+b;"  -- program to lex
--    for lexstr, cat in lexer.lex(program) do
--        -- lexstr is the string form of a lexeme.
--        -- cat is a number representing the lexeme category.
--        -- It can be used as an index for array lexer.catnames.
--    end


-- *********************************************************************
-- Module Table Initialization
-- *********************************************************************


local lexit = {}  -- Our module; members are added below


-- *********************************************************************
-- Public Constants
-- *********************************************************************


-- Numeric constants representing lexeme categories
lexit.KEY    = 1    -- Keyword
lexit.ID     = 2    -- Identifier
lexit.NUMLIT = 3    -- NumericLiteral
lexit.STRLIT = 4    -- StringLiteral
lexit.OP     = 5    -- Operator
lexit.PUNCT  = 6    -- Puntuation
lexit.MAL    = 7    -- Malformed


-- catnames
-- Array of names of lexeme categories.
-- Human-readable strings. Indices are above numeric constants.
lexit.catnames = {
    "Keyword",
    "Identifier",
    "NumericLiteral",
    "StringLiteral",
    "Operator",
    "Punctuation",
    "Malformed"
}


-- *********************************************************************
-- Kind-of-Character Functions
-- *********************************************************************

-- All functions return false when given a string whose length is not
-- exactly 1.


-- isLetter
-- Returns true if string c is a letter character, false otherwise.
local function isLetter(c)
    if c:len() ~= 1 then
        return false
    elseif c >= "A" and c <= "Z" then
        return true
    elseif c >= "a" and c <= "z" then
        return true
    else
        return false
    end
end


-- isDigit
-- Returns true if string c is a digit character, false otherwise.
local function isDigit(c)
    if c:len() ~= 1 then
        return false
    elseif c >= "0" and c <= "9" then
        return true
    else
        return false
    end
end


-- isWhitespace
-- Returns true if string c is a whitespace character, false otherwise.
local function isWhitespace(c)
    if c:len() ~= 1 then
        return false
    elseif c == " " or c == "\t" or c == "\n" or c == "\r"
      or c == "\f" or c == "\v" then
        return true
    else
        return false
    end
end


-- isPrintableASCII
-- Returns true if string c is a printable ASCII character (codes 32 " "
-- through 126 "~"), false otherwise.
local function isPrintableASCII(c)
    if c:len() ~= 1 then
        return false
    elseif c >= " " and c <= "~" then
        return true
    else
        return false
    end
end


-- isIllegal
-- Returns true if string c is an illegal character, false otherwise.
local function isIllegal(c)
    if c:len() ~= 1 then
        return false
    elseif isWhitespace(c) then
        return false
    elseif isPrintableASCII(c) then
        return false
    else
        return true
    end
end


-- *********************************************************************
-- The Lexer
-- *********************************************************************


-- lex
-- Our lexer
-- Intended for use in a for-in loop:
--     for lexstr, cat in lexer.lex(program) do
-- Here, lexstr is the string form of a lexeme, and cat is a number
-- representing a lexeme category. (See Public Constants.)
function lexit.lex(program)
    -- ***** Variables (like class data members) *****

    local pos       -- Index of next character in program
                    -- INVARIANT: when getLexeme is called, pos is
                    --  EITHER the index of the first character of the
                    --  next lexeme OR program:len()+1
    local state     -- Current state for our state machine
    local ch        -- Current character
    local lexstr    -- The lexeme, so far
    local category  -- Category of lexeme, set when state set to DONE
    local handlers  -- Dispatch table; value created later
    local keywords = {"and", "char", "cr", "def", "dq",
                        "elseif", "else", "false", "for",
                        "if", "not", "or", "readnum",
                        "return", "true", "write"}

    -- ***** States *****

    local DONE   = 0
    local START  = 1
    local LETTER = 2
    local DIGIT  = 3
    local DIGEXP = 4
    local STRING = 5
    local OPEREQ = 6
    local BANG   = 7

    -- ***** Character-Related Utility Functions *****

    -- getChar
    -- Return the character at index pos+n in program. Return
    -- value is a single-character string, or the empty string if pos+n
    -- is past the end.
    local function getChar(n)
        return program:sub(pos+n, pos+n)
    end

    -- drop1
    -- Move pos to the next character.
    local function drop1()
        pos = pos+1
    end

    -- add1
    -- Add the current character to the lexeme, moving pos to the next
    -- character.
    local function add1()
        lexstr = lexstr .. getChar(0)
        drop1()
    end

    -- skipWhitespace
    -- Skip whitespace and comments, moving pos to the beginning of
    -- the next lexeme, or to program:len()+1.
    local function skipWhitespace()
        while true do
            -- Skip whitespace characters
            while isWhitespace(getChar(0)) do
                drop1()
            end

            -- Done if no comment
            if getChar(0) ~= "#" then
                break
            end

            -- Skip comment
            while true do
                drop1()  -- Drop comment character
                if getChar(0) == "\n" then
                    break
                elseif getChar(0) == "" then  -- End of input?
                    return
                end
            end
        end
    end


    -- ***** Lexeme-Related Utility Functions *****
    -- isKeyword
    -- Returns true if passed string is a keyword
    local function isKeyword(s)
        for i, val in ipairs(keywords) do
            if val == s then
                return true
            end
        end
        return false
    end


    -- ***** State-Handler Functions *****

    -- A function with a name like handle_XYZ is the handler function
    -- for state XYZ

    -- State DONE: lexeme is done; this handler should not be called.
    local function handle_DONE()
        error("'DONE' state should not be handled\n")
    end

    -- State START: no character read yet.
    local function handle_START()
        if isIllegal(ch) then
            add1()
            state = DONE
            category = lexit.MAL
        elseif isLetter(ch) or ch == "_" then
            add1()
            state = LETTER
        elseif isDigit(ch) then
            add1()
            state = DIGIT
        elseif ch == "\"" then
            add1()
            state = STRING
        elseif ch == "=" or ch == "<" or ch == ">" then
            add1()
            state = OPEREQ
        elseif ch == "!" then
            add1()
            state = BANG
        elseif ch == "+" or ch == "-" or ch == "*"
                or ch == "/" or ch == "%"
                or ch == "[" or ch == "]" then
            add1()
            state = DONE
            category = lexit.OP
        else
            add1()
            state = DONE
            category = lexit.PUNCT
        end
    end

    -- State LETTER: we are in an ID.
    local function handle_LETTER()
        if isLetter(ch) or ch == "_" or isDigit(ch) then
            add1()
        else
            state = DONE
            if isKeyword(lexstr) then
                category = lexit.KEY
            else
                category = lexit.ID
            end
        end
    end

    -- State DIGIT: we are in a NUMLIT, and we have NOT seen "e|E{+}".
    local function handle_DIGIT()
        if isDigit(ch) then
            add1()
        elseif ch == "e" or ch == "E" then
            if isDigit(getChar(1)) then  -- Lookahead for digit
                add1()  -- add "e"
                state = DIGEXP
            -- Lookahead 2 for "+" and digit
            elseif getChar(1) == "+" and isDigit(getChar(2)) then
                add1()  -- add "e"
                add1()  -- add "+"
                state = DIGEXP
            else
                state = DONE
                category = lexit.NUMLIT
            end
        else
            state = DONE
            category = lexit.NUMLIT
        end
    end

    -- State DIGEXP: we are in a NUMLIT, and we have seen "(e|E){+}".
    local function handle_DIGEXP()
        if isDigit(ch) then
            add1()
        else
            state = DONE
            category = lexit.NUMLIT
        end
    end

    -- State STRING: we are in a string.
    local function handle_STRING()
        if ch == "\"" then
            add1()
            state = DONE
            category = lexit.STRLIT
        elseif ch == "\n" or ch == "" then
            state = DONE
            category = lexit.MAL
        else
            add1()
        end
    end

    -- State OPEREQ: we have seen a "=|<|>" and are checking for a "="
    local function handle_OPEREQ()
        if ch == "=" then
            add1()
        end
        state = DONE
        category = lexit.OP
    end

    -- State BANG: we have seen a "!" and are checking for a "="
    local function handle_BANG()
        if ch == "=" then
            add1()
            category = lexit.OP
        else
            category = lexit.PUNCT
        end
        state = DONE
    end

    -- ***** Table of State-Handler Functions *****

    handlers = {
        [DONE]=handle_DONE,
        [START]=handle_START,
        [LETTER]=handle_LETTER,
        [DIGIT]=handle_DIGIT,
        [DIGEXP]=handle_DIGEXP,
        [OPEREQ]=handle_OPEREQ,
        [BANG]=handle_BANG,
        [STRING]=handle_STRING
    }

    -- ***** Iterator Function *****

    -- getLexeme
    -- Called each time through the for-in loop.
    -- Returns a pair: lexeme-string (string) and category (int), or
    -- nil, nil if no more lexemes.
    local function getLexeme(dummy1, dummy2)
        if pos > program:len() then
            return nil, nil
        end
        lexstr = ""
        state = START
        while state ~= DONE do
            ch = getChar(0)
            handlers[state]()
        end

        skipWhitespace()
        return lexstr, category
    end

    -- ***** Body of Function lex *****

    -- Initialize & return the iterator function
    pos = 1
    skipWhitespace()
    return getLexeme, nil, nil
end


-- *********************************************************************
-- Module Table Return
-- *********************************************************************


return lexit

