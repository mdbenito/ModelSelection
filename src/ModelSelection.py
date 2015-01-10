from numpy import linalg
from RandomVariables import *


class LinearRegression:
    """

    """
    def __init__(self, collectionOfHypotheses, observationNoise):
        self.hypotheses = collectionOfHypotheses  # list of hypotheses
        self.numHyp = len(collectionOfHypotheses)  # number of hypotheses
        self.XHist = np.array([])  # list of all past x values: dynamic
        self.THist = np.array([])  # list of all past t values: dynamic
        self.sigma = observationNoise  # noise on the observation
        self.parameter = []  # k-th entry: p(w|data, H_k)
        # history of past fitting parameters m and S
        self.mHist = [[] for i in range(self.numHyp)]
        self.SHist = [[] for i in range(self.numHyp)]
        self.probHyp = [[] for i in range(self.numHyp)]
        for k in range(self.numHyp):
            # set p(H_k|"nodata") = p(H_k)
            self.probHyp[k].append(collectionOfHypotheses.prior.evaluate(k))

            # set p(w|"no data", H_k) = p(w|H_k) for all k
            # get first the natural prior of the hypothesis
            hypoPrior = collectionOfHypotheses[k].parameterPrior
            mean = hypoPrior.mean
            var = hypoPrior.variance
            # now set the prior of the regression to that prior
            self.parameter.append(GaussianRV(mean, var))

    def update(self, newX, newT):
        """ Bayesian linear regression update.

        For every hypothesis k computes the posterior probability
            p(w|THist, newT, H_k)

        This depends strongly on all Gaussian assumptions!

        TODO: reuse Phi from previous computations

        :param newX: New value of the input variable (transposed)
        :param newT: New value of the target variable (transposed)
        :return:
        """

        # ------------------------------------------------
        # first: parameter estimation for each hypothesis
        # ------------------------------------------------

        self.XHist = np.append(self.XHist, newX)
        self.THist = np.append(self.THist, newT)

        for k, (hyp, currentPara) in enumerate(zip(self.hypotheses, self.parameter)):
            # get Phi (depends on newX) from hypothesis k
            Phi = hyp.evaluate(newX)

            # new covariance matrix
            SNInv = currentPara.invVariance + np.dot(np.transpose(Phi), Phi) / self.sigma ** 2
            temp = np.dot(currentPara.invVariance, currentPara.mean) + \
                   np.transpose(Phi) * newT / self.sigma ** 2
            currentPara.invVariance = SNInv  # update inverse variance and variance
            # SN = linalg.inv(SNInv) is not needed, as setter of GaussianDistribution calculates it
            mN = np.dot(currentPara.variance, temp)

            # update all other variables
            currentPara.mean = mN
            self.mHist[k].append(mN)
            self.SHist[k].append(currentPara.variance)

        # --------------------------------------------------
        # second: model selection
        # --------------------------------------------------

        PhiL = []  # PhiL is a list of Phi matrices

        unnormalizedEvidence = np.zeros((self.numHyp, 1))
        for k, (hyp, currentPara) in enumerate(zip(self.hypotheses, self.parameter)):
            # get sigma_W from hypothesis: SIGMA = sigmaWSQ * Id_M
            sigmaWSQ = hyp.parameterPrior.varianceMultiplier
            # build huge Phi matrix from all past data and insert in index k
            PhiCurrent = hyp.evaluate(self.XHist) # matrix Phi for the current hypothesis
            PhiL.append(PhiCurrent)
            N = PhiCurrent.shape[0]  # number of data points
            M = PhiCurrent.shape[1]  # number of parameters w

            # model selection:

            A = (np.dot(np.transpose(PhiCurrent), PhiCurrent) / self.sigma ** 2 +
                 np.eye(M, M) / sigmaWSQ)

            # numerator 1 of model selection formula

            # w^T*Phi (the y-Value according to the fitted model)
            modelMeanOfT = np.dot(PhiCurrent, currentPara.mean)
            randomVariable = GaussianRV(modelMeanOfT, self.sigma ** 2 * np.eye(N, N))
            temp = self.THist.reshape(N, -1)
            # the probability of t given y (when there is noise)
            num1 = randomVariable.evaluate(temp)

            # numerator 2 of model selection formula:
            # just the prior probability of the MAP-estimation
            num2 = hyp.parameterPrior.evaluate(currentPara.mean)

            # denominator of model selection formula:
            denom = math.sqrt(linalg.det(A / (2 * np.pi)))

            # unnormalized Evidence
            unnormalizedEvidence[k] = num1 * num2 / denom

        # normalize and save

        normalization = np.sum(unnormalizedEvidence)
        for k, prob in enumerate(self.probHyp):
            normed = unnormalizedEvidence[k] / normalization
            prob.append(normed)

    def update_old(self, newX, newT):   #newX=x',newT=t'
        """ Original implementation
        :param newX:
        :param newT:
        :return:
        """
        # ------------------------------------------------
        # first: parameter estimation for each hypothesis
        # ------------------------------------------------

        self.XHist = np.append(self.XHist, newX)
        self.THist = np.append(self.THist, newT)


        for k in range(self.numHyp): # for every hypothesis


            # get priors
            m = self.parameter[k].mean
            SInv = self.parameter[k].invVariance

            # get Phi (depends on newX) from hypothesis k
            Phi = self.hypotheses[k].evaluate([newX])

            # new covariance matrix
            SNInv = SInv + np.dot(np.transpose(Phi), Phi)/self.sigma**2

            # SN = linalg.inverse(SNInv) is not needed, as setter
            # of class GaussianDistribution calculates it automatically

            temp = np.dot(SInv, m) + np.transpose(Phi)*newT/self.sigma**2
            SN = linalg.inv(SNInv)
            mN = np.dot(SN, temp)

            # update all variables
            self.parameter[k].mean = mN
            self.parameter[k].invVariance = SNInv
            # variance gets calculated inside class automatically
            self.mHist[k].append(mN)
            self.SHist[k].append(self.parameter[k].variance)



        # --------------------------------------------------
        # second: model selection
        # --------------------------------------------------

        # initialize all needed containers
        PhiL = []
        mL = []
        SL = []

        unnormalizedEvidence = np.zeros((self.numHyp, 1))
        for k in range(self.numHyp):
            # get sigma_W from hypothesis: SIGMA = sigmaWSQ * Id_M
            sigmaWSQ = self.hypotheses[k].parameterPrior.varianceMultiplier
            # build huge Phi matrix from all past data and insert in index k
            # so PhiL is a list of Phi matrices
            PhiL.append(self.hypotheses[k].evaluate(self.XHist))
            PhiCurrent = PhiL[k] # matrix Phi for the current hypothesis
            N = PhiCurrent.shape[0] # number of data points
            M = PhiCurrent.shape[1] # number of parameters w

            # model selection:

            A = (np.dot(np.transpose(PhiCurrent), PhiCurrent)/self.sigma**2 +
                np.eye(M, M)/sigmaWSQ)

            currentPara = self.parameter[k]

            # numerator 1 of model selection formula

            # w^T*Phi (the y-Value according to the fitted model)
            modelMeanOfT = np.dot(PhiCurrent, currentPara.mean)
            randomVariable = GaussianRV(modelMeanOfT,
                                        self.sigma**2*np.eye(N, N))
            temp = self.THist.reshape(N, -1)
            # the probability of t given y (when there is noise)
            num1 = randomVariable.evaluate(temp)

            currentHypo = self.hypotheses[k]

            # numerator 2 of model selection formula:
            # just the prior probability of the MAP-estimation
            num2 = currentHypo.parameterPrior.evaluate(currentPara.mean)

            # denominator of model selection formula:
            denom = math.sqrt(linalg.det(A/(2*np.pi)))

            # unnormalized Evidence
            unnormalizedEvidence[k] = num1*num2/denom

        normalization = np.sum(unnormalizedEvidence)
        for k in range(self.numHyp):  # normalize and save
            normed = unnormalizedEvidence[k]/normalization
            #print(normed)
            self.probHyp[k].append(normed)

