using Revise
using BenchmarkTools
import OhMyREPL
OhMyREPL.colorscheme!("TomorrowNightBright")
import Pkg
Pkg.UPDATED_REGISTRY_THIS_SESSION[] = true
if occursin("v"*string(VERSION)[1:4],Base.active_project())
    Pkg.activate(temp=true)
end
