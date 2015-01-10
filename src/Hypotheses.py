from RandomVariables import *
import numpy as np
import math


def isnatural(x):
    return x >= 1 and x - math.floor(x) == 0.0


class Hypothesis(object):
    """ A hypothesis represents a choice of basis functions for linear regression.

        Every hypothesis manages a prior distribution on its parameters, as well as a
        distribution for the noise that is assumed in the model (in our computations always a
        SymmetricGaussianRV).

        An Hypothesis may be used to synthesize data via Hypothesis.generate().

        This is an abstract base class and should not be instantiated.
        """

    def __init__(self, M=1, prior=RandomVariable(), noise=RandomVariable()):
        assert isnatural(M)
        self._M = M           # Number of basis functions for this hypothesis
        self._pPrior = prior  # Dummy
        self._noise = noise   # Dummy

    def __str__(self):
        return "Dummy"

    @property
    def M(self):
        return self._M

    @M.setter
    def M(self, value):
        self._M = value

    @property
    def parameterPrior(self):
        """ A prior distribution on the weights $w = (w_0, \ldots, w_{M - 1})$"""
        return self._pPrior

    @property
    def noise(self):
        return self._noise

    def evaluate(self, data):
        """ Evaluate the hypothesis' functions at some input data.

        If data is a scalar $x$ this function returns the vector
            \[ (\phi_0 (x), \ldots, \phi_{M - 1} (x)). \]

        Otherwise, if data is an (N,1) vector, this function returns the matrix

         \[ \Phi (\ensuremath{\boldsymbol{x}}) = \left(\begin{array}{ccc}
                \phi_0 (x_1) & \cdots & \phi_{M - 1} (x_1)\\
                \vdots & \ddots & \vdots\\
                \phi_0 (x_N) & \cdots & \phi_{M - 1} (x_N)
                \end{array}\right). \]

        :param data: scalar or numpy.ndarray of scalars with shape (M, )
        :return: numpy.ndarray of shape (N, M) where N=len(data) or 1 if it is a scalar
        """
        return np.zeros(self._M)

    def generate(self, xx):
        """ Generate target values for this hypothesis with added noise.

        Target values $t$ are computed according to the formula

                \[ t = y (x, w) + \epsilon, \]

        where

            \[ y (x, w) = \sum_{j = 0}^{M-1} w_j \phi_j (x) \]

        is computed using evaluate() and the prior on the weights and $\epsilon$ is the noise.

        The weights are sampled from the prior each time this function is called.

        :param xx: numpy.ndarray with input points where the hypothesis is to be evaluated.
        :return: numpy.ndarray with the target values.
        """

        weights = self._pPrior.sample().reshape((self._M, 1))
        t = np.array([np.sum(np.dot(self.evaluate(x), weights)) + self.noise.sample() for x in xx])
        return t.reshape(len(xx), 1)


class PolynomialHypothesis(Hypothesis):
    """ A simple polynomial hypothesis.
        The basis functions are $\phi_j (x) = x^j$ for $j = 0, \ldots, M - 1$. """

    def __init__(self, M=1, variance=3.0, noiseVariance=0.01):
        super(PolynomialHypothesis, self).\
            __init__(M,
                     prior=SymmetricGaussianRV(np.zeros((M, 1)), variance),
                     noise=SymmetricGaussianRV(np.array([[0.0]]), noiseVariance))

    def __str__(self):
        return "Poly%d" % (self._M-1)

    def evaluate(self, data):
        """ Returns $(1, x, x^2, \ldots, x^{M - 1})$ for each $x$ in data. """
        f = lambda x: [x ** j for j in range(0, self._M)]
        if np.isscalar(data):
            return np.array(f(data)).reshape((1, self._M))
        return np.array(map(f, data))   # has shape(len(data), self._M)


class TrigonometricHypothesis(Hypothesis):
    """ A simple trigonometric hypothesis.
        The basis functions are $\phi_j (x) = \cos (\mathpi jx)$ for $j = 0, \ldots, M - 1$. """
    def __init__(self, halfM=1, variance=3.0, noiseVariance=0.01):
        super(TrigonometricHypothesis, self).\
            __init__(2 * halfM,
                     prior=SymmetricGaussianRV(np.zeros((2*halfM, 1)), variance),
                     noise=SymmetricGaussianRV(np.array([[0.0]]), noiseVariance))

    def __str__(self):
        return "Trig%d" % (self._M-1)

    def evaluate(self, data):
        cos = lambda x: [math.cos(np.pi * j * x) for j in range(0, self._M/2)]
        sin = lambda x: [math.sin(np.pi * j * x) for j in range(0, self._M/2)]
        if np.isscalar(data):
            return np.concatenate((cos(data), sin(data))).reshape((1, self._M))
        return np.array([np.concatenate((cos(p), sin(p))) for p in data])


class HypothesisCollection(list):
        """ A list-like wrapper for hypotheses which manages a prior distribution on them, by
        default uniform.

        As a container this is simply a list with automatic growth.
        """

        def __init__(self, K=0):
            """
            :param K: Pre-assign size of list (sets entries to None)
            """
            super(list, self).__init__()
            if isnatural(K):
                self.extend([None] * K)
                self._prior = DiscreteUniformRV(K)
            else:
                self._prior = RandomVariable()  # Dummy

        def __setitem__(self, index, value):
            if not isinstance(value, Hypothesis):
                raise TypeError('Object stored must inherit Hypothesis')
            if index >= len(self):
                print ("extending")
                self.extend([None] * (index + 1 - len(self)))
                self._prior = DiscreteUniformRV(len(self))
            list.__setitem__(self, index, value)

        def append(self, x):
            super(HypothesisCollection, self).append(x)
            self._prior = DiscreteUniformRV(len(self))

        @property
        def prior(self):
            return self._prior
