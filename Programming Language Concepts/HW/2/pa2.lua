#!/usr/bin/env lua
-- pa2.lua
-- Jon Rippe
-- CSCE A331
-- HW #2

local pa2 = {}

-- *filterArray*
-- Takes a one-parameter function p and an array t
-- Returns an array of all items in t where p(t) is truthy
function pa2.filterArray(p, t)
  local u = {}
  for i = 1, #t do
    if p(t[i]) then table.insert(u, t[i]) end
  end
  return u
end

-- *concatMax*
-- Takes a string s and an integer n
-- Returns a string s* with a maximum length <n
function pa2.concatMax(s, n)
  local t = ""
  for i = 1, n / (string.len(s)) do
    t = t..s
  end
  return t
end

-- *collatz*
-- Takes an integer k
-- Contains an iterator that returns subsequent values of
-- Collatz sequence beginning with k
function pa2.collatz(k)
  local kPrev
  
  -- Collatz function
  local function c(n)
    if n == 1 then return n
    elseif n % 2 == 1 then
      return (3 * n) + 1
    else
      return n/2
    end
  end
  
  -- Iterator
  function iter(dummy1, dummy2)
    if kPrev == 1 then
      return nil
    end
    
    kPrev = k
    k = c(k)
    
    return kPrev
  end
  
  return iter, nil, nil
end

-- *substrings*
-- Coroutine
-- Takes string s
-- Yields all substrings of s
function pa2.substrings(s)
  coroutine.yield("")
  for i = 1, string.len(s) do
    for j = 1, string.len(s) - i + 1 do
      coroutine.yield(string.sub(s, j, j+i-1))
    end
  end
end

return pa2

