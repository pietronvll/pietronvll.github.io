Title: The Operator Way
Description: A paradigm to rethink dynamical processes
Date: 2024-12-16 12:00
Tags: 

## A paradigm to rethink dynamical processes
<img src="tow_animation.gif" style="max-width:600px;" alt="The Operator Way" autoplay>

- How to sensibly choose the next word to complete this unfinished — ?
- How much time it takes, on average, for a new experimental drug to bind to the human organism?
- How can self-driving vehicles drive safely at all?
 
These seemingly random questions are tied together by the common thread of understanding how things *evolve*. Words follow each other in patterns that create meaning. Molecules navigate the human body according to the laws of atomic physics. And traffic flows through our cities in largely predictable patterns, determining our driving actions.

Understanding evolution in this broad sense is no small feat. I'll take up the challenge by describing a paradigm that characterizes all sorts of evolving processes, and no, this is not yet another take on [transformers](https://en.wikipedia.org/wiki/Transformer_(deep_learning_architecture)).

The roots of this approach — which I'll call *the operator way* — stretch all the way back to the dawn of quantum mechanics. However, we need to fast-forward to the early 2000s before a critical mass of researchers (from the fields of stochastic processes and applied math) started getting serious with it. Nowadays, the operator way is making its way into the AI era, where its power and elegance are truly brought to bear.

Unfortunately, the most insigthful ideas behind the operator way are hidden beneath a thick coat of abstractions, making it a tough topic to enter. This post is an attempt at describing it in plain, non-technical terms, so that as many as possible can appreciate it and the fresh new perspective it offers on the study of sequential and evolving processes.

<h2 id="dealing-with-change">Dealing with change</h2>
Whenever we observe an evolving process, we might find ourselves wondering what's the rule that ties our observations together, if any. In other words, the fact that $x_{t + 1}$ was observed *after* $x_{t}$ is just a coincidence, or is it the result of a predictable relationship? 

Oftentimes, such a relationship exists. Let's take a look at a couple of examples:

1. **Planetary motion** (*deterministic change*)
Before Einstein's relativity, the best description of planetary orbits came from [Newton's laws of motion](https://en.wikipedia.org/wiki/Newton%27s_laws_of_motion). These are [differential equations](https://en.wikipedia.org/wiki/Differential_equation) which, given the positions and velocities of planets at at any time $t$, can be solved to predict their positions and velocities at a later time $t'$. This is an example of *deterministic* dynamics, where each initial condition leads to a unique and well-defined evolution of the system.
2. **Language** (*stochastic change*)
In [A Mathematical Theory of Communication](https://people.math.harvard.edu/~ctm/home/text/others/shannon/entropy/entropy.pdf), Claude Shannon described how the English language can be approximated by producing letters or words according to their relative frequencies in the natural language. This is a *stochastic* change, where the next state $x_{t + 1}$ (the next word or letter) isn't certain. However, despite being uncertain, the next state abides to a definite conditional probability law $\mathbb{P}(x_{t + 1} | x_{t})$. Incidentally, this principle is also at the core of the large language models fueling the GPTs, Claudes, and Geminis out there.

In machine learning and AI, we make use of observations and data to extract *models* describing their inter-relationships. In the case of evolving processes, there are three good reasons to go after a good *dynamical* model: 

- **Interpretability**: understanding *how* $x_{t} \to x_{t + 1}$.
- **Prediction**: *forecasting* $x_{t + 1}$ or $\mathbb{P}[x_{t + 1}]$, having observed $x_{t}$.
- **Control**: nudging the system toward a desired state $x_{t +1}$, starting from $x_{t}$.
<h3 id="linear-models">The case of <em>linear</em> models</h3>
A set of observations $x_{t}$ is said to evolve *linearly* when its rate of change does not depend on the current value $x_{t}$. As an example of linear evolution, imagine that at any time $t$ we lend some amount of money $x_{t}$ at a fixed rate of 3% [^1]. After one year, the value of our investment $x_{t + 1}$ will be increased by 3%, irrespectively of the initial amount invested. 

>**A bit of math.** So far, I haven't bothered defining what our observations $x$ *are*. In the following, I will be appeased assuming that any **arbitrary** linear combination $\alpha x + \beta y$ is still a meaningful observation. This assumption can be unpacked into two separate requirements:

>1. It makes sense to multiply $x$ with a number $\alpha$. For example, if $x$ is the amount of our investment in millions, $1000000 \cdot x$ is  our investment in dollars.
>2. Arbitrary sums of two observations $x$ and $y$ yield another observation "of the same kind". As the previous requirement might sound abstract, let me explicitly give you an example when this is **not** satisfied. A lot of data (molecular conformations, social networks, power grids) come in the form of graphs evolving in time, but what does it means to add two graphs together, and how on earth summing two graphs give me another graph?

>Finite-dimensional [euclidean vectors](https://en.wikipedia.org/wiki/Euclidean_vector) clearly satisfy both conditions, but notice that also *functions* $f:\mathbb{R}^{d}\to \mathbb{R}$ can be linearly combined to get... yet another function. If $x_{t}$ satisfies the assumptions above and follows a **linear** evolution, it exists a rule $\mathsf{T}$ such that:

>1. $x_{t + 1} = \mathsf{T}x_{t}$,
>2. $\mathsf{T}(x + y) = \mathsf{T}x + \mathsf{T}y$, 
>3. $\mathsf{T}(\alpha x) = \alpha \mathsf{T}x$.

>I've dubbed such a rule $\mathsf{T}$ as it **T**ransfers $x_{t}$ to $x_{t + 1}$. When $x \in \mathbb{R}^{d}$ is an Euclidean vector, then $\mathsf{T}$ is a $d\times d$ real matrix. In more exotic cases, for example when $x_{t}$ is a *function*, I'll stick to the mathematicians' naming conventions and refer to $\mathsf{T}$ as a ***linear operator***. If you are unfamiliar with the concepts of linear transformations, this video by 3Blue1Brown provides an excellent visual explaination of them <iframe width="560" height="315" style="margin:auto; display:block;" src="https://www.youtube.com/embed/kYB8IZa5AuE?si=i1IpoJUqqEMF5wWA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


If $x_{t}$ evolves linearly, the triad of interpretability, prediction, and control has been completely sorted out by the scientific community, which came up a vast body of elegant and efficient techniques to address these tasks. 

Nonlinear evolutions, on the other hand, are a different beast, with interpretability and control becoming significantly more challenging. This aside on linear systems will be extremely important as we progress. For now, bear with me.
### What does *learning* a dynamics means, anyway?
The taxonomy of models for evolving processes is quite intricate. In the two examples discussed [above](#dealing-with-change), we've seen that a dynamical model can be specified by, for example,

- A set of differential equations.
- A transition probability $\mathbb{P}(x_{t + 1} | x_{t})$.

There are many more options, and *before even trying* to throw some AI at our data hoping to get a model out of it, we have to define a suitable target, that is a mathematical entity that:

1. Can be approximated from data
2. Can be represented, stored, and queried in a computer
3. Unlocks at least one of the tasks in the triad (Interpretability, Prediction, Control)

Coming back to our examples:

- In [symbolic regression](https://en.wikipedia.org/wiki/Symbolic_regression) the target is an analytical equation, which can be approximated from data using tools ranging from genetic algorithms to deep learning. Symbolic regression is the perfect tool to learn deterministic equations such as the aforementioned Newton laws, and it provides extremely interpretable models. Astrophysicists are [already](https://www.ias.edu/news/astrophysicists-weigh-galaxy-clusters-artificial-intelligence) deploying it succesfully in cutting-edge research use cases.
- As I've noted already, large language models approximate a transition probability  $\mathbb{P}(x_{t + 1} | x_{t}, \ldots, x_{0})$ and leverage expressive neural-network architectures[^2] on huge amounts of data to get accurate predictions. Interpreting and controlling language models, however, it is still a formidable task — ever heard of *alignment* and [*mechanistic interpretability*](https://transformer-circuits.pub)?
## The Operator Way
The operator way offers a different option, motivated by the following widely-applicable observation

> It **always** exists a suitable encoding $\phi$ of our observations $x_{t}$ such that $\phi(x_{t})$ evolves **linearly**.

While the previous fact is easy to state, its proof requires a bunch of technicalities. Let's set them aside for a moment, and focus on what it *implies*, instead. As I've explained above, when the evolution $\phi(x_{t}) \to \phi(x_{t + 1})$ is *linear* it means it exists an *operator* $\mathsf{T}$ such that $\phi(x_{t + 1}) = \mathsf{T}\phi(x_{t})$. So, provided the right representation $\phi$, the operator $\mathsf{T}$ encodes the law of evolution of $x_{t}$. 

Now, let me remark that:

- $\mathsf{T}$ is a *definite mathematical entity*, which can be approximated from data by minimizing the linearization error $\Vert \phi(x_{t +1}) - \mathsf{T}\phi(X_{t})\Vert$. Rings any bell?
- The existence of an appropriate linearizing transformation $\phi$ can be proved on *extremely* general grounds, and applies to both deterministic systems via the so-called [Koopman operator](https://en.wikipedia.org/wiki/Composition_operator), and stochastic systems via the Transfer operator.

The operator way acknowledges that dynamical processes can be *linearized* by encoding the dynamical data in a suitable representation $\phi$, and identifies them with the resulting *linear* law of evolution $\mathsf{T}$. Recalling that for linearly evolving processes such as $\phi(x_{t})$, the whole triad of Interpretability, Prediction, and Control can be addressed simultaneously, the operator way becomes a *really compelling* modeling choice. 
## Cool! How do we learn it?
In the introductory paragraph I've argued that the operator way can be happily married to machine learning. How? In a typical machine learning scenario, we have a stream of data $x_{t}, x_{t + 1}, \ldots$ coming at us, and we want to learn a *model* describing the evolving patters of these observations. Following the insights from the operator way, we posit that it exists

1. A *representation* $\phi(x)$ of the data, and
2. A *latent linear model* $\mathsf{T}$ such that $\phi(x_{t +1}) = \mathsf{T}\phi(x_{t}).$

Now, suppose someone gave us $\phi$. In this case, $\mathsf{T}$ can be approximated from data by minimizing the sum of the squared errors ${\rm Error}(\mathsf{T}) = \sum_{t} \Vert \phi(x_{t +1}) - \mathsf{T}\phi(x_{t})\Vert^{2}$. For any reader with some data-science experience: this is just an instance of multivariate linear regression, where $\phi(x_{t + 1})~\big(\phi(x_{t})\big)$ are the dependent (independent) variables, respectively.

When $\phi$ is known, approximating $\mathsf{T}$ from data is a well-specified problem, which can be solved efficiently. On the other hand, when a suitable transformation $\phi$ is unknown, one can bootstrap the whole process learning both $\phi$ and $\mathsf{T}$ from data. This is a more challenging scenario than approximating $\mathsf{T}$ alone, but a number of compelling options are already available[^3].

There is a catch in all of this. The catch lies in the nature of the linearizing representation $\phi$. The theory says it exists, but it also says that it might be *infinite dimensional* — if you're uncomfortable with infinities, just picture yourself $\phi(x_{t})$ as an euclidean vector with an infinite number of components. Pretty impractical to store in a computer. 

Luckily, this is just a problem *in theory*, and can be effectively circumvented:

- [Kernel methods](https://arxiv.org/abs/1605.09522), while not fashionable as they used to be, offer a viable framework to learn with infinite-dimensional representations.
- Finite-dimensional representations usually incur little errors, when learned from data with one of the approaches mentioned above.

As we approach the end of this post, allow me just few more lines to describe how the operator way originated in the early days of quantum mechanics. You'll be surprised (hopefully even awed) to see how it emerged from a **completely different way of thinking** evolving processes!
## The Operator Way and Quantum Mechanics.
It's 1931, the foundations of quantum mechanics have been laid down just few years ago. In this novel view of nature, a physical system is entirely described by its so-called *state* $x$, which in practice is an Euclidean vector or a function[^4]. The state $x_{t}$ provides information on the system, at a given time $t$. Nowadays we have [quantum state tomography](https://en.wikipedia.org/wiki/Quantum_tomography), but in 1931 the experimental physicists couldn't measure the state of a quantum system directly. Rather, they were able to measure only some properties of it. Since the state $x_{t}$ encodes every information of the system, what experimentalists could observe in their labs were *functions* of the state $f(x_{t})$, oftentimes called *observables*. Notice that this way of thinking is not restricted to atomic physics, and can be applied to many diverse domains. For example, have you ever thought that Google Maps don't actually need to know precisely where you are? It only needs measurements of the position of a bunch of GPS satellites to triangulate you, and give an estimate of your position.

Let's jump back to 1931, when the mathematician Bernard Koopman noticed that thinking in terms of observables can be useful even outside the domain of quantum mechanics. In his own words: 

> In recent years the theory of Hilbert space and its linear transformations has come into prominence. [...] the importance of the theory in quantum mechanics is known to all. It is the object of [this note](https://www.pnas.org/doi/10.1073/pnas.17.5.315) to outline certain investigations of our own in which the domain of this theory has been extended in such a way as to include classical Hamiltonian mechanics, or, more generally, systems defining a steady n-dimensional flow of a fluid of positive density.

Let's follow this hunch, and assume that the evolution of the state $x_{t} \to x_{t + 1}$ is determined by a *possibly non-linear* rule $S$ so that $x_{t + 1} = S(x_{t})$. Now let's pick any observable $f$. Recalling that $f$ is just a function of the state, we have that $f(x_{t + 1}) = f(S(x_{t}))$. In summary, the original observable $f$ evaluated at $x_{t + 1}$ equates to the composition of $f$ with the dynamical rule $S$, evaluated at $x_{t}$. Using a common notation let me write $f \circ S$ as the composition of $f$ and $S$. Notice that $f\circ S$ is just another function of the state, that is, *another observable*. This composition property is [linear](#linear-models), meaning that if take an arbitrary linear combination of observables $\alpha f + \beta g$, the composition with $S$ preserves it:

$$(\alpha f + \beta g)(x_{t +1}) = \alpha f(x_{t + 1}) + \beta g(x_{t +1}) = \alpha (f\circ S)(x_{t}) + \beta (g \circ S)(x_{t}) = \big\[(\alpha f + \beta g) \circ S \big\](x_{t}).$$ 

So, the evolution of observables can be expressed as a *linear rule* mapping observables to observables, let me denote it $\mathsf{T}\_{S}$. The operator $\mathsf{T}\_{S}$ acts on an observable $f$ as

$$f(x_{t + 1}) = (\mathsf{T}\_{S}f)(x_{t}) := f(S(x_{t})).$$

If we happen to know $\mathsf{T}\_{S}$, we automatically have a *linear* description of the evolution process *as a whole*, for any arbitrary observable. This is the operator way, once again, quantum-mechanics edition. 

To actually show that this formulation of the operator way is equivalent to the first one I gave, we need just a small additional step. We need to conceive observables as abstract objects $f$, which can be queried at any point $x$ by an *evaluation* object[^5], which I'll denote — for NO REASON at all 🙈 — $\phi(x)$, and let me denote this evaluation procedure as a scalar product $f(x) = \langle f, \phi(x)\rangle$. In this notation,

$$f(x_{t + 1}) = \langle f, \phi(x_{t + 1})\rangle = (\mathsf{T}\_{S}f)(x_{t}) = \langle \mathsf{T}\_{S}f, \phi(x_{t})\rangle = \langle f, \mathsf{T}\_{S}^{*}\phi(x_{t})\rangle$$

If you swallowed this, recalling that the relation above holds for any observable $f$, we have that

$$\phi(x_{t + 1}) = \mathsf{T}\_{S}^{*}\phi(x_{t})$$

## What's next?

If you've made up this far, thank you! Writing a blog post was a first time for me; if you have any comments, questions, or complaints feel free to reach out, I'll be happy to answer! 

In a tentative next post, I'd like to present the most interesting applications of the operator way to date, spanning areas such as

- Molecular dynamics
- Robotics
- Reinforcement Learning
- Climate Science
- Neural Networks' interpretability

[^1]: For example through a government bond.
[^2]: Like transformers or state space models.
[^3]: See, for example, [Lush et al.](https://arxiv.org/abs/1712.09707) using an autoencoding scheme, [Mardt et al.](https://arxiv.org/abs/1710.06012) using an approach linked to canonical correlation analyisis, or [these](https://arxiv.org/abs/2307.09912) [methods](https://arxiv.org/abs/2407.01171) by yours truly.
[^4]: Physicists, often refer to the state as the *wave-function* of the system.
[^5]: I'm being extra-sloppy here, apologies to the analysts.