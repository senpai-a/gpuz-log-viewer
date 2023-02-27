using DataFrames
using CSV
using Dates
using PlotlyJS
myfile="GPU-Z Sensor Log.csv"
dmft = dateformat"yyyy-mm-dd HH:MM:SS"
types::AbstractVector{Type} = [[DateTime];[Float64 for _ in 1:31]]
csvf = CSV.File(joinpath(myfile); dateformat=dmft, types=types)
df = DataFrame(csvf)
for i in enumerate(names(df))
    println(i)
end
selected = [2,5,6,12,28,29]
plot([scatter(df, x=Symbol(names(df)[1]), y=Symbol(colname), name=colname) for colname in names(df)[selected]])

#= perf cap reason codes:
Power. Indicating perf is limited by total power limit.
NV_GPU_PERF_POLICY_ID_SW_POWER = 1,

Thermal. Indicating perf is limited by temperature limit.
NV_GPU_PERF_POLICY_ID_SW_THERMAL = 2,

Reliability. Indicating perf is limited by reliability voltage.
NV_GPU_PERF_POLICY_ID_SW_RELIABILITY = 4,

Operating. Indicating perf is limited by max operating voltage.
NV_GPU_PERF_POLICY_ID_SW_OPERATING = 8,

Utilization. Indicating perf is limited by GPU utilization.
NV_GPU_PERF_POLICY_ID_SW_UTILIZATION = 16,
=#
