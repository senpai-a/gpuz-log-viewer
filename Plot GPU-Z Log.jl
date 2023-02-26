using DataFrames
using CSV
using Dates
using PlotlyJS
myfile="GPU-Z Sensor Log.csv"
dmft = dateformat"yyyy-mm-dd HH:MM:SS"
types::AbstractVector{Type} = [[DateTime];[Float64 for _ in 1:31]]
csvf = CSV.File(joinpath(myfile); dateformat=dmft, types=types)
df = DataFrame(csvf)
i = 1
for colname in names(df)
    println(i, colname)
    i += 1
end
selected = [2,5,6,12,29]
plot([
        scatter(df, x=:Date, y=Symbol(colname), name=colname) for colname in names(df)[selected]
    ])