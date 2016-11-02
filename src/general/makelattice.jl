# water: 2
# empty: 1
# block: 0
function MakeSquareLattice(N::Int, M::Int, p::Float64)
    lattice = ( rand(Float64, N,M) .< p ) * 1

	for i in 1:N, j in 1:M
		if i == 1 && lattice[i,j] == 1; lattice[i,j] = 2; end
    end
    
    return lattice
end


function MakeSimpleLattice(N::Int, dim::Int, p::Float64)
    lattice = ( rand([N for i in 1:dim]...) .< p ) * 1
	for i in 1:N^(dim - 1)
		if lattice[i] == 1; lattice[i] = 2; end
    end
    
    return lattice
end