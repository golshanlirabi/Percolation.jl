function percolation(N::Int64, M::Int64, p::Float64; fig=true, water=true)

    lattice, config = MakeSimpleLattice(N, M, p)
    
    # test whether vertical percolation or not.
    PercOrNot = verticalPercolation(lattice)
    if PercOrNot < N && fig == false
        return 0
    end
        

	exconfig = fill!(Array{String}(N,M), "tempolaryString")
	while config != exconfig
		exconfig = config[:,:]
		for i in 1:N, j in 1:M
			if config[i,j] == "water"
				config = checksite(i, j, config)
			end
		end
	end


	if "water" ∈ config[N,:]
		hit = 1
	else
		hit = 0
	end

	if fig
		PercolationPlot(N, M, p, lattice, config, hit, waterplot=water)
	end

	return hit, lattice, config;
end



function percolation(N::Int64, p::Float64; fig=true, water=true)
    M = N
    lattice, config = MakeSimpleLattice(N, M, p)
    
    # test whether vertical percolation or not.
    PercOrNot = verticalPercolation(lattice)
    if PercOrNot < N && fig == false
        return 0
    end
        

	exconfig = fill!(Array{String}(N,M), "tempolaryString")
	while config != exconfig
		exconfig = config[:,:]
		for i in 1:N, j in 1:M
			if config[i,j] == "water"
				config = checksite(i, j, config)
			end
		end
	end


	if "water" ∈ config[N,:]
		hit = 1
	else
		hit = 0
	end

	if fig
		PercolationPlot(N, M, p, lattice, config, hit, waterplot=water)
	end

	return hit, lattice, config;    
end


# add site option: nearest neighbor, next nearest neighbor
function percolation(SiteSize::simplenn, p::Float64; fig=true, water=true)
    (N, M) = (SiteSize.N, SiteSize.M)
    lattice, config = MakeSimpleLattice(N, M, p)
    
    # test whether vertical percolation or not.
    PercOrNot = verticalPercolation(lattice)
    if PercOrNot < N && fig == false
        return 0
    end
        

	exconfig = fill!(Array{String}(N,M), "tempolaryString")
	while config != exconfig
		exconfig = config[:,:]
		for i in 1:N, j in 1:M
			if config[i,j] == "water"
				config = checksite(i, j, config, SiteSize)
			end
		end
	end


	if "water" ∈ config[N,:]
		hit = 1
	else
		hit = 0
	end

	if fig
		PercolationPlot(SiteSize, p, lattice, config, hit, waterplot=water)
	end

	return hit, lattice, config;
end


function percolation(SiteSize::simplennn, p::Float64; fig=true, water=true)
    (N, M) = (SiteSize.N, SiteSize.M)
    lattice, config = MakeSimpleLattice(N, M, p)
    
    # test whether vertical percolation or not.
    PercOrNot = verticalPercolation(lattice)
    if PercOrNot < N && fig == false
        return 0
    end
        

	exconfig = fill!(Array{String}(N,M), "tempolaryString")
	while config != exconfig
		exconfig = config[:,:]
		for i in 1:N, j in 1:M
			if config[i,j] == "water"
				config = checksite(i, j, config, SiteSize)
			end
		end
	end


	if "water" ∈ config[N,:]
		hit = 1
	else
		hit = 0
	end

	if fig
		PercolationPlot(SiteSize, p, lattice, config, hit, waterplot=water)
	end

	return hit, lattice, config;
end
