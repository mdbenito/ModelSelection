<TeXmacs|1.99.3>

<style|amsart>

<\body>
  <\hide-preamble>
    <assign|dfn|<macro|body|<strong|<arg|body>>>>

    <assign|render-bibliography|<\macro|name|body>
      <\with|par-left|<plus|<value|par-left>|3fn>|par-right|<plus|<value|par-right>|3fn>|par-first|0fn|par-par-sep|0fn>
        <vspace*|2fn><wide-std-underlined|<principal-section*|<arg|name>>>

        <small|<arg|body>>
      </with>
    </macro>>

    <assign|subsection|<macro|title|<assign|subsection-numbered|<compound|subsection-display-numbers>><assign|subsection-prefix|<macro|<compound|the-subsection>.>><compound|next-subsection><compound|subsection-clean><compound|subsection-header|<arg|title>><compound|subsection-toc|<arg|title>><no-page-break><vspace*|1.5fn><if|<value|subsection-numbered>|<compound|subsection-numbered-title|<arg|title>>|<compound|subsection-title|<arg|title>>>>>

    <assign|section|<macro|title|<assign|section-numbered|<compound|section-display-numbers>><assign|section-prefix|<macro|<compound|the-section>.>><compound|next-section><compound|section-clean><compound|section-header|<arg|title>><compound|section-toc|<arg|title>><no-page-break><vspace*|2fn><with|font|concrete|font-family|ss|<large|<if|<value|section-numbered>|<compound|section-numbered-title|<arg|title>>|<compound|section-title|<arg|title>>>>>>>

    <assign|table-of-contents|<\macro|aux|body>
      <tabular|<tformat|<twith|table-width|1par>|<twith|table-hmode|exact>|<cwith|1|1|1|1|cell-block|yes>|<cwith|1|1|1|1|cell-hyphen|t>|<cwith|1|1|1|1|cell-lsep|4em>|<cwith|1|1|1|1|cell-rsep|4em>|<table|<row|<\cell>
        <\small>
          <render-table-of-contents|<table-of-contents-text>|<arg|body>>
        </small>
      </cell>>>>>
    </macro>>
  </hide-preamble>

  <doc-data|<doc-title|Bayesian model selection for linear
  regression>|<\doc-author>
    <author-data|<author-name|Miguel de Benito>|<\author-affiliation>
      Universität Augsburg
    </author-affiliation>|<author-email|m.debenito.d@gmail.com>>
  </doc-author>|<\doc-author>
    <author-data|<author-name|Philipp Wacker>|<\author-affiliation>
      Universität Augsburg
    </author-affiliation>|<author-email|phkwacker@gmail.com>>
  </doc-author>>

  <abstract-data|<abstract|In this note we introduce linear regression with
  basis functions in order to apply Bayesian model selection. The goal is to
  incorporate Occam's razor as provided by Bayes analysis in order to
  automatically pick the model optimally able to explain the data without
  overfitting.<set-this-page-footer|<htab|5mm><small|This document was
  created using <TeXmacs> (<hlink|www.texmacs.org|http://www.texmacs.org>)><htab|5mm>>>>

  <\table-of-contents|toc>
    <vspace*|1fn><with|font-series|bold|math-font-series|bold|1.<space|2spc>Introduction:
    different models for linear regression>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-1><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|2.<space|2spc>Parameter
    inference> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-2><vspace|0.5fn>

    <with|par-left|1tab|2.1.<space|2spc>Method and the difference between ML
    and MAP <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-3>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|3.<space|2spc>Model
    selection> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-5><vspace|0.5fn>

    <with|par-left|1tab|3.1.<space|2spc>Why (naive) iterative model selection
    does not work <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-6>>

    <with|par-left|1tab|3.2.<space|2spc>Correct model selection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-8>>

    <with|par-left|1tab|3.3.<space|2spc>Laplace's method
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-9>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|4.<space|2spc>An
    easy example: is this coin bent?> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-10><vspace|0.5fn>

    <with|par-left|1tab|4.1.<space|2spc>Model
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-11>>

    <with|par-left|1tab|4.2.<space|2spc>Parameter inference
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-12>>

    <with|par-left|1tab|4.3.<space|2spc>Iterative model selection. Why it
    cannot work <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-13>>

    <with|par-left|1tab|4.4.<space|2spc>Model selection: \Pbatch\Q approach
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-14>>

    <with|par-left|1tab|4.5.<space|2spc>Model selection: Quasi-iterative
    approach <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-16>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|5.<space|2spc>Influence
    of the race on the imposition of the death penalty>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-17><vspace|0.5fn>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|6.<space|2spc>Bayesian
    Model Selection for Linear Regression>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-18><vspace|0.5fn>

    <with|par-left|1tab|6.1.<space|2spc>Setting
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-19>>

    <with|par-left|1tab|6.2.<space|2spc>Iterative parameter estimation
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-20>>

    <with|par-left|1tab|6.3.<space|2spc>Model selection
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-21>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|7.<space|2spc>Simulation
    results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-22><vspace|0.5fn>

    <with|par-left|1tab|7.1.<space|2spc>Low noise, quadratic growth data
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-23>>

    <with|par-left|1tab|7.2.<space|2spc>High noise, long range oscillating
    data <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-25>>

    <with|par-left|1tab|7.3.<space|2spc>Low noise, short range oscillatory
    data <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-27>>

    <vspace*|1fn><with|font-series|bold|math-font-series|bold|Bibliography>
    <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
    <no-break><pageref|auto-29><vspace|0.5fn>
  </table-of-contents>

  <section|Introduction: different models for linear
  regression><label|sec:introduction>

  <\footnote>
    For a thorough treatment we refer to <cite-detail|bishop_pattern_2006|Chapter
    3>.
  </footnote>Assume we have some collection of points
  <math|<around*|{|<around*|(|x<rsub|n>,t<rsub|n>|)>\<in\>\<bbb-R\><rsup|2><mid|\|>n=1,\<ldots\>,N|}>>.
  The <math|\<b-x\>=<around*|(|x<rsub|1>,\<ldots\>,x<rsub|N>|)>> are called
  <dfn|inputs> or <dfn|observations> and <math|\<b-t\>=<around*|(|t<rsub|1>,\<ldots\>,t<rsub|N>|)>>
  are the <dfn|outputs> or <dfn|targets>. One could ask the following
  questions:

  <\enumerate>
    <item>Is there any trend (monotonicity, asymptotics, etc.) in the data as
    a whole?

    <item>What's the likeliest value for the target <math|t> given a new
    observation <math|x>?

    <item>Can we describe the target function as a linear combination of some
    set of known functions, at least approximately?
  </enumerate>

  Here we will try to answer these questions using <dfn|linear regression>,
  which basically amounts to assuming the third item above: one first fixes
  some set of <dfn|basis functions> <math|\<varphi\><rsub|j>:\<bbb-R\>\<rightarrow\>\<bbb-R\>,j\<in\><around*|{|1,\<ldots\>,M|}>>
  and then tries to fit scalar coefficients
  <math|w<rsub|1>,\<ldots\>,w<rsub|M>\<in\>\<bbb-R\>> such that for every
  <math|n\<in\><around*|{|1,\<ldots\>,N|}>>,

  <\equation*>
    t<rsub|n>\<simeq\><big|sum><rsub|j=1><rsup|M>w<rsub|j>*\<varphi\><rsub|j><around*|(|x<rsub|n>|)>
  </equation*>

  in some suitable sense. A particular choice of basis functions is called an
  <dfn|hypothesis> or <strong|model>, which we denote as <math|\<cal-H\>> and
  it is an awesome feature of Bayesian statistics that one may let the data
  speak for themselves and tell us which one out of several hypothesis best
  fits the data, while at the same time not incurring in <em|overfitting>,
  i.e. the problem of choosing coefficients providing a perfect fit for a
  given training set but failing miserably with mostly any other one (this is
  done by skipping parameter fitting altogether, at least in principle). We
  will encode our lack of knowledge about what is the right model as a prior
  distribution on the set of all them (e.g. a uniform over the discrete set
  <math|<around*|{|\<cal-H\><rsub|1>,\<ldots\>,\<cal-H\><rsub|K>|}>>).

  So, more generally than above, we start with several hypotheses
  <math|\<cal-H\><rsub|1>,\<ldots\>,\<cal-H\><rsub|K>> and try to choose the
  best one. To fix notation, we assume that the target function has the form

  <\equation*>
    t=y<around*|(|x,w|)>+\<epsilon\>
  </equation*>

  with <math|\<epsilon\>\<sim\>\<cal-N\><around*|(|0,\<sigma\><rsup|2>|)>> a
  Gaussian random variable modeling noise, <math|x\<in\>\<bbb-R\>> a data
  point and <math|w=<around*|(|w<rsub|0>,\<ldots\>,w<rsub|M-1>|)>\<in\>W>
  (e.g. <math|W=\<bbb-R\><rsup|M>>), a vector of weights determining the
  function

  <\equation*>
    y<around*|(|x,w|)>=<big|sum><rsub|j=0><rsup|M<rsub|k>-1>w<rsub|j>*\<phi\><rsub|j><around*|(|x|)>,
  </equation*>

  where

  <\equation*>
    \<phi\><rsub|j>=\<phi\><rsub|j><rsup|<around*|(|k|)>>\<in\>\<cal-H\><rsub|k>=<around*|{|\<phi\><rsub|0><rsup|<around*|(|k|)>>,\<ldots\>,\<phi\><rsub|M<rsub|k>-1><rsup|<around*|(|k|)>>|}>,M<rsub|k>\<in\>\<bbb-N\>
  </equation*>

  is some given set of basis functions. For convenience we always choose
  <math|\<phi\><rsub|0>\<equiv\>1>. One may use polynomials:

  <\equation*>
    \<cal-H\><rsub|1>=<around*|{|\<phi\><rsub|j><around*|(|x|)>=x<rsup|j>:j=0,\<ldots\>,M-1|}>,<space|1em>M\<in\>\<bbb-N\>,
  </equation*>

  or cosine functions

  <\equation*>
    \<cal-H\><rsub|2>=<around*|{|\<phi\><rsub|j><around*|(|x|)>=cos<around*|(|\<mathpi\>*j*x|)>:j=0,\<ldots\>,M-1|}>,<space|1em>M\<in\>\<bbb-N\>,
  </equation*>

  or wavelets or whatever, up to some fixed number <math|K> of different
  models. The main task to perform now is <dfn|model selection>: given any
  pair of hypothesis <math|\<cal-H\><rsub|k<rsub|1>>,\<cal-H\><rsub|k<rsub|2>>>
  determine which one is supported by more <em|evidence> in the data. In
  order to do this we will need to compute some integrals, and this we
  achieve using Laplace's method, which under our assumption of normality in
  the noise yields exact results. Finally, in order to apply this integration
  method we need to do <dfn|parameter inference>: for every hypothesis
  <math|\<cal-H\><rsub|k>>, compute (fit) the values for the weights which
  best explain the outputs <math|\<b-t\>> in some suitable sense (which will
  be the maximization of the <em|a posteriori> distribution).

  <section|Parameter inference><label|sec:parameter-inference>

  <\question>
    Given an hypothesis <math|\<cal-H\>> on how the output <math|\<b-t\>> is
    generated from the observed data <math|\<b-x\>> and some <em|a priori
    distribution> <math|p<around*|(|w\|\<cal-H\>|)>> on the set of parameters
    which govern the specific distribution, infer the correct posterior
    distribution <math|p<around*|(|w\|\<b-t\>,\<b-x\>,\<cal-H\>|)>> of the
    parameters given the data.
  </question>

  <\notation*>
    Since the observations <math|\<b-x\>> are always given and we will not be
    doing any inference on their distribution or future values, we will omit
    the vector <math|\<b-x\>> from the conditioning variables in the notation
    from here on. Thus, instead of <math|p<around*|(|w\|\<b-t\>,\<b-x\>,\<cal-H\>|)>>
    we will write <math|p<around*|(|w\|\<b-t\>,\<cal-H\>|)>>, instead of
    <math|p<around*|(|\<b-t\>\|\<b-x\>,w,\<cal-H\>|)>> we will write
    <math|p<around*|(|\<b-t\>\|w,\<cal-H\>|)>> and so on. In a similar manner
    we will often refer to the outputs <math|\<b-t\>> as the <dfn|data>, even
    though the whole data set includes <math|\<b-x\>> as well.
  </notation*>

  Solving this first question is a simple application of Bayes' rule:

  <\equation>
    <label|eq:param-inf-nonrec>p<around*|(|w\|\<b-t\>,\<cal-H\>|)>=<frac|p<around*|(|\<b-t\>\|w,\<cal-H\>|)>|p<around*|(|\<b-t\>\|\<cal-H\>|)>>*p<around*|(|w\|\<cal-H\>|)>.
  </equation>

  Because the normal is conjugate to itself, a convenient choice is
  <math|p<around*|(|w\|\<cal-H\>|)>=p<around*|(|w\|<text|no
  data>|)>\<sim\>\<cal-N\><around*|(|\<mu\><rsub|w>,\<sigma\><rsub|w><rsup|2>*Id|)>>
  and the new distribution will again be normal. We will be doing this later
  on, but other choices are possible! Notice that instead of just some
  numerical value for <math|w>, what we obtain using
  <eqref|eq:param-inf-nonrec> is <em|the full a posteriori distribution>,
  which is a host more information, and thanks to the use of a conjugate
  prior we have an explicit expression.

  As we have just seen, once we have all of the data <math|\<b-t\>> we can
  compute the posterior in <dfn|batch> mode, i.e. using all of the data.
  However, it is remarkable that parameter inference can be done iteratively
  (<dfn|online>), i.e. updated when a new data point <math|t<rprime|'>>
  arrives. The idea is that given the current dataset <math|\<b-t\>>, the
  corresponding posterior parameter distribution
  <math|p<around*|(|w\|\<b-t\>,\<cal-H\>|)>> is used as the <em|new prior>
  for <math|w>, when a new data point <math|t<rprime|'>> is available. So we
  want to obtain the posterior distribution
  <math|p<around*|(|w\|t<rprime|'>,\<b-t\>,\<cal-H\>|)>> as a function of
  <math|p<around*|(|w\|\<b-t\>,\<cal-H\>|)>>, and this is essentially the
  same computation as above:

  <\equation>
    <label|eq:param-inf>p<around*|(|w\|t<rprime|'>,\<b-t\>,\<cal-H\>|)>=<frac|p<around*|(|t<rprime|'>\|\<b-t\>,w,\<cal-H\>|)>*p<around*|(|w\|\<b-t\>,\<cal-H\>|)>|p<around*|(|t<rprime|'>\|\<b-t\>,\<cal-H\>|)>><above|=|<around*|(|\<ast\>|)>><frac|p<around*|(|t<rprime|'>\|w,\<cal-H\>|)>|p<around*|(|t<rprime|'>\|\<cal-H\>|)>>*p<around*|(|w\|\<b-t\>,\<cal-H\>|)>,
  </equation>

  which again will be normal, and where <math|<around*|(|\<ast\>|)>> is
  because of the independence of <math|t<rprime|'>> wrt. <math|\<b-t\>> given
  <math|w>. Also, <math|p<around*|(|t|)>> is constant in <math|w> so we may
  ignore it for the computation of the law, as long as we normalize at the
  end.

  Besides any possible reduction in computational cost, the real reason for
  doing parameter inference iteratively is that we can renormalize all terms
  after each step, so we will not run into machine precision problems.
  Consider equation <eqref|eq:param-inf-nonrec>: we will see in the next
  subsection that we do not need to calculate
  <math|p<around*|(|\<b-t\>\|\<cal-H\>|)>>, so we only compute
  <math|p<around*|(|\<b-t\>\|w,\<cal-H\>|)>*p<around*|(|w<around*|\||\<cal-H\>|\<nobracket\>>|)>>,
  but this is essentially <math|0> for any realistic size of dataset
  <math|\<b-t\>> and our parameter inference might fail. Done iteratively, we
  can divide by <math|p<around*|(|\<b-t\>\|\<cal-H\>|)>> at each step, which
  is just the normalization of the unnormalized density
  <math|p<around*|(|\<b-t\>\|w,\<cal-H\>|)>*p<around*|(|w<around*|\||\<cal-H\>|\<nobracket\>>|)>>
  and all numbers should stay inside machine precision boundaries.

  <subsection|Method and the difference between ML and MAP>

  From equations <eqref|eq:param-inf-nonrec> or <eqref|eq:param-inf> we see
  that starting with a prior distribution <math|p<around*|(|w\|\<cal-H\>|)>>
  on the possible parameter values <math|w> we can improve it using the
  acquired data <math|\<b-t\>>. It will be useful to define the following
  value for <math|w>. Let <math|W> be the parameter space corresponding to
  hypothesis <math|\<cal-H\>> (e.g. <math|W=\<bbb-R\><rsup|M>>). The
  <dfn|maximum a posteriori> parameter <math|w<rsub|MAP>> is

  <\equation>
    <label|eq:wmap>w<rsub|MAP>\<assign\><below|argmax|w\<in\>W>
    p<around*|(|\<b-t\>\|w,\<cal-H\>|)>*p<around*|(|w\|\<cal-H\>|)>=<below|argmax|w\<in\>W>
    p<around*|(|w\|\<b-t\>,\<cal-H\>|)>.
  </equation>

  This is the <em|parameter value at which the posterior distribution of
  <math|w> given the data attains its maximum.><\footnote>
    This is not to be confused with the <dfn|maximum likelihood> parameter
    <math|w<rsub|ML>>, which is defined as the <em|parameter value which best
    fits the data>: <math|w<rsub|ML>\<assign\>argmax<rsub|w\<in\>W>
    p<around*|(|\<b-t\>\|w,\<cal-H\>|)>>. Notice that
    <math|w<rsub|MAP>\<neq\>w<rsub|ML>> in general, especially when the best
    fit <math|w<rsub|ML>> is penalized by a small prior probability
    <math|p<around*|(|w<rsub|ML>\|\<cal-H\>|)>> in the computation of
    <math|w<rsub|MAP>>.
  </footnote> Bayesian reasoning uses the full distribution on <math|w> given
  the data and the MAP value to account for the priors we choose (and priors
  that were posteriors of past updates, see figure
  <reference|fig:priorSucc>).

  <big-figure|<with|gr-mode|<tuple|group-edit|move>|gr-frame|<tuple|scale|1cm|<tuple|0.519998gw|0.330016gh>>|gr-geometry|<tuple|geometry|13.0048cm|2.8011cm|center>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-arrow-end|\|\<gtr\>|gr-color|red|<graphics||<text-at|current
  posterior = (normalization) <math|\<cdot\>> likelihood <math|\<cdot\>>
  prior|<point|-3.5636162190766|0.985249371610001>>|<math-at|p<around*|(|w\|\<b-t\>,\<cal-H\>|)>=C\<cdot\>p<around*|(|\<b-t\>\|w,\<cal-H\>|)>\<cdot\>p<around*|(|w\|\<cal-H\>|)>|<point|-2.30595009105324|1.40291374520439>>|<math-at|p<around*|(|w\|\<cal-H\>|)>|<point|-6.3|1.4>>|<text-at|initial
  prior|<point|-6.6|1.0>>|<with|arrow-end|\|\<gtr\>|<line|<point|-4.7|1.5>|<point|-4.0|1.5>|<point|-2.8|1.5>>>|<math-at|p<around*|(|w\|\<b-t\>,t<rprime|'>,\<cal-H\>|)>=C<rprime|'>\<cdot\>p<around*|(|t<rprime|'>\|w,\<cal-H\>|)>\<cdot\><with|color|red|p<around*|(|w\|\<b-t\>,\<cal-H\>|)>>|<point|-2.29999786611986|-0.12176261238259>>|<text-at|current
  posterior = (normalization) <math|\<cdot\>> likelihood <math|\<cdot\>>
  prior|<point|-3.19999786611986|-0.52176261238259>>|<with|arrow-end|\|\<gtr\>|<line|<point|-4.69949786611986|-0.03982061238259>|<point|-2.79999786611986|-0.02176261238259>>>|<math-at|<with|color|red|p<around*|(|w\|\<b-t\>,\<cal-H\>|)>>|<point|-6.42806374785025|-0.136840665035057>>|<math-at|new
  prior|<point|-6.39999786611986|-0.52176261238259>>>>|<label|fig:priorSucc>Bayesian
  updating: posteriors become new priors>

  It makes sense to take priors into account: if your data <math|\<b-t\>>
  shows you consistent proof for a specific parameter value <math|w>, a
  single outlier <math|t<rprime|'>> should not change your estimate much,
  i.e. we are not looking for the best fit but for the best fit consistent
  with our prior knowledge.

  Finally note that we do not need to compute
  <math|p<around*|(|\<b-t\>\|\<cal-H\>|)>> since this is constant on
  <math|w>, as can be seen in the definition of <math|w<rsub|MAP>>. More
  precisely, <math|p<around*|(|\<b-t\>\|\<cal-H\>|)>> is the normalization
  for the unnormalized density <math|><math|w\<mapsto\>p<around*|(|\<b-t\>\|w,\<cal-H\>|)>*p<around*|(|w\|\<cal-H\>|)>>.

  <section|Model selection><label|sec:model-selection>

  In order to compare two models <math|\<cal-H\><rsub|1>,\<cal-H\><rsub|2>>
  given a dataset <math|\<b-t\>=<around*|{|t<rsub|1>,\<ldots\>,t<rsub|N>|}>>,
  we want to compute the ratio of the hypotheses' probability, i.e.

  <\equation>
    <label|eq:model-quotient><frac|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>|p<around*|(|\<cal-H\><rsub|2>\|\<b-t\>|)>>=<frac|p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>|p<around*|(|\<b-t\>\|\<cal-H\><rsub|2>|)>>*<frac|p<around*|(|\<cal-H\><rsub|1>|)>|p<around*|(|\<cal-H\><rsub|2>|)>>.
  </equation>

  Notice that, as in the case of batch parameter estimation this introduces a
  problem of machine precision. For any decent number of data points, any
  given dataset will have almost vanishing probability. This is true of any
  probability measure we choose but is most obviously seen e.g. if the data
  comes from the realization of i.i.d. random variables, since then
  <math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>=<big|prod><rsub|n=1><rsup|N>p<around*|(|t<rsub|n>\|\<cal-H\><rsub|k>|)>\<ll\>1>.
  Therefore the quotient above is roughly <math|0/0> and we have a problem.
  In parameter inference we solved that problem by doing iterative steps and
  renormalizing each time, but as we will see, this can not be done for model
  selection in general, at least in a naive way:

  <subsection|Why (naive) iterative model selection does not
  work><label|sec:why-not>

  The naive idea one (for example the authors of this manuscript) could have
  would be to implement an online version of model selection mimicking what
  we did in parameter estimation. Given a dataset
  <math|\<b-t\>=<around*|(|t<rsub|1>,\<ldots\>,t<rsub|N>|)>> and a new data
  point <math|t<rprime|'>=t<rsub|N+1>> we compute

  <\equation>
    <label|eq:model-update>p<around*|(|\<cal-H\><rsub|n>\|\<b-t\>,t<rprime|'>|)>=<frac|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|k>,\<b-t\>|)>*p<around*|(|\<cal-H\><rsub|k>\|\<b-t\>|)>|p<around*|(|t<rprime|'>\|\<b-t\>|)>><above|=|<around*|(|\<ast\>|)>><frac|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|k>|)>|p<around*|(|t<rprime|'>|)>>*p<around*|(|\<cal-H\><rsub|k>\|\<b-t\>|)>,
  </equation>

  where <math|<around*|(|\<ast\>|)>> would be deemed correct due to the
  independence of <math|t<rprime|'>> wrt. <math|\<b-t\>>, as, by
  independence:

  <\equation>
    <label|eq:independence>p<around*|(|t<rprime|'>\|\<cal-H\><rsub|k>,\<b-t\>|)>=<frac|p<around*|(|t<rprime|'>,\<b-t\>\|\<cal-H\><rsub|k>|)>|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>>=<frac|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|k>|)>*p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>>=p<around*|(|t<rprime|'>\|\<cal-H\><rsub|k>|)>.
  </equation>

  <with|ornament-shape|rounded|ornament-color|pastel red|<\ornamented>
    <\warning*>
      Formulas <eqref|eq:model-update> and <eqref|eq:independence> are wrong!
      For a intuitive example on why this is so, see section
      <reference|sec:modelselec>.
    </warning*>
  </ornamented>>

  The root of all evil is that

  <\equation*>
    p<around*|(|\<b-t\>,t<rprime|'>\|r,\<cal-H\><rsub|k>|)>=p<around*|(|\<b-t\>\|r,\<cal-H\><rsub|k>|)>*p<around*|(|t<rprime|'>\|r,\<cal-H\><rsub|k>|)>
  </equation*>

  but

  <\equation*>
    p<around*|(|\<b-t\>\<nocomma\>,t<rprime|'>\|\<cal-H\><rsub|k>|)>\<neq\>p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>*p<around*|(|t<rprime|'>\|\<cal-H\><rsub|k>|)>,
  </equation*>

  i.e. independence only holds conditional to a specific parameter value
  <math|r>.

  <\with|par-columns|2>
    Put in another way: when we decided that we would have a prior on the
    parameters and that the distribution of the observations would be given
    by conditional probabilities, we were saying that the joint distribution
    is

    <\equation>
      <label|eq:joint-data-params>p<around*|(|\<b-t\>,w|)>=p<around*|(|w|)>*<big|prod><rsub|n=1><rsup|N>p<around*|(|t<rsub|n>\|w|)>.
    </equation>

    This setting can be depicted as in Figure <reference|fig:indep>.

    <small-figure|<with|gr-mode|<tuple|group-edit|move>|gr-frame|<tuple|scale|1cm|<tuple|0.190029gw|0.509999gh>>|gr-geometry|<tuple|geometry|0.715222par|0.528109par|center>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-arrow-end|\<gtr\>|<graphics||<carc|<point|1.01349252596122|1.17367663447469>|<point|2.01349252596122|1.17367663447469>|<point|1.51349252596122|0.67367663447469>>|<with|fill-color|light
    grey|<carc|<point|-0.47905405377383|-1.04410316289901>|<point|0.52094594622617|-1.04410316289901>|<point|0.02094594622617|-0.64410316289901>>>|<with|text-at-valign|center|text-at-halign|center|<math-at|t<rsub|1>|<point|-0.638625005911|-0.626757927503637>>>|<with|text-at-valign|center|text-at-halign|center|<math-at|t<rsub|N>|<point|3.67785910664043|-0.596897038750807>>>|<with|fill-color|light
    grey|<carc|<point|2.52315946745244|-1.01040919158719>|<point|3.52315946745244|-1.01040919158719>|<point|3.02315946745244|-0.61040919158719>>>|<with|arrow-end|\<gtr\>|<line|<point|1.2|0.784161>|<point|0.25369001517449|-0.7>>>|<with|arrow-end|\<gtr\>|<line|<point|1.84571|0.8>|<point|2.8|-0.661545883459698>>>|<math-at|\<ldots\>|<point|1.33429347003572|-1.23449734753274>>|<math-at|w|<point|0.642347|1.47602>>>>|<label|fig:indep>Bayesian
    net for i.i.d. data>
  </with>

  Using now the product rule in <eqref|eq:joint-data-params>, we have
  <math|p<around*|(|\<b-t\>\|w|)>=<big|prod><rsub|n=1><rsup|N>p<around*|(|t<rsub|n>\|w|)>>,
  that is: the observations are <strong|conditionally independent> given the
  parameters (one writes <math|t<rsub|n>\<perp\>t<rsub|m>\|w>). However, if
  dispense with <math|w> by marginalizing
  <math|p<around*|(|\<b-t\>,w|)>=p<around*|(|\<b-t\>\|w|)>*p<around*|(|w|)>>
  over it we obtain

  <\equation*>
    p<around*|(|\<b-t\>|)>=<big|int><rsub|W>p<around*|(|\<b-t\>\|w|)>*p<around*|(|w|)>*\<mathd\>w\<neq\><big|prod><rsub|n=1><rsup|N>p<around*|(|t<rsub|n>|)>.
  </equation*>

  <subsection|Correct model selection>

  The proper way of doing model selection for a new data point involves
  considering the whole data <math|<around*|(|\<b-t\>,t<rprime|'>|)>> instead
  of using just the new datum <math|t<rprime|'>> to update the prior. For a
  feeling of why this is necessary see the remarks in section
  <reference|sec:modelselec>. As we can't do model selection iteratively, we
  will state the model selection formula as depending on the whole data
  <math|\<b-t\>>:

  <\equation>
    <label|eq:modelselec>p<around*|(|\<cal-H\><rsub|k>\|\<b-t\>|)>=<frac|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>*p<around*|(|\<cal-H\><rsub|k>|)>|p<around*|(|\<b-t\>|)>>=<frac|<big|int><rsub|W>p<around*|(|\<b-t\>\|w,\<cal-H\><rsub|k>|)>*p<around*|(|w\|\<cal-H\><rsub|k>|)>*\<mathd\>w|p<around*|(|\<b-t\>|)>>*p<around*|(|\<cal-H\><rsub|k>|)>.
  </equation>

  We can see in equation <eqref|eq:modelselec> that the a posteriori
  probability for <math|\<cal-H\><rsub|k>> only \Pimproves\Q if the data
  <math|\<b-t\>> are better explained by the specific hypothesis
  <math|\<cal-H\><rsub|k>> than they would be by just using the prior, i.e.
  if the ratio <math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>/p<around*|(|\<b-t\>|)>>
  is greater than one. The quantities in equation <eqref|eq:modelselec> are:

  <\itemize-dot>
    <item><math|p<around*|(|\<cal-H\><rsub|k>|)>> is the prior distribution
    for the <math|\<cal-H\><rsub|k>> (e.g. uniform).

    <item><math|p<around*|(|\<b-t\>|)>> is a quantity we won't have to
    compute (see below).

    <item><math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>> is the probability
    of the datum <math|\<b-t\>> being explained by <em|any possible choice of
    parameters in the model <math|\<cal-H\><rsub|k>>>. We call it the
    <dfn|evidence for <math|\<cal-H\><rsub|k>>>. We must integrate over
    parameter space in order to compute it:

    <\equation>
      <label|eq:datum-given-model>p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>=<big|int><rsub|W>p<around*|(|\<b-t\>\|w,\<cal-H\><rsub|k>|)>*p<around*|(|w\|\<cal-H\><rsub|k>|)>*\<mathd\>w.
    </equation>
  </itemize-dot>

  For the same reasons as in parameter inference, the denominator (in this
  case <math|p<around*|(|\<b-t\>|)>>) can be ignored: it is a normalization
  factor constant between all hypotheses. Hence we only need to find the
  numerator <math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>*p<around*|(|\<cal-H\><rsub|k>|)>=><math|<big|int>p<around*|(|\<b-t\>\|w,\<cal-H\><rsub|k>|)>*p<around*|(|w\|\<cal-H\><rsub|k>|)>*\<mathd\>w\<cdot\>p<around*|(|\<cal-H\><rsub|k>|)>>.
  Then we can normalize by <math|p<around*|(|\<b-t\>|)>=<big|sum><rsub|k>p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>*p<around*|(|\<cal-H\><rsub|k>|)>>.

  <\remark>
    The integral <eqref|eq:datum-given-model> is in general hard to compute.
    We could try to use MCMC, but given our assumptions of normality it is
    best to use Laplace's Method discussed below.
  </remark>

  <subsection|Laplace's method><label|sec:laplace-method>

  There is a way of tackling the integral in equation
  <eqref|eq:datum-given-model> and the denominator in the update term of
  parameter estimation in equation (<reference|eq:param-inf>). You can read
  the details in <cite|mackay_information_2005> (especially the great section
  about the interpretation of the \POccam factor\Q!), we will only collect
  the results:

  <\equation>
    <label|eq:laplace-method>p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>=<big|int><rsub|W>p<around*|(|\<b-t\>\|w,\<cal-H\><rsub|k>|)>*p<around*|(|w\|\<cal-H\><rsub|k>|)>\<nosymbol\>*<math-up|d>w\<approx\><frac|p<around*|(|\<b-t\>\|w<rsub|MAP>,\<cal-H\><rsub|k>|)>*p<around*|(|w<rsub|MAP>\|\<cal-H\><rsub|k>|)>|<sqrt|det<around*|(|A/2*\<mathpi\>|)>>>,
  </equation>

  where <math|w<rsub|MAP>=w<rsub|MAP><rsup|k>> is the maximum a posteriori
  parameter defined in <eqref|eq:wmap> and\ 

  <\eqnarray*>
    <tformat|<table|<row|<cell|A<rsub|>>|<cell|\<assign\>>|<cell|-\<nabla\><rsup|2><rsub|w>*ln
    p<around*|(|w\|\<b-t\>,\<cal-H\><rsub|k>|)><move|\|<rsub|w=w<rsub|MAP>>||-1.4spc>>>|<row|<cell|>|<cell|<above|=|<text|<eqref|eq:param-inf>>>>|<cell|<around*|[|-\<nabla\><rsub|w<rsub|>><rsup|2>*ln
    p<around*|(|\<b-t\>\|w,\<cal-H\><rsub|k>|)>-\<nabla\><rsub|w><rsup|2>*ln
    p<around*|(|w\|\<cal-H\><rsub|k>|)>|]><move|\|<rsub|w=w<rsub|MAP>>||-1.4spc>.<eq-number><label|eq:laplace-A>>>>>
  </eqnarray*>

  <section|An easy example: is this coin bent?>

  Consider a coin whose fairness is in doubt. We would like to infer the
  probability of it being fraudulent as well as its \Pbentness\Q.

  <subsection|Model>

  We will call the sides of the coin <math|1> and <math|0>. The result of
  flipping the coin is a random event independent from any past events. Our
  rivaling hypotheses are

  <\itemize>
    <item*|<math|\<cal-H\><rsub|0>>:>The coin is fair, i.e.
    <math|\<bbb-P\><around*|(|0|)>=\<bbb-P\><around*|(|1|)>=1/2.>

    <item*|<math|\<cal-H\><rsub|1>>:>The coin has been manipulated:
    <math|\<bbb-P\><around*|(|0|)> = r> and
    <math|\<bbb-P\><around*|(|1|)>=1-r>. We assume an initial non-committal
    distribution on <math|r>, i.e. the density of <math|r> is
    <math|p<around*|(|r\|\<cal-H\><rsub|1>|)>=1> on <math|<around*|[|0,1|]>>.
  </itemize>

  Initially, we consider both hypotheses as being identically probable, i.e.
  <math|\<bbb-P\><around*|(|\<cal-H\><rsub|k>|)>=1/2>.

  <\remark>
    Let us interpret the probabilities as statistics: Our prior on the
    hypotheses tells us that the experiment's conductor thinks that it is
    equally likely that he gets a bent coin or a fair coin. A person
    unfamiliar with casinos might use a different prior, e.g.
    <math|\<bbb-P\><around*|(|\<cal-H\><rsub|0>|)>=0.99.> If your beliefs are
    very strong at the beginning, the amount of data you need to change your
    mind is very large.\ 

    The prior on the parameter <math|r> is even more strongly debatable:
    assuming that a coin has been manipulated, we could think that the
    probability of <math|r> being <math|0.5> should be <math|0>. Also, if the
    manipulator does not want his forgery to be too easily detected, he is
    likely to be more prudent than to set <math|r=0> or <math|r=1>. Perhaps a
    double-peak distribution with maxima in <math|r=0.5\<pm\>0.03> might be a
    better prior (just out of experience and reasoning). For easier
    calculation, we will use a uniform prior on <math|r> but beware that
    Bayesian inference is all about your priors and beliefs about reality.
    Bayesian statistics states that <em|there is no such thing as objective
    inference>, just a correct propagation of belief states. In practice, in
    a lot of cases, different priors only change the speed of convergence of
    your inference and unless your initial distribution deems ranges of
    events as impossible (i.e. <math|p<around*|(|r\|\<cal-H\><rsub|1>|)>=0>
    for some <math|r>), collecting more and more data will yield similar
    conclusions between different priors.

    Also note that <math|\<cal-H\><rsub|1>> is a perfect super-hypothesis of
    <math|\<cal-H\><rsub|0>> in the sense that <math|\<cal-H\><rsub|0>> is
    included in <math|\<cal-H\><rsub|1>> (for <math|r=0.5>).
  </remark>

  As a function of the model (and its parameter, if it has any), we get the
  following coin event probability distributions:

  <\itemize>
    <item><math|p<around*|(|t=0\|\<cal-H\><rsub|0>|)>=<frac|1|2> =
    p<around*|(|t=1\|\<cal-H\><rsub|0>|)>>

    <item><math|p<around*|(|0\|r,\<cal-H\><rsub|1>|)>=r=:r<rsub|0>> and
    <math|p<around*|(|1\|r,\<cal-H\><rsub|1>|)>=1-r=:r<rsub|1>>
  </itemize>

  <subsection|Parameter inference>

  Now we try to infer the parameter <math|r> in model
  <math|\<cal-H\><rsub|1>> by throwing the coin and drawing conclusions from
  the outcome. Assume that we are in the middle of inference and we have the
  distribution of <math|r> given the data
  <math|\<b-t\>=<around*|(|t<rsub|1>,\<ldots\>,t<rsub|N>|)>>. As soon as the
  next data point <math|t<rprime|'>=t<rsub|N+1>\<in\><around*|{|0,1|}>>
  arrives, we have:

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|r\|\<b-t\>,t<rprime|'>,\<cal-H\><rsub|1>|)>>|<cell|=>|<cell|<frac|p<around*|(|t<rprime|'>\|r,\<cal-H\><rsub|1>|)>*p<around*|(|r\|\<b-t\>,\<cal-H\><rsub|1>|)>|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>|)>>>>|<row|<cell|>|<cell|=>|<cell|<frac|r<rsub|t<rprime|'>>|<big|int><rsub|0><rsup|1>p<around*|(|t<rprime|'>\|\<rho\>,\<cal-H\><rsub|1>|)>*p<around*|(|\<rho\>\|\<cal-H\><rsub|1>|)>*\<mathd\>\<rho\>>*p<around*|(|r\|\<b-t\>,\<cal-H\><rsub|1>|)>>>|<row|<cell|>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|<dfrac|r|<big|int><rsub|0><rsup|1>\<rho\>
    *\<mathd\>\<rho\>>*p<around*|(|r\|\<b-t\>,\<cal-H\><rsub|1>|)>\<nocomma\>>|<cell|=>|<cell|2*r*p<around*|(|r\|\<b-t\>,\<cal-H\><rsub|1>|)>>|<cell|<text|
    if >t<rprime|'>=0,>>|<row|<cell|<dfrac|1-r|<big|int><rsub|0><rsup|1><around*|(|1-\<rho\>|)>*\<mathd\>\<rho\>>*p<around*|(|r\|\<b-t\>,\<cal-H\><rsub|1>|)>>|<cell|=>|<cell|2*<around*|(|1-r|)>*p<around*|(|r\|\<b-t\>,\<cal-H\><rsub|1>|)>>|<cell|<text|
    if >t<rprime|'>=1.>>>>>>>>>
  </eqnarray*>

  For future use we note the following:

  <\equation>
    <label|eq:prob-datum-coin>p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>|)>=1/2=p<around*|(|t<rprime|'>\|\<cal-H\><rsub|0>|)>.
  </equation>

  Now that we have the updated parameter distribution we are interested in
  which model might be the most probable given the data.

  <subsection|Iterative model selection. Why it cannot
  work><label|sec:modelselec>

  If we try to infer the model iteratively from the data according to the
  (wrong) formula <eqref|eq:model-update>, we obtain using
  <eqref|eq:prob-datum-coin>:

  <\equation*>
    <frac|p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>,t<rprime|'>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>,t<rprime|'>|)>>=<frac|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|0>|)>|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>|)>>*<frac|p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>><above|=|<text|<eqref|eq:prob-datum-coin>>><frac|p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>>=\<ldots\>=<frac|p<around*|(|\<cal-H\><rsub|0>|)>|p<around*|(|\<cal-H\><rsub|1>|)>>,
  </equation*>

  which means that the result of model selection yields a prior independent
  from the data and this is clearly wrong. As we saw in Section
  <reference|sec:why-not>, the problem is that
  <math|p<around*|(|\<b-t\>\<nocomma\>,t<rprime|'>\|\<cal-H\><rsub|1>|)>\<neq\>p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>*p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>|)>>.
  To illustrate this consider <math|\<b-t\>=<around*|(|1,1,1,\<ldots\>,1|)>>
  (say <math|100> times). Then <math|r> will very probably be approximately
  <math|0> and <math|p<around*|(|\<b-t\>,t<rprime|'>\|\<cal-H\><rsub|1>|)>\<approx\>p<around*|(|\<b-t\>,t<rprime|'>\|r=0,\<cal-H\><rsub|1>|)>=1*p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>>,
  but <math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>*p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>|)>=0.5*p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>>.
  The idea is that the occurrence of <math|\<b-t\>> might set a strong bias
  for the possible values of <math|r> which in turn change the probability
  distribution of <math|t<rprime|'>>.

  <subsection|Model selection: \Pbatch\Q approach>

  The way to select the correct model is

  <\equation*>
    p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>=<frac|p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>*p<around*|(|\<cal-H\><rsub|1>|)>|p<around*|(|\<b-t\>|)>>=<frac|<big|int>p<around*|(|\<b-t\>\|r,\<cal-H\><rsub|1>|)>*p<around*|(|r\|\<cal-H\><rsub|1>|)>*\<mathd\>r|p<around*|(|\<b-t\>|)>>*p<around*|(|\<cal-H\><rsub|1>|)>
  </equation*>

  and

  <\equation*>
    p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>|)>=<frac|p<around*|(|\<b-t\>\|\<cal-H\><rsub|0>|)>|p<around*|(|\<b-t\>|)>>*p<around*|(|\<cal-H\><rsub|0>|)>.
  </equation*>

  The key is getting the evidences <math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>=><math|<big|int>p<around*|(|\<b-t\>\|r,\<cal-H\><rsub|1>|)>*p<around*|(|r\|\<cal-H\><rsub|1>|)>*\<mathd\>r>
  and <math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|0>|)>>, the remaining factors
  are the model priors (which are known) and <math|p<around*|(|\<b-t\>|)>>
  (which is just the normalization). The evidence for
  <math|\<cal-H\><rsub|0>> is easy: consider
  <math|\<b-t\>=<around*|(|t<rsub|1>,\<ldots\>,t<rsub|N>|)>>, then

  <\equation*>
    p<around*|(|\<b-t\>\|\<cal-H\><rsub|0>|)>=2<rsup|-N>.
  </equation*>

  To compute the evidence for <math|\<cal-H\><rsub|1>> define
  <math|h<around*|(|\<b-t\>|)> = <text|``amount of 0s in
  <math|\<b-t\>>''<math|.>>> Now <math|p<around*|(|\<b-t\>\|r,\<cal-H\><rsub|1>|)>=r<rsup|h<around*|(|\<b-t\>|)>>*<around*|(|1-r|)><rsup|N-h<around*|(|\<b-t\>|)>>>
  and using

  <\equation*>
    <big|int><rsub|0><rsup|1>r<rsup|k>*<around*|(|1-r|)><rsup|N-k>*\<mathd\>r=<frac|k!*<around*|(|N-k|)>!|<around*|(|N+1|)>!>=<frac|1|<around*|(|N+1|)>*<matrix|<tformat|<table|<row|<cell|N>>|<row|<cell|k>>>>>>,
  </equation*>

  we get

  <\equation>
    <label|eq:batchcoin><frac|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>|p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>|)>>=<frac|<big|int><rsub|0><rsup|1>r<rsup|h<around*|(|\<b-t\>|)>>*<around*|(|1-r|)><rsup|N-h<around*|(|\<b-t\>|)>>*\<mathd\>r|2<rsup|-N>>*<frac|p<around*|(|\<cal-H\><rsub|1>|)>|p<around*|(|\<cal-H\><rsub|0>|)>>=<frac|p<around*|(|\<cal-H\><rsub|1>|)>*2<rsup|N>|p<around*|(|\<cal-H\><rsub|0>|)>*<around*|(|N+1|)>*<matrix|<tformat|<table|<row|<cell|N>>|<row|<cell|h<around*|(|\<b-t\>|)>>>>>>>
  </equation>

  This shows a classic problem of this kind of methods: the numbers involved
  grow quickly and exact computation becomes unfeasible.

  Consider the example of a fair coin: For the case
  <math|h<around*|(|\<b-t\>|)>\<simeq\>N/2> use Stirling's formula
  <math|n!\<simeq\><sqrt|2*\<mathpi\>*n>*<around*|(|n/\<mathe\>|)><rsup|n>>
  and see

  <\eqnarray*>
    <tformat|<table|<row|<cell|<frac|2<rsup|N>|<around*|(|N+1|)>*<matrix|<tformat|<table|<row|<cell|N>>|<row|<cell|h<around*|(|\<b-t\>|)>>>>>>>>|<cell|\<simeq\>>|<cell|<frac|2<rsup|N>*<around*|[|<sqrt|2*\<pi\>*<frac|N|2>>*<around*|(|<frac|N|2*e>|)><rsup|<frac|N|2>>|]><rsup|2>|<sqrt|2*\<pi\>*<frac|N+1|2>>*<around*|(|<frac|N+1|e>|)><rsup|N+1>>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|<frac|<sqrt|\<pi\>>|<sqrt|N+1>>>>|<row|<cell|>|<cell|\<simeq\>>|<cell|O<around*|(|<frac|1|<sqrt|N>>|)>,>>>>
  </eqnarray*>

  so the hypothesis <math|\<cal-H\><rsub|0>> becomes probable with speed
  <math|N<rsup|-1/2>> if there is no specific evidence for
  <math|\<cal-H\><rsub|1>>.

  <big-figure|<image|coins1000dot55.eps|0.8par|||>|Model selection for a bent
  coin (<math|p<around*|(|<text|``Heads''>|)>=0.55>) for 1000 tosses.
  Initially, the slight imbalance between the number of heads and tails can
  be explained perfectly by a fair coin, so this hypothesis is strongly
  supported. After <math|600> tosses, the probability that the coin is in
  fact bent gets more and more support.>

  <subsection|Model selection: Quasi-iterative approach>

  We showed in sections <reference|sec:why-not> and
  <reference|sec:modelselec> why iterative methods cannot work in a strict
  sense. There is a way which still uses only computationally feasible terms
  by taking a clever updating approach possible because one can explicitly
  compute the integrals involved. Let <math|\<b-t\>=<around*|(|0,0,1,0,1,0,0,\<ldots\>|)>>
  be a data vector with <math|0> being heads and <math|1> being tails. Assume
  that the length of <math|\<b-t\>> is <math|N> and the number of <math|0>s
  is <math|K>. Now a new data point <math|t<rprime|'>> arrives, which is
  either <math|0> or <math|1>. We write <math|K<rprime|'>> for the number of
  <math|0s> after arrival of <math|t<rprime|'>>, so
  <math|K<rprime|'>\<in\><around*|{|K,K+1|}>>. Then

  <\equation>
    <label|eq:recursive><frac|p<around*|(|\<cal-H\><rsub|0><around*|\||\<b-t\>,t<rprime|'>|\<nobracket\>>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>,t<rprime|'>|)>>=<frac|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|0>,\<b-t\>|)>|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>,\<b-t\>|)>>\<cdot\><frac|p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>>
  </equation>

  The last term is the prior version of the left hand side fraction. Thus,
  the term <math|<frac|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|0>,\<b-t\>|)>|p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>,\<b-t\>|)>>>
  is an update term we can use. First,

  <\equation*>
    p<around*|(|t<rprime|'>\|\<cal-H\><rsub|0>,\<b-t\>|)>=p<around*|(|t<rprime|'>\|\<cal-H\><rsub|0>|)>=<frac|1|2>.
  </equation*>

  Then

  <\equation>
    <label|eq:update>p<around*|(|t<rprime|'>\|\<cal-H\><rsub|1>,\<b-t\>|)>=<frac|p<around*|(|t<rprime|'>,\<b-t\>\|\<cal-H\><rsub|1>|)>|p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>>
  </equation>

  We expand to calculate\ 

  <\equation*>
    p<around*|(|\<b-t\>\|\<cal-H\><rsub|1>|)>=<big|int><rsub|0><rsup|1>p<around*|(|\<b-t\>\|r,\<cal-H\><rsub|1>|)>*p<around*|(|r\|\<cal-H\><rsub|1>|)>*\<mathd\>r=<big|int><rsub|0><rsup|1>r<rsup|K>*<around*|(|1-r|)><rsup|N-K>*\<mathd\>r=<frac|1|<around*|(|N+1|)>*<matrix|<tformat|<table|<row|<cell|N>>|<row|<cell|K>>>>>>
  </equation*>

  and

  <\equation*>
    p<around*|(|t<rprime|'>,\<b-t\>\|\<cal-H\><rsub|1>|)>=<big|int><rsub|0><rsup|1>r<rsup|K<rprime|'>>*<around*|(|1-r|)><rsup|N+1-K<rprime|'>>*\<mathd\>r=<frac|1|<around*|(|N+2|)>*<matrix|<tformat|<table|<row|<cell|N+1>>|<row|<cell|K<rprime|'>>>>>>>.
  </equation*>

  Combining this with <eqref|eq:update> and <eqref|eq:recursive>, we obtain

  <\equation*>
    <label|eq:iterativecoin><frac|p<around*|(|\<cal-H\><rsub|0><around*|\||\<b-t\>,t<rprime|'>|\<nobracket\>>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>,t<rprime|'>|)>>=<choice|<tformat|<table|<row|<cell|<with|math-display|true|<frac|N+2|2*K+2>*<frac|p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>>>>|<cell|<text|if>>|<cell|t<rprime|'>=0,>>|<row|<cell|<with|math-display|true|<frac|N+2|2*<around*|(|N+1-K|)>>*<frac|p<around*|(|\<cal-H\><rsub|0>\|\<b-t\>|)>|p<around*|(|\<cal-H\><rsub|1>\|\<b-t\>|)>>>>|<cell|<text|if>>|<cell|t<rprime|'>=1.>>>>>
  </equation*>

  This means that we do not need to save the exact data vector but just the
  number of heads and tails to apply a recursive-type model selection
  approach. Also, in comparison with formula (<reference|eq:batchcoin>), we
  will not run into computational overflow as there are no exponentially
  growing terms.

  <section|Influence of the race on the imposition of the death penalty>

  Consider exercise 28.4 in <cite|mackay_information_2005>. Here Occam's
  razor yields a tool of analyzing whether there is evidence for racial
  discrimination in the data given. Consider the events\ 

  <\itemize>
    <item><math|V>: The victim is white (and <math|V<rsup|C>>: The victim is
    black)

    <item><math|M>: The defendant is white (and <math|M<rsup|C>>: The
    defendant is black)

    <item><math|D>: The defendant gets sentenced to death
  </itemize>

  The hypotheses we will look at are

  <\itemize>
    <item><math|\<cal-H\><rsub|00>:>Neither the victim's nor the defendant's
    race has influence on the probability of the defendant getting the death
    penalty, i.e.

    <\equation*>
      p<around*|(|D|)> = \<tau\>.
    </equation*>

    <item><math|\<cal-H\><rsub|10>>: Only the victim's race influences the
    death penalty probability:

    <\equation*>
      p<around*|(|D\|V|)>=\<tau\>\<comma\><space|1em>p<around*|(|D\|V<rsup|C>|)>=\<chi\>.
    </equation*>

    <item><math|\<cal-H\><rsub|01>>: Only the defendant's race influences the
    death penalty probability:

    <\equation*>
      p<around*|(|D\|M|)>=\<tau\>\<nocomma\>,<separating-space|1em>p<around*|(|D\|M<rsup|C>|)>=\<chi\>.
    </equation*>

    <item><math|\<cal-H\><rsub|11>>: Both victim's and defendant's race
    influence the death penalty probability:

    <\equation*>
      p<around*|(|D\|V,M|)>=\<tau\>\<nocomma\>\<comma\><space|1em>p<around*|(|D\|V<rsup|C>,M|)>=\<chi\>,<space|1em>p<around*|(|D\|V,M<rsup|C>|)>=\<rho\>,<space|1em>p<around*|(|D\|V<rsup|C>,M<rsup|C>|)>=\<sigma\>.
    </equation*>
  </itemize>

  We will always assume uniform priors of all parameters
  <math|\<tau\>\<nocomma\>> etc. for every hypothesis.

  \;

  For convenience we start with the log probabilities:

  <\eqnarray*>
    <tformat|<table|<row|<cell|ln p<around*|(|\<b-t\>\|\<tau\>,\<cal-H\><rsub|00>|)>>|<cell|=>|<cell|<around*|(|19+11+6|)>*ln<around*|(|\<tau\>|)>+<around*|(|132+9+52+97|)>*ln<around*|(|1-\<tau\>|)>>>|<row|<cell|ln
    p<around*|(|\<b-t\>\|\<tau\>,\<chi\>,\<cal-H\><rsub|10>|)>>|<cell|=>|<cell|<around*|(|19+11|)>*ln<around*|(|\<tau\>|)>+<around*|(|132+52|)>*ln<around*|(|1-\<tau\>|)>>>|<row|<cell|>|<cell|>|<cell|+6*ln<around*|(|\<chi\>|)>+<around*|(|9+97|)>*ln<around*|(|1-\<chi\>|)>>>|<row|<cell|ln
    p<around*|(|\<b-t\>\|\<tau\>,\<chi\>,\<cal-H\><rsub|01>|)>>|<cell|=>|<cell|19*ln<around*|(|\<tau\>|)>+<around*|(|132+9|)>*ln<around*|(|1-\<tau\>|)>>>|<row|<cell|>|<cell|>|<cell|+<around*|(|11+6|)>*ln<around*|(|\<chi\>|)>+<around*|(|52+97|)>*ln<around*|(|1-\<chi\>|)>>>|<row|<cell|ln
    p<around*|(|\<b-t\>\|\<tau\>,\<chi\>,\<rho\>,\<sigma\>,\<cal-H\><rsub|11>|)>>|<cell|=>|<cell|19*ln<around*|(|\<tau\>|)>+132*ln<around*|(|1-\<tau\>|)>>>|<row|<cell|>|<cell|>|<cell|+0*ln<around*|(|\<chi\>|)>+9*ln<around*|(|1-\<chi\>|)>>>|<row|<cell|>|<cell|>|<cell|+11*ln<around*|(|\<rho\>|)>+52*ln<around*|(|1-\<rho\>|)>>>|<row|<cell|>|<cell|>|<cell|+6*ln<around*|(|\<sigma\>|)>+97*ln<around*|(|1-\<sigma\>|)>.>>>>
  </eqnarray*>

  As our priors are uniform, the MAP parameters are the ML parameters which
  in turn are

  <\itemize>
    <item><math|\<cal-H\><rsub|00>>: <math|\<tau\><rsub|MAP>=<frac|19+11+6|19+11+6+132+9+52+97>\<approx\>0.1104>.

    <item><math|\<cal-H\><rsub|10>>: <math|\<tau\><rsub|MAP>=
    <frac|19+11|19+11+132+52>\<approx\>0.1402> and
    <math|\<chi\><rsub|MAP>=<frac|6|6+9+97>\<approx\>0.0536>.

    <item><math|\<cal-H\><rsub|01>>: <math|\<tau\><rsub|MAP>=<frac|19|19+132+9>\<approx\>0.1187>
    and <math|\<chi\><rsub|MAP>=<frac|11+6|11+6+52+97>\<approx\>0.1024>.

    <item><math|\<cal-H\><rsub|11>>: <math|\<tau\><rsub|MAP>=<frac|19|19+132>\<approx\>0.1258>,
    <math|\<chi\><rsub|MAP>=0>, <math|\<rho\><rsub|MAP>=<frac|11|11+52>\<approx\>0.1746>
    and

    <math|\<sigma\><rsub|MAP>=<frac|6|6+97>\<approx\>0.0583>.
  </itemize>

  One can observe that when the victim was white and the murderer black,
  there was a <math|17.46> percent probability of the defendant being
  sentenced to death whereas the opposite combination did not lead to any
  single death penalty sentence.

  Recall (<math|w> being the abstract parameter variable)

  <\equation*>
    p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>=<big|int>p<around*|(|\<b-t\>\|w,\<cal-H\><rsub|k>|)>*p<around*|(|w\|\<cal-H\><rsub|k>|)>d
    w\<approx\><frac|p<around*|(|\<b-t\>\|w<rsub|MAP>,\<cal-H\><rsub|k>|)>*p<around*|(|w<rsub|MAP>\|\<cal-H\><rsub|k>|)>|<sqrt|det<around*|(|A/2*\<pi\>|)>>>
  </equation*>

  where <math|A = -\<nabla\><rsub|w><rsup|2>ln
  p<around*|(|\<b-t\>\|w,\<cal-H\><rsub|k>|)>-\<nabla\><rsub|w><rsup|2>ln
  p<around*|(|w\|\<cal-H\><rsub|k>|)>>, where the latter term is zero in our
  case as we have uniform priors. The individual matrices <math|A> are:

  <\eqnarray*>
    <tformat|<table|<row|<cell|A<rsub|00>>|<cell|=>|<cell|<frac|36|\<tau\><rsup|2>>+<frac|290|<around*|(|1-\<tau\>|)><rsup|2>>>>|<row|<cell|A<rsub|10>>|<cell|=>|<cell|diag<around*|(|<frac|30|\<tau\><rsup|2>>+<frac|184|<around*|(|1-\<tau\>|)><rsup|2>>,<frac|6|\<chi\><rsup|2>>+<frac|106|<around*|(|1-\<chi\>|)><rsup|2>>|)>>>|<row|<cell|A<rsub|01>>|<cell|=>|<cell|diag<around*|(|<frac|19|\<tau\><rsup|2>>+<frac|141|<around*|(|1-\<tau\>|)><rsup|2>>,<frac|17|\<chi\><rsup|2>>+<frac|149|<around*|(|1-\<chi\>|)><rsup|2>>|)>>>|<row|<cell|A<rsub|11>>|<cell|=>|<cell|diag<around*|(|<frac|19|\<tau\><rsup|2>>+<frac|132|<around*|(|1-\<tau\><rsup|2>|)>>,<frac|9|<around*|(|1-<rsup|>\<chi\>|)><rsup|2>>,<frac|11|\<rho\><rsup|2>>+<frac|52|<around*|(|1-\<rho\>|)><rsup|2>>,<frac|6|\<sigma\><rsup|2>>+<frac|97|<around*|(|1-\<sigma\>|)><rsup|2>>|)>.>>>>
  </eqnarray*>

  Then the evidence for each model is (read subscript \PMAP\Q for each
  parameter)

  <\itemize>
    <\eqnarray*>
      <tformat|<table|<row|<cell|p<around*|(|\<b-t\>\|\<cal-H\><rsub|00>|)>>|<cell|\<approx\>>|<cell|<frac|\<tau\><rsup|36>*<around*|(|1-\<tau\>|)><rsup|290>|<sqrt|det<around*|(|A<rsub|00>/2*\<pi\>|)>>>>>|<row|<cell|>|<cell|\<approx\>>|<cell|2.8313\<cdot\>10<rsup|-51>>>|<row|<cell|p<around*|(|\<b-t\>\|\<cal-H\><rsub|10>|)>>|<cell|\<approx\>>|<cell|<frac|\<tau\><rsup|30>*<around*|(|1-\<tau\>|)><rsup|184>*\<chi\><rsup|6>*<around*|(|1-\<chi\>|)><rsup|106>|<sqrt|det<around*|(|A<rsub|10>/2*\<pi\>|)>>>>>|<row|<cell|>|<cell|\<approx\>>|<cell|4.698\<cdot\>10<rsup|-51>>>|<row|<cell|p<around*|(|\<b-t\>\|\<cal-H\><rsub|01>|)>>|<cell|\<approx\>>|<cell|<frac|\<tau\><rsup|19>*<around*|(|1-\<tau\>|)><rsup|141>*\<chi\><rsup|17>*<around*|(|1-\<chi\>|)><rsup|149>|<sqrt|det<around*|(|A<rsub|01>/2*\<pi\>|)>>>>>|<row|<cell|>|<cell|\<approx\>>|<cell|2.7485\<cdot\>10<rsup|-51>>>|<row|<cell|p<around*|(|\<b-t\>\|\<cal-H\><rsub|11>|)>>|<cell|\<approx\>>|<cell|<frac|\<tau\><rsup|19>*<around*|(|1-\<tau\>|)><rsup|132>*\<chi\><rsup|0>*<around*|(|1-\<chi\>|)><rsup|9>*\<rho\><rsup|11>*<around*|(|1-\<rho\>|)><rsup|52>*\<sigma\><rsup|6>*<around*|(|1-\<sigma\>|)><rsup|97>|<sqrt|det<around*|(|A<rsub|11>/2*\<pi\>|)>>>>>|<row|<cell|>|<cell|\<approx\>>|<cell|1.4875\<cdot\>10<rsup|-51>.>>>>
    </eqnarray*>
  </itemize>

  As <math|<big|sum><rsub|i,j=0><rsup|1>p<around*|(|\<cal-H\><rsub|i,j>\|\<b-t\>|)>=1,>and
  assuming non-committal priors <math|p<around*|(|\<cal-H\><rsub|i,j>|)>=<frac|1|4>>
  for <math|i,j=0,1>, we obtain

  <\eqnarray*>
    <tformat|<table|<row|<cell|p<around*|(|\<cal-H\><rsub|00>\|\<b-t\>|)>>|<cell|\<approx\>>|<cell|0.24,>>|<row|<cell|p<around*|(|\<cal-H\><rsub|10>\|\<b-t\>|)>>|<cell|\<approx\>>|<cell|0.40,>>|<row|<cell|p<around*|(|\<cal-H\><rsub|01>\|\<b-t\>|)>>|<cell|\<approx\>>|<cell|0.23,>>|<row|<cell|p<around*|(|\<cal-H\><rsub|11>\|\<b-t\>|)>>|<cell|\<approx\>>|<cell|0.13.>>>>
  </eqnarray*>

  Hence, the hypothesis <math|\<cal-H\><rsub|10>> stating that the race of
  the victim is contributing to the probability of a murderer getting
  sentenced to death is the most probable from a Bayesian point of view
  <em|given the priors we had.>

  <section|Bayesian Model Selection for Linear Regression>

  <subsection|Setting>

  We will consider the following polynomial hypotheses:\ 

  <\equation*>
    \<cal-H\><rsub|k><rsup|P>:<space|1em>t<rsub|n>=w<rsub|0>+w<rsub|1>*x<rsub|n>+\<cdots\>+w<rsub|k-1>*x<rsub|n><rsup|k-1>+\<varepsilon\><rsub|n>,<space|1em>n=1,\<ldots\>,N,k=1,\<ldots\>,K.
  </equation*>

  For the following we can just as well use different hypothesis spaces as
  for example trigonometric functions:

  <\equation*>
    \<cal-H\><rsub|k><rsup|T>:<space|1em>t<rsub|n>=<big|sum><rsub|j=1><rsup|k>cos<around*|(|j*\<pi\>*x<rsub|n>|)>+sin<around*|(|j*\<pi\>*x<rsub|n>|)>+\<varepsilon\><rsub|n>,<space|1em>n=1,\<ldots\>,N,k=1,\<ldots\>,K
  </equation*>

  For the sake of concreteness, we will state everything for the example of
  polynomial functions, but everything can be generalized to generic function
  spaces.

  Let <math|\<varepsilon\><rsub|n>\<sim\>\<cal-N\><around*|(|0,\<sigma\><rsup|2>|)>>
  i.i.d. where <math|\<sigma\>> is a known noise parameter (for this
  application we will not infer the noise from the data although this can be
  done). For brevity we denote

  <\equation*>
    \<Phi\><rsub|k><around*|(|x<rsub|n>|)>=<around*|(|1,x,x<rsup|2>,\<ldots\>,x<rsup|k-1>|)>
  </equation*>

  and the full data matrix is

  <\equation*>
    \<Phi\><rsub|k>=<matrix|<tformat|<table|<row|<cell|\<Phi\><rsub|k><around*|(|x<rsub|1>|)>>>|<row|<cell|\<vdots\>>>|<row|<cell|\<Phi\><rsub|k><around*|(|x<rsub|N>|)>>>>>>=<matrix|<tformat|<table|<row|<cell|1>|<cell|x<rsub|1>>|<cell|x<rsub|1><rsup|2>>|<cell|\<cdots\>>|<cell|x<rsub|1><rsup|k-1>>>|<row|<cell|1>|<cell|x<rsub|2>>|<cell|x<rsub|2><rsup|2>>|<cell|\<cdots\>>|<cell|x<rsub|2><rsup|k-1>>>|<row|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<vdots\>>|<cell|\<ddots\>>|<cell|\<vdots\>>>|<row|<cell|1>|<cell|x<rsub|N>>|<cell|x<rsub|N><rsup|2>>|<cell|\<cdots\>>|<cell|x<rsub|N><rsup|k-1>>>>>>.
  </equation*>

  Then

  <\equation*>
    p<around*|(|t<rsub|n>\|\<b-w\>,\<cal-H\><rsub|k>|)>=\<cal-N\><around*|(|\<b-w\><rsup|\<top\>>*\<Phi\><rsub|k><around*|(|x<rsub|n>|)><rsup|\<top\>>,\<sigma\><rsup|2>|)>.
  </equation*>

  We assume the prior model probabilities to be equal, i.e.
  <math|p<around*|(|\<cal-H\><rsub|k>|)>=1/K.> The parameters will be
  distributed normally, i.e. the density of the parameter vector
  <math|\<b-w\>> is

  <\equation*>
    p<around*|(|\<b-w\>\|\<cal-H\><rsub|k>|)>=\<cal-N\><around*|(|\<b-0\>,\<sigma\><rsub|w><rsup|2>*Id<rsub|k>|)>.
  </equation*>

  <subsection|Iterative parameter estimation>

  As explained in Section <reference|sec:parameter-inference>, to avoid
  numerical problems we will proceed iteratively. In step <math|n\<gtr\>1> we
  use the parameter estimate given by the posterior
  <math|p<around*|(|\<b-w\>\|t<rsub|1>,\<ldots\>,t<rsub|n-1>,\<cal-H\><rsub|k>|)>>
  coming from step <math|n-1> as the new prior, and for <math|n=1> we have
  the prior <math|p<around*|(|\<b-w\><mid|\|>\<cal-H\><rsub|k>|)>>. The
  likelihood for the new data point <math|t<rsub|n>> is also known:

  <\equation*>
    p<around*|(|t<rsub|n>\|\<b-w\>,\<cal-H\><rsub|k>|)>=\<cal-N\><around*|(|\<b-w\><rsup|\<top\>>*\<Phi\><rsub|k><around*|(|x<rsub|n>|)>,\<sigma\><rsup|2>|)>.
  </equation*>

  Then

  <\equation*>
    p<around*|(|\<b-w\>\|t<rsub|n>,\<cal-H\><rsub|k>|)>=<frac|p<around*|(|t<rsub|n>\|\<b-w\>,\<cal-H\><rsub|k>|)>*p<around*|(|\<b-w\>\|\<cal-H\><rsub|k>|)>|p<around*|(|t<rsub|n>\|\<cal-H\><rsub|k>|)>>
  </equation*>

  and (cf. <eqref|eq:wmap>)

  <\equation*>
    \<b-w\><rsub|MAP>=<below|argmax|\<b-w\>\<in\>W<rsub|k>>
    p<around*|(|\<b-w\>\|t<rsub|n>,\<cal-H\><rsub|k>|)>=<below|argmax|\<b-w\>\<in\>W<rsub|k>>
    p<around*|(|t<rsub|n>\|\<b-w\>,\<cal-H\><rsub|k>|)>*p<around*|(|\<b-w\>\|\<cal-H\><rsub|k>|)>.
  </equation*>

  As all distributions are Gaussian, the parameter estimation is easy (see
  for example <cite|bishop_pattern_2006>) and will not be done here.

  <subsection|Model selection>

  As explained in Section <reference|sec:model-selection>, model selection
  works by ordering the hypotheses according to their a posteriori
  probability

  <\equation*>
    p<around*|(|\<cal-H\><rsub|k>\|\<b-t\>|)>=<frac|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>|p<around*|(|\<b-t\>|)>>*p<around*|(|\<cal-H\><rsub|k>|)>.
  </equation*>

  This is done by ranking their evidence <math|p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>>,
  computed using Laplace's method (see Section
  <reference|sec:laplace-method>) as

  \;

  <\equation*>
    p<around*|(|\<b-t\>\|\<cal-H\><rsub|k>|)>=<big|int><rsub|W<rsub|k>>p<around*|(|\<b-t\>\|\<b-w\>,\<cal-H\><rsub|k>|)>*p<around*|(|\<b-w\>\|\<cal-H\><rsub|k>|)>\<nosymbol\>*<math-up|d>\<b-w\>\<approx\><frac|p<around*|(|\<b-t\>\|\<b-w\><rsub|MAP>,\<cal-H\><rsub|k>|)>*p<around*|(|\<b-w\><rsub|MAP>\|\<cal-H\><rsub|k>|)>|<sqrt|det<around*|(|A/2\<pi\>|)>>>,
  </equation*>

  where <math|\<b-w\><rsub|MAP>> is given by <eqref|eq:wmap> and <math|A> is
  given by <eqref|eq:laplace-A>. The log-likelihood of the data is

  <\equation*>
    ln p<around*|(|\<b-t\>\|\<b-w\>,\<cal-H\><rsub|k>|)>=C-<frac|<big|sum><rsub|n=1><rsup|N><around*|[|t<rsub|n>-\<b-w\><rsup|\<top\>>*\<Phi\><rsub|k><around*|(|x<rsub|n>|)>|]><rsup|2>|2*\<sigma\><rsup|2>>
  </equation*>

  and the log of the posterior is

  <\equation*>
    ln p<around*|(|\<b-w\>\|\<cal-H\><rsub|k>|)>=C-<frac|\<b-w\><rsup|\<top\>>\<b-w\>|2*\<sigma\><rsub|w><rsup|2>>,
  </equation*>

  so that

  <\equation*>
    A<rsub|j\<nocomma\>l>=<frac|<big|sum><rsub|n=1><rsup|N><around*|[|\<Phi\><rsub|k><around*|(|x<rsub|n>|)>|]><rsub|j>*<around*|[|\<Phi\><rsub|k><around*|(|x<rsub|n>|)>|]><rsub|l>|\<sigma\><rsup|2>>+<frac|\<delta\><rsub|j\<nocomma\>l>|\<sigma\><rsub|w><rsup|2>>.
  </equation*>

  Hence:

  <\equation*>
    A=<frac|\<Phi\><rsup|\<top\>>*\<Phi\>|\<sigma\><rsup|2>>+<frac|Id|\<sigma\><rsub|w><rsup|2>>
  </equation*>

  where <math|<around*|[|\<Phi\><rsub|k><around*|(|x<rsub|n>|)>|]><rsub|l>>
  is the <math|l>-th entry of the vector <math|\<Phi\><rsub|k><around*|(|x<rsub|n>|)>>
  and <math|\<delta\><rsub|j\<nocomma\>l>> is the Kronecker delta function.
  We see that in this case <math|A> is independent of the choice
  <math|\<b-w\>=\<b-w\><rsub|MAP>>. We can now use the
  <math|\<b-w\><rsub|MAP>> obtained iteratively to compute the numerator of
  the evidence approximation.

  Notice that in this particular case the structure of <math|A> is such that
  we can actually do model selection iteratively as
  <math|A<rsub|j\<nocomma\>l>> can be easily obtained from a smaller dataset
  (for example <math|N-1> instead of <math|N>).

  <section|Simulation results>

  We now discuss three examples of the results shown by our code.<\footnote>
    We implemented the algorithms discussed in <name|Python> using
    <name|numpy> and <name|matplotlib>. The code as well as the source for
    this document are freely available at
    <hlink|github.com/mdbenito/ModelSelection|https://github.com/mdbenito/ModelSelection>.
  </footnote> To this purpose we always use two plots: the top one displays
  the whole data as red dots and the fitted model functions in lines of
  various colors. We can already see that some models fit better than others.
  However, to avoid overfitting we will not always use the best-fitting model
  but instead rely on Bayesian model selection.

  The bottom plot shows the probability for each of the models given the data
  up to the time given on the <math|x>-axis. The red dots appear in exactly
  the order in which they go from left to right. This means that a specific
  point in the bottom plot corresponds to the whole range of intermediate
  data up to that position.

  <subsection|Low noise, quadratic growth data>

  Figure <reference|im:fig1> shows an example of a slight quadratic growth.
  The first 10 data points could be attributed to a constant model and some
  noise, so Bayesian model selection picks that (the blue curve is on top).
  After another 10 data points, the constant model cannot hold anymore so
  there is a fight between order 1 and order 2 polynomials. Order 1
  polynomials are \Psimpler\Q but order 2 polynomials fit the slight
  convexity better, hence the algorithm is indifferent for some time until
  the convexity becomes too big (around datapoint no. 25) to ignore and model
  Poly2 wins finally.

  <big-figure|<image|ex1.png|1par|||>| <label|im:fig1>Data generated by a
  polynomial of order 2.>

  <subsection|High noise, long range oscillating data>

  In the dataset of figure <reference|im:fig2> we see a sinusoidal function
  generating the data (Trig3). The optical match is best for Trig3 and Trig7
  although the latter is not preferred by the algorithm as it is too
  complicated and gets penalized by the Occam factor. In the bottom plot we
  see the algorithm choosing first a constant model which is very simple and
  explains the data well enough. As soon as the data shows consistent
  oscillation with some particular frequency (this is actually even hard to
  see with the naked eye due to the noise disturbing the result!), the
  \ algorithm correctly classifies the data as being generated by a lower
  order trigonometric function.

  <big-figure|<image|ex2.png|1par|||>|<label|im:fig2>Trigonometric data
  generator, high noise and long time-scale.>

  <subsection|Low noise, short range oscillatory data>

  In figure <reference|im:fig3> we see another Trig3 model generating data
  but with a lot less noise. This leads to another interesting phenomenon:
  After a short timespan where the constant model is deemed plausible, the
  linear polynomial Poly1 becomes popular as it explains the linear growth in
  the first quarter of the sinusoidal function's cycle well. As soon as the
  oscillation moves back down the quadratic Polynomial Poly2 is better suited
  for the data, but the next change of direction strengthens the Trig3
  hypothesis. Due to a particular strange noise event around the 45th data
  point, Trig3, Poly2 and Poly3 are all seen as approximately similarly
  likely until the full cycle of the sinusoidal conclusively elects Trig3 as
  the most probable hypothesis.

  <big-figure|<image|ex3.png|1par|||>|<label|im:fig3>Trigonometric data
  generator, low noise and long time-scale>

  <\bibliography|bib|tm-alpha|Model selection.bib>
    <\bib-list|2>
      <bibitem*|Bis06><label|bib-bishop_pattern_2006>Christopher<nbsp>M.<nbsp>Bishop.<newblock>
      <with|font-shape|italic|Pattern recognition and machine
      learning>.<newblock> Information science and statistics. Springer,
      1<localize| edition>, aug 2006.<newblock>

      <bibitem*|Mac05><label|bib-mackay_information_2005>David<nbsp>J.C.<nbsp>MacKay.<newblock>
      <with|font-shape|italic|Information theory, inference, and learning
      algorithms>.<newblock> Cambridge University Press, Version 7.2 (4th
      printing)<localize| edition>, mar 2005.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|font|stix>
    <associate|font-base-size|12>
    <associate|info-flag|detailed>
    <associate|math-font|math-stix>
    <associate|page-medium|paper>
    <associate|preamble|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|4|7>>
    <associate|auto-11|<tuple|4.1|7>>
    <associate|auto-12|<tuple|4.2|8>>
    <associate|auto-13|<tuple|4.3|8>>
    <associate|auto-14|<tuple|4.4|9>>
    <associate|auto-15|<tuple|3|10>>
    <associate|auto-16|<tuple|4.5|10>>
    <associate|auto-17|<tuple|5|11>>
    <associate|auto-18|<tuple|6|13>>
    <associate|auto-19|<tuple|6.1|13>>
    <associate|auto-2|<tuple|2|3>>
    <associate|auto-20|<tuple|6.2|14>>
    <associate|auto-21|<tuple|6.3|14>>
    <associate|auto-22|<tuple|7|15>>
    <associate|auto-23|<tuple|7.1|15>>
    <associate|auto-24|<tuple|4|15>>
    <associate|auto-25|<tuple|7.2|16>>
    <associate|auto-26|<tuple|5|16>>
    <associate|auto-27|<tuple|7.3|16>>
    <associate|auto-28|<tuple|6|17>>
    <associate|auto-29|<tuple|6|17>>
    <associate|auto-3|<tuple|2.1|4>>
    <associate|auto-30|<tuple|7.3|17>>
    <associate|auto-31|<tuple|6.7|17>>
    <associate|auto-32|<tuple|6.8|?>>
    <associate|auto-4|<tuple|1|4>>
    <associate|auto-5|<tuple|3|5>>
    <associate|auto-6|<tuple|3.1|5>>
    <associate|auto-7|<tuple|2|6>>
    <associate|auto-8|<tuple|3.2|6>>
    <associate|auto-9|<tuple|3.3|7>>
    <associate|bib-bishop_pattern_2006|<tuple|Bis06|17>>
    <associate|bib-mackay_information_2005|<tuple|Mac05|17>>
    <associate|eq:batchcoin|<tuple|13|9>>
    <associate|eq:datum-given-model|<tuple|9|6>>
    <associate|eq:independence|<tuple|6|5>>
    <associate|eq:iterativecoin|<tuple|15|11>>
    <associate|eq:joint-data-params|<tuple|7|6>>
    <associate|eq:laplace-A|<tuple|11|7>>
    <associate|eq:laplace-method|<tuple|10|7>>
    <associate|eq:model-quotient|<tuple|4|5>>
    <associate|eq:model-update|<tuple|5|5>>
    <associate|eq:modelselec|<tuple|8|6>>
    <associate|eq:param-inf|<tuple|2|3>>
    <associate|eq:param-inf-nonrec|<tuple|1|3>>
    <associate|eq:prob-datum-coin|<tuple|12|8>>
    <associate|eq:recursive|<tuple|14|10>>
    <associate|eq:update|<tuple|15|10>>
    <associate|eq:wmap|<tuple|3|4>>
    <associate|eq:wml|<tuple|<with|mode|<quote|math>|\<bullet\>>|?>>
    <associate|fig:indep|<tuple|2|6>>
    <associate|fig:pgm|<tuple|1|?>>
    <associate|fig:priorSucc|<tuple|1|4>>
    <associate|footnote-1|<tuple|1|1>>
    <associate|footnote-2|<tuple|2|4>>
    <associate|footnote-3|<tuple|3|15>>
    <associate|footnote-4|<tuple|4|?>>
    <associate|footnote-5|<tuple|5|?>>
    <associate|footnr-1|<tuple|1|1>>
    <associate|footnr-2|<tuple|2|4>>
    <associate|footnr-3|<tuple|3|15>>
    <associate|footnr-4|<tuple|4|?>>
    <associate|footnr-5|<tuple|5|?>>
    <associate|im:fig1|<tuple|4|15>>
    <associate|im:fig2|<tuple|5|16>>
    <associate|im:fig3|<tuple|6|17>>
    <associate|sec:introduction|<tuple|1|1>>
    <associate|sec:laplace-method|<tuple|3.3|7>>
    <associate|sec:model-selection|<tuple|3|5>>
    <associate|sec:modelselec|<tuple|4.3|8>>
    <associate|sec:parameter-inference|<tuple|2|3>>
    <associate|sec:quasi-iterative|<tuple|3.2|?>>
    <associate|sec:why-not|<tuple|3.1|5>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      bishop_pattern_2006

      mackay_information_2005

      mackay_information_2005

      bishop_pattern_2006
    </associate>
    <\associate|figure>
      <tuple|normal|Bayesian updating: posteriors become new
      priors|<pageref|auto-4>>

      <tuple|normal|Bayesian net for i.i.d. data|<pageref|auto-7>>

      <tuple|normal|Model selection for a bent coin
      (<with|mode|<quote|math>|p<around*|(|<with|mode|<quote|text>|``Heads''>|)>=0.55>)
      for 1000 tosses. Initially, the slight imbalance between the number of
      heads and tails can be explained perfectly by a fair coin, so this
      hypothesis is strongly supported. After <with|mode|<quote|math>|600>
      tosses, the probability that the coin is in fact bent gets more and
      more support.|<pageref|auto-15>>

      <tuple|normal| Data generated by a polynomial of order
      2.|<pageref|auto-24>>

      <tuple|normal|Trigonometric data generator, high noise and long
      time-scale.|<pageref|auto-26>>

      <tuple|normal|Trigonometric data generator, low noise and long
      time-scale|<pageref|auto-28>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1.<space|2spc>Introduction:
      different models for linear regression>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2.<space|2spc>Parameter
      inference> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1.<space|2spc>Method and the difference
      between ML and MAP <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3.<space|2spc>Model
      selection> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1.<space|2spc>Why (naive) iterative model
      selection does not work <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2.<space|2spc>Correct model selection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|3.3.<space|2spc>Laplace's method
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.<space|2spc>An
      easy example: is this coin bent?> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|4.1.<space|2spc>Model
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|4.2.<space|2spc>Parameter inference
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|4.3.<space|2spc>Iterative model selection.
      Why it cannot work <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <with|par-left|<quote|1tab>|4.4.<space|2spc>Model selection: \Pbatch\Q
      approach <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|1tab>|4.5.<space|2spc>Model selection:
      Quasi-iterative approach <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-16>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5.<space|2spc>Influence
      of the race on the imposition of the death penalty>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6.<space|2spc>Bayesian
      Model Selection for Linear Regression>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-18><vspace|0.5fn>

      <with|par-left|<quote|1tab>|6.1.<space|2spc>Setting
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-19>>

      <with|par-left|<quote|1tab>|6.2.<space|2spc>Iterative parameter
      estimation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>

      <with|par-left|<quote|1tab>|6.3.<space|2spc>Model selection
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7.<space|2spc>Simulation
      results> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-22><vspace|0.5fn>

      <with|par-left|<quote|1tab>|7.1.<space|2spc>Low noise, quadratic growth
      data <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-23>>

      <with|par-left|<quote|1tab>|7.2.<space|2spc>High noise, long range
      oscillating data <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-25>>

      <with|par-left|<quote|1tab>|7.3.<space|2spc>Low noise, short range
      oscillatory data <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-27>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-29><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>