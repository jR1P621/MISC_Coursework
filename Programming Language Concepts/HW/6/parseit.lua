-- parseit.lua
-- Jon Rippe & Glenn G. Chappell
-- 2021-02-22
--
-- CSCE A331 HW4
-- Recursive-Descent Parser #4: Expressions + Better ASTs
-- Requires lexit.lua


-- Grammar
-- Start symbol: expr
--
--     expr    ->  term { ("+" | "-") term }
--     term    ->  factor { ("*" | "/") factor }
--     factor  ->  ID
--              |  NUMLIT
--              |  "(" expr ")"
--
-- All operators (+ - * /) are left-associative.
--
-- AST Specification
-- - For an ID, the AST is { SIMPLE_VAR, SS }, where SS is the string
--   form of the lexeme.
-- - For a NUMLIT, the AST is { NUMLIT_VAL, SS }, where SS is the string
--   form of the lexeme.
-- - For expr -> term, then AST for the expr is the AST for the term,
--   and similarly for term -> factor.
-- - Let X, Y be expressions with ASTs XT, YT, respectively.
--   - The AST for ( X ) is XT.
--   - The AST for X + Y is { { BIN_OP, "+" }, XT, YT }. For multiple
--     "+" operators, left-asociativity is reflected in the AST. And
--     similarly for the other operators.

local lexit = require "lexit"


-- *********************************************************************
-- Module Table Initialization
-- *********************************************************************


local parseit = {}  -- Our module


-- *********************************************************************
-- Variables
-- *********************************************************************


-- For lexit iteration
local iter          -- Iterator returned by lexit.lex
local state         -- State for above iterator (maybe not used)
local lexit_out_s   -- Return value #1 from above iterator
local lexit_out_c   -- Return value #2 from above iterator

-- For current lexeme
local lexstr = ""   -- String form of current lexeme
local lexcat = 0    -- Category of current lexeme:
                    --  one of categories below, or 0 for past the end


-- *********************************************************************
-- Symbolic Constants for AST
-- *********************************************************************


local STMT_LIST    = 1
local WRITE_STMT   = 2
local RETURN_STMT  = 3
local ASSN_STMT    = 4
local FUNC_CALL    = 5
local FUNC_DEF     = 6
local IF_STMT      = 7
local FOR_LOOP     = 8
local STRLIT_OUT   = 9
local CR_OUT       = 10
local DQ_OUT       = 11
local CHAR_CALL    = 12
local BIN_OP       = 13
local UN_OP        = 14
local NUMLIT_VAL   = 15
local BOOLLIT_VAL  = 16
local READNUM_CALL = 17
local SIMPLE_VAR   = 18
local ARRAY_VAR    = 19


-- *********************************************************************
-- Utility Functions
-- *********************************************************************


-- advance
-- Go to next lexeme and load it into lexstr, lexcat.
-- Should be called once before any parsing is done.
-- Function init must be called before this function is called.
local function advance()
    -- Advance the iterator
    lexit_out_s, lexit_out_c = iter(state, lexit_out_s)

    -- If we're not past the end, copy current lexeme into vars
    if lexit_out_s ~= nil then
        lexstr, lexcat = lexit_out_s, lexit_out_c
    else
        lexstr, lexcat = "", 0
    end
end


-- init
-- Initial call. Sets input for parsing functions.
local function init(prog)
    iter, state, lexit_out_s = lexit.lex(prog)
    advance()
end


-- atEnd
-- Return true if pos has reached end of input.
-- Function init must be called before this function is called.
local function atEnd()
    return lexcat == 0
end


-- matchString
-- Given string, see if current lexeme string form is equal to it. If
-- so, then advance to next lexeme & return true. If not, then do not
-- advance, return false.
-- Function init must be called before this function is called.
local function matchString(s)
    if lexstr == s then
        advance()
        return true
    else
        return false
    end
end


-- matchCat
-- Given lexeme category (integer), see if current lexeme category is
-- equal to it. If so, then advance to next lexeme & return true. If
-- not, then do not advance, return false.
-- Function init must be called before this function is called.
local function matchCat(c)
    if lexcat == c then
        advance()
        return true
    else
        return false
    end
end


-- *********************************************************************
-- "local" Statements for Parsing Functions
-- *********************************************************************


local parse_program
local parse_stmt_list
local parse_simple_stmt
local parse_complex_stmt
local parse_write_arg
local parse_expr
local parse_compare_expr
local parse_arith_expr
local parse_term
local parse_factor



-- *********************************************************************
-- The Parser: Function "parse" - EXPORTED
-- *********************************************************************


-- parse
-- Given program, initialize parser and call parsing function for start
-- symbol. Returns pair of booleans & AST. First boolean indicates
-- successful parse or not. Second boolean indicates whether the parser
-- reached the end of the input or not. AST is only valid if first
-- boolean is true.
function parseit.parse(prog)
    -- Initialization
    init(prog)

    -- Get results from parsing
    local good, ast = parse_program()  -- Parse start symbol
    local done = atEnd()

    -- And return them
    return good, done, ast
end


-- *********************************************************************
-- Parsing Functions
-- *********************************************************************


-- Each of the following is a parsing function for a nonterminal in the
-- grammar. Each function parses the nonterminal in its name and returns
-- a pair: boolean, AST. On a successul parse, the boolean is true, the
-- AST is valid, and the current lexeme is just past the end of the
-- string the nonterminal expanded into. Otherwise, the boolean is
-- false, the AST is not valid, and no guarantees are made about the
-- current lexeme. See the AST Specification near the beginning of this
-- file for the format of the returned AST.

-- NOTE. Declare parsing functions "local" above, but not below. This
-- allows them to be called before their definitions.


-- parse_program
-- Parsing function for nonterminal "program".
-- Function init must be called before this function is called.
function parse_program()
    local good, ast

    good, ast = parse_stmt_list()
    return good, ast
end


-- parse_stmt_list
-- Parsing function for nonterminal "stmt_list".
-- Function init must be called before this function is called.
function parse_stmt_list()
    local good, ast1, ast2

    ast1 = { STMT_LIST }
    while true do
        if lexstr == "write"
          or lexstr == "return"
          or lexcat == lexit.ID then
            good, ast2 = parse_simple_stmt()
            if not good then
                return false, nil
            end
            if not matchString(";") then
                return false, nil
            end
        elseif lexstr == "def"
          or lexstr == "if"
          or lexstr == "for" then
            good, ast2 = parse_complex_stmt()
            if not good then
                return false, nil
            end
        else
            break
        end

        table.insert(ast1, ast2)
    end

    return true, ast1
end


-- parse_simple_stmt
-- Parsing function for nonterminal "simple_stmt".
-- Function init must be called before this function is called.
function parse_simple_stmt()
    local good, ast1, ast2, savelex, arrayflag

    if matchString("write") then
        if not matchString("(") then
            return false, nil
        end

        if matchString(")") then
            return true, { WRITE_STMT }
        end

        good, ast1 = parse_write_arg()
        if not good then
            return false, nil
        end

        ast2 = { WRITE_STMT, ast1 }

        while matchString(",") do
            good, ast1 = parse_write_arg()
            if not good then
                return false, nil
            end

            table.insert(ast2, ast1)
        end

        if not matchString(")") then
            return false, nil
        end

        return true, ast2

    elseif matchString("return") then
        good, ast1 = parse_expr()
        if not good then
            return false, nil
        end

        return true, { RETURN_STMT, ast1 }
    else
        savelex = lexstr
        if matchCat(lexit.ID) then
            if matchString('(') and matchString(')') then
                return true, { FUNC_CALL, savelex }
            else
                if matchString('[') then
                    arrayflag = true
                    good, ast1 = parse_expr()
                    if not good or not matchString(']') then
                        return false, nil
                    end
                end
                if not matchString('=') then
                    return false, nil
                end
                good, ast2 = parse_expr()
                if not good then
                    return false, nil
                end
                if arrayflag then
                    return true, {ASSN_STMT, {ARRAY_VAR, savelex, ast1}, ast2}
                end
                return true, {ASSN_STMT, {SIMPLE_VAR, savelex}, ast2}
            end
        end
    end
    return false, nil
end


-- parse_complex_stmt
-- Parsing function for nonterminal "complex_stmt".
-- Function init must be called before this function is called.
function parse_complex_stmt()
    local good, ast1, ast2, ast3, ast4, savelex

    if matchString("def") then
        savelex = lexstr
        if matchCat(lexit.ID) and matchString('(')
        and matchString(')') and matchString('{') then
            good, ast1 = parse_stmt_list()
            if not good or not matchString('}') then
                return false, nil
            end
            return true, {FUNC_DEF, savelex, ast1}
        end
    elseif matchString("if") then
        if not matchString('(') then
            return false, nil
        end
        good, ast2 = parse_expr()
        if not good or not (matchString(')') and matchString('{')) then
            return false, nil
        end
        good, ast3 = parse_stmt_list()
        if not good or not matchString('}') then
            return false, nil
        end
        ast1 = { IF_STMT, ast2, ast3 }

        while matchString("elseif") and matchString('(') do
            good, ast2 = parse_expr()
            if not good or not (matchString(')') and matchString('{')) then
                return false, nil
            end
            table.insert(ast1, ast2)
            good, ast2 = parse_stmt_list()
            if not good or not matchString('}') then
                return false, nil
            end
            table.insert(ast1, ast2)
        end

        if matchString('else') and matchString('{') then
            good, ast2 = parse_stmt_list()
            if not good or not matchString('}') then
                return false, nil
            end
            table.insert(ast1, ast2)
        end

        return true, ast1

    elseif matchString("for") then
        if not matchString("(") then
            return false, nil
        end

        if matchString(";") then
            ast1 = {}
        else
            good, ast1 = parse_simple_stmt()
            if not good then
                return false, nil
            end

            if not matchString(";") then
                return false, nil
            end
        end

        if matchString(";") then
            ast2 = {}
        else
            good, ast2 = parse_expr()
            if not good then
                return false, nil
            end

            if not matchString(";") then
                return false, nil
            end
        end

        if matchString(")") then
            ast3 = {}
        else
            good, ast3 = parse_simple_stmt()
            if not good then
                return false, nil
            end

            if not matchString(")") then
                return false, nil
            end
        end

        if not matchString("{") then
            return false, nil
        end

        good, ast4 = parse_stmt_list()
        if not good then
            return false, nil
        end

        if not matchString("}") then
            return false, nil
        end

        return true, { FOR_LOOP, ast1, ast2, ast3, ast4 }
    end
    return false, nil
end


-- parse_write_arg
-- Parsing function for nonterminal "write_arg".
-- Function init must be called before this function is called.
function parse_write_arg()
    local savelex, good, ast1

    savelex = lexstr
    if matchCat(lexit.STRLIT) then
        return true, { STRLIT_OUT, savelex }
    elseif matchString('cr') then
        return true, { CR_OUT }
    elseif matchString('dq') then
        return true, { DQ_OUT }
    elseif matchString('char') and matchString('(') then
        good, ast1 = parse_expr()
        if not good or not matchString(')') then
            return false, nil
        end
        return true, { CHAR_CALL, ast1 }
    else
        good, ast1 = parse_expr()
        if not good then
            return false, nil
        end
        return true, ast1
    end
end


-- parse_expr
-- Parsing function for nonterminal "expr".
-- Function init must be called before this function is called.
function parse_expr()
    local good, ast, saveop, newast

    good, ast = parse_compare_expr()
    if not good then
        return false, nil
    end

    while true do
        saveop = lexstr
        if not matchString("and") and not matchString("or") then
            break
        end

        good, newast = parse_compare_expr()
        if not good then
            return false, nil
        end

        ast = { { BIN_OP, saveop }, ast, newast }
    end

    return true, ast
end


-- parse_compare_expr
-- Parsing function for nonterminal "compare_expr".
-- Function init must be called before this function is called.
function parse_compare_expr()
    local good, ast, saveop, newast

    good, ast = parse_arith_expr()
    if not good then
        return false, nil
    end

    while true do
        saveop = lexstr
        if not matchString("==") and not matchString("!=")
        and not matchString("<") and not matchString("<=")
        and not matchString(">") and not matchString(">=") then
            break
        end
        good, newast = parse_arith_expr()
        if not good then
            return false, nil
        end

        ast = { { BIN_OP, saveop }, ast, newast }
    end

    return true, ast
end

-- parse_arith_expr
-- Parsing function for non-terminal "compare_arith".
-- Function init must be called before this function is called.
function parse_arith_expr()
    local good, ast, saveop, newast

    good, ast = parse_term()
    if not good then
        return false, nil
    end

    while true do
        saveop = lexstr
        if not matchString("+") and not matchString("-") then
            break
        end

        good, newast = parse_term()
        if not good then
            return false, nil
        end

        ast = { { BIN_OP, saveop }, ast, newast }
    end

    return true, ast
end


-- parse_term
-- Parsing function for nonterminal "term".
-- Function init must be called before this function is called.
function parse_term()
    local good, ast, saveop, newast

    good, ast = parse_factor()
    if not good then
        return false, nil
    end

    while true do
        saveop = lexstr
        if not matchString("*") and not matchString("/")
        and not matchString("%") then
            break
        end

        good, newast = parse_factor()
        if not good then
            return false, nil
        end

        ast = { { BIN_OP, saveop }, ast, newast }
    end

    return true, ast
end


-- parse_factor
-- Parsing function for nonterminal "factor".
-- Function init must be called before this function is called.
function parse_factor()
    local savelex, good, ast

    savelex = lexstr
    if matchCat(lexit.ID) then
        if matchString('(') and matchString(')') then
            return true, { FUNC_CALL, savelex }
        elseif matchString('[') then
            good, ast = parse_expr()
            if not good or not matchString(']') then
                return false, nil
            end
            return true, {ARRAY_VAR, savelex, ast}
        else
            return true, {SIMPLE_VAR, savelex}
        end
    elseif matchCat(lexit.NUMLIT) then
        return true, { NUMLIT_VAL, savelex }
    elseif matchString('readnum') and matchString('(') and matchString(')') then
        return true, { READNUM_CALL }
    elseif matchString('true') or matchString('false') then
        return true, { BOOLLIT_VAL, savelex}
    elseif matchString('+') or matchString('-') or matchString('not') then
        good, ast = parse_factor()
        if not good then
            return false, nil
        end

        return true, { { UN_OP, savelex}, ast }
    elseif matchString("(") then
        good, ast = parse_expr()
        if not good then
            return false, nil
        end

        if not matchString(")") then
            return false, nil
        end

        return true, ast
    else
        return false, nil
    end
end


-- *********************************************************************
-- Module Table Return
-- *********************************************************************


return parseit

