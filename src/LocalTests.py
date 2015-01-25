from Hypotheses import *
from ModelSelection import LinearRegression
from Test import *

sigma = 5  # observation noise sigma

##############################################################################
# Synthetic tests
##############################################################################
from Test import generate_noise_and_fit

hc = HypothesisCollection()
hc.append(PolynomialHypothesis(M=2, variance=3, noiseVariance=sigma**2))
# hc.append(PolynomialHypothesis(M=3, variance=3, noiseVariance=sigma**2))
hc.append(PolynomialHypothesis(M=6, variance=3, noiseVariance=sigma**2))
hc.append(PolynomialHypothesis(M=8, variance=3, noiseVariance=sigma**2))
hc.append(TrigonometricHypothesis(halfM=4, variance=2, noiseVariance=sigma**2))
hc.append(TrigonometricHypothesis(halfM=2, variance=2, noiseVariance=sigma**2))
# hc.append(TrigonometricHypothesis(halfM=10, variance=2, noiseVariance=sigma**2))

lr = LinearRegression(hc, sigma)

# Two tests:
generator = PolynomialHypothesis(M=6, variance=5, noiseVariance=sigma**2)
# generator=TrigonometricHypothesis(halfM=2, variance=4, noiseVariance=sigma**2)

# test_generator(generator)  # Plot generator results

generate_noise_and_fit(lr, generator, xmin=-1.0, xmax=4.0, num=100)


##############################################################################
# Interactive tests
##############################################################################
"""
from Test import select_points_and_fit

hc = HypothesisCollection()
hc.append(PolynomialHypothesis(M=2, variance=3, noiseVariance=sigma**2))
hc.append(PolynomialHypothesis(M=3, variance=3, noiseVariance=sigma**2))
hc.append(TrigonometricHypothesis(halfM=4, variance=2, noiseVariance=sigma**2))

lr = LinearRegression(hc, sigma)
select_points_and_fit(lr, num=10)
"""

##############################################################################
# Old tests
##############################################################################
"""
from Plots import *

hc = HypothesisCollection()
hc.append(PolynomialHypothesis(M=2, variance=3, noiseVariance=0.05))
hc.append(TrigonometricHypothesis(halfM=2, variance=2))

data = np.arange(0, 5)     # Shape is (5,)

pl.plot(data, hc[0].generate(data))

lr = LinearRegression(hc, sigma)
data = np.arange(0, 5)

for x, t in zip(data, hc[2].generate(data)):
    #print ("Updating with (%f, %f)" % (x, t))
    lr.update_old(x, t)
wmap = [param.mean for param in lr.parameter]

### Plot
fig, (ax1, ax2) = pl.subplots(2)
updateMAPFitPlot(ax1, lr.XHist, hc, wmap, 0.05)
pl.draw()
ax1.plot(lr.XHist, lr.THist, 'ro')
pl.draw()
updateProbabilitiesPlot(ax2, lr)
pl.draw()
pl.show()
"""