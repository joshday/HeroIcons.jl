using ZipFile

v = "0.4.2"

url = "https://github.com/tailwindlabs/heroicons/archive/v$v.zip"

rm(joinpath(@__DIR__, "heroicons-$v/"), force=true, recursive=true)

download(url, joinpath(@__DIR__, "heroicons-$v.zip"))

zipfile = ZipFile.Reader(joinpath(@__DIR__, "heroicons-$v.zip"))

for file in zipfile.files 
    if endswith(file.name, '/')
        mkdir(joinpath(@__DIR__, file.name))
    elseif endswith(file.name, ".svg")
        open(joinpath(@__DIR__, file.name), "w") do io 
            print(io, read(file, String))
        end
    end
end

