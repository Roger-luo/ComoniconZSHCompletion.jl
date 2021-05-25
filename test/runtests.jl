using ComoniconTestUtils
using ComoniconZSHCompletion: emit_zshcompletion
using Test

@testset "test completion" begin
    cmd = rand_command()
    script = emit_zshcompletion(cmd)
    @test occursin("#compdef _$(cmd.root.name) $(cmd.root.name)", script)
    @test occursin("function _$(cmd.root.name)() {", script)
end
