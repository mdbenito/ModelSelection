import numpy as np
import math
import logging as log


class RandomVariable(object):
    """ Base class, should not be instantiated """

    def __init__(self, dimension=1):
        self._dimension = dimension

    def evaluate(self, x):
        raise TypeError("Dummy base class")

    def sample(self):
        raise TypeError("Dummy base class")


def normal_multivariate(x, mu, sigma, inv_sigma=None, det=None):
    """
    :param x: point
    :param mu: average
    :param sigma: covariance
    :param inv_sigma: pass this parameter to avoid repeated computation of the inverse covariance
    :param det: pass this parameter to avoid repeated computation of the determinant
    :return
    :raise ValueError:
    """
    if np.isscalar(x):
        #raise TypeError("Scalars should be passed as 1x1 numpy.ndarrays")
        size = 1
    else:
        size = len(x)
    if size != len(mu) or (size, size) != sigma.shape:
        msg = "Dimension mismatch: (%d, %d) != (%d, %d)" % (size, size, sigma.shape[0], sigma.shape[1])
        raise ValueError(msg)
    if det is None:
        det = np.linalg.det(sigma)
    if det == 0:
        raise ValueError("Singular covariance matrix")
    if inv_sigma is None:
        inv_sigma = np.linalg.inv(sigma)

    norm_const = 1.0 / (math.pow((2 * np.pi), float(size) / 2) * math.sqrt(det))
    x_mu = x - mu
    exp = math.pow(math.e, -0.5 * np.dot(np.transpose(x_mu), np.dot(inv_sigma, x_mu)))

    return norm_const * exp


class GaussianRV(RandomVariable):
    """ A multivariate Gaussian.

        The mean should be a column vector (shape=(d,1))"""

    def __init__(self, m, cov):
        super(GaussianRV, self).__init__(m.shape[0])
        self._mean = np.zeros((self._dimension, 1))
        self._variance = np.zeros((self._dimension, self._dimension))
        self._inv_variance = np.inf
        self._det = 0.0
        self.mean = m
        self.variance = cov

    @property
    def mean(self):
        return self._mean

    @mean.setter
    def mean(self, value):
        if not isinstance(value, np.ndarray):
            raise TypeError('Need np.ndarray')
        if value.shape != self._mean.shape:
            log.debug(value.shape)
            log.debug(self._mean.shape)
            raise ValueError('Dimension mismatch')
        self._mean = value

    @property
    def variance(self):
        return self._variance

    @variance.setter
    def variance(self, value):
        """ Set variance and compute inverse variance"""
        if not isinstance(value, np.ndarray):
            raise TypeError('Need np.ndarray')
        if value.shape != self._variance.shape:
            log.debug(value.shape)
            log.debug(self._variance.shape)
            raise ValueError('Dimension mismatch')
        self._variance = value
        try:
            self._inv_variance = np.linalg.inv(value)
            self._det = np.linalg.det(value)
        except np.linalg.LinAlgError:
            self._inv_variance = np.empty_like(value)
            self._inv_variance.fill(np.inf)
            self._det = 0


    @property
    def inv_variance(self):
        return self._inv_variance

    @inv_variance.setter
    def inv_variance(self, value):
        """ Set inverse variance and compute variance"""
        self._inv_variance = value
        self._variance = np.linalg.inv(value)

    def evaluate(self, data):
        """Evaluation should be at points with the same shape as the mean,
           i.e. column vectors of shape=(d,1)

           data may be either an array of such points or just one.
           The return value is then an array of points or just one."""
        if np.isscalar(data):
            raise TypeError("Scalars should be passed as 1x1 numpy.ndarrays")

        l = lambda p: normal_multivariate(p, self._mean, self._variance, self._inv_variance, self._det)

        if data.shape == self._mean.shape:
            return np.array([l(data)])

        return np.array([l(x) for x in data])

    def sample(self):
        return np.random.multivariate_normal(self.mean[:, 0], self.variance).reshape(self.mean.shape)


class DiagonalGaussianRV(RandomVariable):
    """A multivariate Gaussian RV with a diagonal covariance matrix.

    This class uses the fact that a diagonal multivariate Gaussian factorizes as a product of
    univariates in order to (slightly) postpone overflow problems, in particular at the computation
    of the determinant of GaussianRV for diagonal covariance matrix, which equals $\sigma^{2N}$.

    This is just a hack and we should truly fix the problem.

    FIXME: this implementation sucks: the whole getters/setters idea is BAD."""

    def __init__(self, m, factor):
        assert np.isscalar(factor)
        assert isinstance(m, np.ndarray)
        super(DiagonalGaussianRV, self).__init__(m.shape[0])
        self._mean = np.zeros((self._dimension, 1))
        self.mean = m
        self.variance = factor

    @property
    def mean(self):
        return self._mean

    @mean.setter
    def mean(self, value):
        if not isinstance(value, np.ndarray):
            raise TypeError('Need np.ndarray')
        if value.shape != self._mean.shape:
            log.debug(value.shape)
            log.debug(self._mean.shape)
            raise ValueError('Dimension mismatch')
        self._mean = value

    @property
    def variance(self):
        return self._variance * np.eye(self._dimension)

    @variance.setter
    def variance(self, value):
        """ Set variance and compute inverse variance"""
        if not np.isscalar(value):
            raise TypeError('Need scalar')
        self._variance = value
        self._stddev = np.sqrt(value)
        try:
            self._inv_variance = 1.0 / self._variance
            self._det = np.pow(self._variance, self._dimension)
        except:
            self._inv_variance = np.nan
            self._det = np.nan

    @property
    def inv_variance(self):
        return self._inv_variance * np.eye(self._dimension)

    @inv_variance.setter
    def inv_variance(self, value):
        """ Set inverse variance and compute variance"""
        self.variance = 1.0 / value

    @property
    def factor(self):
        return self._variance

    @factor.setter
    def factor(self, value):
        self.variance = value

    def evaluate(self, data):
        """ """
        if np.isscalar(data):
            raise TypeError("Scalars should be passed as 1x1 numpy.ndarrays")

        # Evaluation at each coordinate of a data point
        norm_const = 1.0 / (np.sqrt(2 * np.pi) * self._stddev)
        l = lambda p, m: norm_const * np.exp(-0.5 * ((p - m) ** 2) / self._variance)

        # Because the covariance matrix is diagonal, evaluation at a point is the product of the
        # one dimensional evaluations at each coordinate
        lm = lambda P: np.prod(l(P, self._mean))

        if data.shape == self.mean.shape:   # We must evaluate at just one point (FIXME!)
            return np.array([lm(data)])
        else:                               # Or a whole list
            return np.array([lm(x) for x in data])

    def sample(self):
        return np.random.multivariate_normal(self.mean[:, 0],
                                             self.variance).reshape(self.mean.shape)


class DiscreteUniformRV(RandomVariable):
    """A discrete scalar uniform RV with support in $[0, \ldots, N-1]$ """

    def __init__(self, N=1):
        super(DiscreteUniformRV, self).__init__()
        self._N = N
        self._R = 1.0 / N
        self.mean = np.array([[(N-1.0)/2.0]])
        self.variance = np.array([[(N**2-1)/12.0]])

    def evaluate(self, x):
        if 0 <= x <= self._N - 1:
            return self._R
        return 0.0

    def sample(self):
        return np.random.random_integers(low=0, high=self._N-1)
