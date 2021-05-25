using ComoniconTestUtils
using ComoniconZSHCompletion: emit_zshcompletion
using Test
using Random

Random.seed!(42)

@testset "test completion" for _ in 1:5
    cmd = rand_command()
    script = emit_zshcompletion(cmd)
    @test occursin("#compdef _$(cmd.root.name) $(cmd.root.name)", script)
    @test occursin("function _$(cmd.root.name)() {", script)
end
