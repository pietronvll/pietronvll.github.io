#import "alta-typst.typ": alta, term, skill, paper

#alta(
  name: "Pietro Novelli",
  links: (
    (name: "email", link: "mailto:pietronvll@gmail.com"),
    (name: "github", link: "https://github.com/pietronvll", display: "@pietronvll"),
    (name: "linkedin", link: "https://www.linkedin.com/in/pietro-novelli-37a622190/", display: "Pietro Novelli"),
    // (name: "twitter", link: "https://twitter.com/pie_novelli", display: "@pie_novelli"),
    // (name: "scholar", link: "https://scholar.google.com/citations?user=bXlwJucAAAAJ", display: "Scholar page"),
    (name: "website", link: "https://pietronvll.github.io/", display: "pietronvll.github.io")
  ),
  tagline: [I am a postdoc in M. Pontil's lab, working on statistical learning theory and machine learning for science. My main research focus is on ML methods for stochastic processes & dynamical systems. Concurrently, I collaborate with M. Parrinello's group to develop ML methods for atomistic simulations. In a previous life, I got a PhD in theoretical condensed matter physics on the quantum many-body properties of 2D materials.],
  content: [
    == Research
    #text(rgb("#666666"), size: 9pt)[_In the pdf version of this document, the title of each paper holds a link to the paper itself._]\
    ==== 2025
    / To appear: (Submitted to NeurIPS 2025)  _#link("#")[Self-Supervised Evolution Operator Learning for High-Dimensional Dynamical Systems]_
    / To appear: (Submitted to NeurIPS 2025) _#link("#")[Bridging Self-Supervised Representation Learning Losses via Functional CCA]_
    / ArXiv: (Submitted to npj computational materials) _#link("https://arxiv.org/abs/2505.05652")[Fast and Fourier Features for Transfer Learning of Interatomic Potentials]_
    / ICML 2025: _#link("https://arxiv.org/abs/2410.14477")[Laplace Transform Based Low-Complexity Learning of Continuous Markov Semigroups]_

    ==== 2024

    / ML4PS workshop, NeurIPS 2024:  _#link("#")[Fine-tuning Foundation Models for Molecular Dynamics: A Data-Efficient Approach with Random Features]_
    / NeurIPS 2024: _#link("https://arxiv.org/abs/2406.19861")[Operator World Models for Reinforcement Learning]_
    / NeurIPS 2024: _#link("https://arxiv.org/abs/2407.01171")[Neural Conditional Probability for Inference]_
    / ICML 2024: _#link("https://arxiv.org/abs/2312.13426")[Consistent Long-Term Forecasting of Ergodic Dynamical Systems]_
    / L4DC 2024: _#link("https://arxiv.org/abs/2312.07457")[Dynamics Harmonic Analysis of Robotic Systems: Application in Data-Driven Koopman Modelling]_.
    / ICLR 2024: _#link("https://arxiv.org/abs/2307.09912")[Learning invariant representations of time-homogeneous stochastic dynamical systems]_.
    / ArXiv: (Submitted to SIMODS) _#link("https://arxiv.org/abs/2312.17348")[A randomized algorithm to solve reduced rank operator regression]_.
    ==== 2023
    / NeurIPS 2023 - _spotlight_ paper (3.06% of all submissions): _#link("https://arxiv.org/abs/2302.02004")[Koopman Operator Learning: Sharp Spectral Rates and Spurious Eigenvalues]_. 
    / NeurIPS 2023: _#link("https://arxiv.org/abs/2306.01589")[Transfer learning for atomistic simulations using GNNs and kernel mean embeddings]_.
    / NeurIPS 2023: _#link("https://arxiv.org/abs/2306.04520")[Estimating Koopman operators with sketching to provably learn large scale dynamical systems]_.
  

    ==== 2022    
    / NeurIPS 2022: _#link("https://arxiv.org/abs/2205.14027")[Learning dynamical systems via koopman operator regression in reproducing kernel hilbert spaces]_. 
    / NeurIPS 2022 - workshop on ML for physical sciences: _#link("https://arxiv.org/abs/2211.06678")[Learning dynamical systems: an example from open quantum system dynamics]_.
    / JCTC: _#link("https://arxiv.org/abs/2204.07391")[Characterizing metastable states with the help of machine learning]_.
    / Nano Letters: _#link("https://arxiv.org/abs/2203.15422")[Moiré-Induced Transport in CVD-Based Small-Angle Twisted Bilayer Graphene]_.

    ==== 2019-2021
    / Nature Physics: _#link("https://arxiv.org/abs/1910.07893")[Observation of interband collective excitations in twisted bilayer graphene]_.
    / Phys. Rev. B: (Editors' suggestion) _#link("https://arxiv.org/abs/2005.09529")[Optical and plasmonic properties of twisted bilayer graphene: Impact of interlayer tunneling asymmetry and ground-state charge inhomogeneity]_.
    / Phys. Rev. Lett.: (Featured in "Physics" & Editors' suggestion) _#link("https://arxiv.org/abs/1806.10344")[Failure of conductance quantization in two-dimensional topological insulators due to nonmagnetic impurities]_.

    == Talks and public outreach
    - March 2025: *Talk at DIAG (La Sapienza, Rome)*
    - January 2025: I wrote #link("https://pietronvll.github.io/the-operator-way.html")[*The Operator Way*], a non-technical blog post describing operator-based methods for dynamical systems.
    - July 2024: *Invited talk (Field Institute, Toronto):* Fourth Symposium on Machine Learning and Dynamical Systems
    - June 2024: *Invited junior talk:* International Conference on Statistics and Related Fields in honor of Vladimir Koltchinskii 
    - January 2024: *Talk at CMAP (École Polytechnique Paris)*
    - December 2023: *Second place at Meta's _Open Catalyst Challenge '23_*. The 2023 challenge consisted of finding the global adsorption energy of 200 given adsorbate/catalyst pairs. Invited to present our approach at the _NeurIPS AI for Science Workshop 2023_.
    - November 2023: *Talk at Newcastle University* 
    - April 2023: *Talk at `ultracold` seminar on Quantum Physics and Machine Learning* (Stockholm University)
    - November 2022: *Talk at Gatsby Unit (UCL)*
    - *Invited, with L. Bonati, to the _Theoretical Biophysics Podcast_* to discuss our paper on interpreting metastable states with machine learning. \ Link: #link("https://open.spotify.com/episode/5PO9gHZAg8VNFPdjpfRPcp?si=5Ahjj4jHT8SvE7Dg8mu-mQ")[`https://open.spotify.com/episode/5PO9gHZAg8VNFPdjpfRPcp?si=5Ahjj4jHT8SvE7Dg8mu-mQ`]
    - Organizer of a *reading group on the book _High-Dimensional Probability_* by Roman Vershynin. 
    - My *paper on 2D topological insulators was featured in _Physics Magazine_*, an online magazine from the American Physical Society "focusing on results that will change the course of research, inspire a new way of thinking, or spark curiosity". \ Link: #link("https://physics.aps.org/articles/v12/s1")[`https://physics.aps.org/articles/v12/s1`]
    - May 2019: *Contributed talk at the Capri Spring School on Transport in Nanostructures*

    == Grants
    / 2025: CINECA Iscra C grant (ERLO) --- 80000 Compute Hours on the Leonardo Supercomputer

    / 2025: CINECA Iscra C grant (LR4LSDS) --- 80000 Compute Hours on the Leonardo Supercomputer

    / 2025: Lambda Labs --- \$1000 in Cloud Credits.

    / 2024: Google Cloud Research Grants --- \$5000 in Cloud Credits to develop `kooplearn`.

    / 2023: ELISE mobility grant (GA no 951847) --- €2500.


    == Education

    === Scuola Normale Superiore

    _PhD in Nanosciences_\
    #term[Nov 2016 --- Oct 2020][Pisa, IT]
        	
    Thesis: Electron-electron interaction effects in the optical and transport properties of 2D materials beyond graphene. \ 
    _Honors: summa cum laude_

    === University of Pisa

    _Master's degree in Theoretical Physics_\
    #term[Sep 2014 --- Oct 2016][Pisa, IT]

    Thesis: Quantum pumping in thermoelectric systems. \
    _Honors: summa cum laude, average grade 29.25/30._

    === Additional courses & schools
    - *Convex optimization* \ (Jul 2020, University of Genoa)
    - *RegML2020* \ (Jun 2020, MaLGa center, Genoa)
    - *Numerical analysis and Optimization* \ (2019 --- 2020, Scuola Normale Superiore, grade 30/30)
    - *Spring School on Transport in Nanostructures* - contributed talk \ (May 2019, Capri)
    - *Cargése school in 2D materials* \ (Apr 2018, Cargése (FR))
    - *Quantum information I & II* \ (2016 --- 2017, Scuola Normale Superiore, grade 28/30)
    - *Theory of many body systems* \ (2016 --- 2017, Scuola Normale Superiore, grade 30/30)
    
    == Mobility
    / UCL (London, Jun - Jul 2023): Research activity in collaboration with C. Ciliberto. Financed by the ELISE mobility grant (GA no 951847).
    / ICFO (Barcelona, Feb 2019): Research activity in collaboration with the experimental group of Prof. F.H.Koppens.
    / Université Paris-Saclay (Paris, Apr 2019): Invited to the "Laboratoire de physique des solides" at the University of Paris Sud for a 1-month research activity in the group of Prof. M.O. Goerbig.

    == Code
    - `franken`: A Python library to train interatomic potentials via transfer learning and random features.

    - `linear-operator-learning`: A Python library for operator learning.
    
    - `kooplearn`: A Python library to learn Koopman operators.

    - `ml-confs`: A tiny Python library to handle configurations for machine learning pipelines.

    - `pybandstructure` (with I. Torre): A Python package to compute the band structure of simple periodic Hamiltonians, including tight binding or plane waves models. The package includes submodules to extract thermodynamical properties, density of states, and optical conductivity.
  ]
)