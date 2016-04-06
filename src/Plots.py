import numpy as np
import matplotlib.pyplot as pl


def getMAPFitPlot(inputVec, hypotheses, wmaps, deltaH):
    """
    TODO: should create new plot
    :rtype : Current figure (figManager.canvas.figure)
    """
    for j, (h, w) in enumerate(zip(hypotheses, wmaps)):
        temp = np.reshape(w, (len(w), 1))
        xMax = np.max(inputVec)
        xMin = np.min(inputVec)

        z = np.round(((xMax-xMin)/deltaH)-0.5)
        Nx = z.astype(int)
        xValues = np.min(inputVec) + deltaH*np.array(range(Nx))
        outs = np.empty(xValues.shape)
        for i, x in enumerate(xValues):
            hh = np.reshape(np.array(h.evaluate(x)), temp.shape)
            outs[i] = np.dot(np.transpose(temp), hh)

        pl.plot(xValues, outs, label=str(h))
    pl.legend(title='MAP fit', loc=2)
    return pl.gcf()


def updateMAPFitPlot(ax, inputVec, hypotheses, wmaps, deltaH):
    for j, (h, w) in enumerate(zip(hypotheses, wmaps)):
        temp = np.reshape(w, (len(w), 1))
        xMax = np.max(inputVec)
        xMin = np.min(inputVec)

        z = np.round(((xMax-xMin)/deltaH)-0.5)
        Nx = z.astype(int)
        xValues = np.min(inputVec) + deltaH*np.array(range(Nx))
        outs = np.empty(xValues.shape)
        for i, x in enumerate(xValues):
            hh = np.reshape(np.array(h.evaluate(x)), temp.shape)
            outs[i] = np.dot(np.transpose(temp), hh)

        ax.plot(xValues, outs, label=str(h))
    #ax.legend(title='MAP fit', loc = 2)

def getProbabilitiesPlot(regression):
    x = range(len(regression.probHyp[0]))
    for i, prob in enumerate(regression.probHyp):
        pl.plot(x, prob, label=str(regression.hypotheses[i]))
    pl.legend(title='p(H_k)', loc=2)
    return pl.gcf()


def updateProbabilitiesPlot(ax, regression):
    x = range(len(regression.probHyp[0]))
    for i, prob in enumerate(regression.probHyp):
        ax.plot(x, prob, label=str(regression.hypotheses[i]))
    ax.legend(title='p(H_k)', loc=2)
