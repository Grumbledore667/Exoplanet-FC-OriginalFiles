local utils = require "pl.utils"
local plfunc = require "pl.func"

local fun = {}

fun.bind1   = utils.bind1
fun.bind    = utils.bind1
fun.partial = utils.bind1
fun.bind2   = utils.bind2
fun.choose  = utils.choose
fun.memoize  = utils.memoize
fun.compose  = plfunc.compose

return fun
