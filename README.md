<h1 align="center"><a href="https://zeruic.me">Hi, I'm Zerui / 泽瑞</a></h1>
<h3 align="center">CS Cambridge · Researcher · Software</h3>

<p align="center">
    Final-year CS at Cambridge. I work on LLM-driven automated discovery: how search systems find solutions, where they go wrong,
    and how to identify and address their gaps. Also researching on novel sequence-model architectures and optimization methods.
</p>

<p align="center">
    <a href="https://zeruic.me">zeruic.me</a> ·
    <a href="https://scholar.google.com/citations?hl=en&user=N3_D8QQAAAAJ">Scholar</a> ·
    <a href="https://www.linkedin.com/in/zerui-chen-241015204/">LinkedIn</a> ·
    <a href="https://zeruic.me/assets/resume.pdf">Résumé</a> ·
    <a href="mailto:hi@zeruic.me">Email</a>
</p>

<br/>

<h3>Research</h3>

<table width="100%">
    <!-- Header -->
    <tr>
        <th width="22%">Paper</th>
        <th width="auto">TLDR</th>
        <th width="18%">Venue</th>
    </tr>
    <!-- Search Pathology Diagnosis -->
    <tr>
        <td>
            Search Pathology Diagnosis for Automated Discovery
            <br/><sub>Alistair Cheong* · Zerui Chen* (*equal contribution)</sub>
        </td>
        <td>
            Automated discovery systems are usually compared on the score of their best artifact, which says little about the search that produced it.
            We introduce the provenance hypergraph, a system-agnostic abstraction of a search trace, and detectors for two pathologies on it:
            redundant rediscovery (an exploration failure) and poorly grounded next steps (an exploitation failure), selected on five released meta-evaluation datasets.
            Applied to our open re-implementation of TTT-Discover on the Erdős minimum-overlap problem, the readings guided a memory intervention
            that reached the baseline's final score with 28% fewer solutions, and diagnosed why a second intervention failed.
            To be released as ADSInspector, an ADS-agnostic Python package, after notification.
            Case-study system: <a href="https://github.com/cheongalc/nanodiscover">nanodiscover</a>.
        </td>
        <td>
            Under review · NeurIPS 2026 workshops · Sep 2026
        </td>
    </tr>
    <!-- Evolution Fine-Tuning -->
    <tr>
        <td>
            <a href="https://arxiv.org/abs/2606.29082">Evolution Fine-Tuning: Learning to Discover Across 371 Optimization Tasks</a>
            <br/><sub>Young-Jun Lee · Seungone Kim · Minki Kang · Alistair Cheong · Zerui Chen · Seungho Han · Taehee Jung · Dongyeop Kang</sub>
        </td>
        <td>
            EFT is a mid-training paradigm that teaches LLMs to evolve solutions across tasks by converting evolutionary-search trajectories into supervision:
            a 156K-trajectory dataset over 371 tasks in 10 domains, with fine-tuned 2B–9B models gaining +10.2% on average across 22 held-out tasks and,
            paired with test-time RL, matching state-of-the-art on two circle-packing tasks.
            My part: nanodiscover was the test-time-RL scaffold behind the test-time-RL results.
        </td>
        <td>
            Oral · <a href="https://ai-discovery-in-the-wild.github.io/papers.html">AID-Wild Workshop @ ACM CAIS 2026</a> · May 2026
        </td>
    </tr>
</table>

<h3>I'm currently working on</h3>

<p>Now · Sep 2026 — Quant research intern at WorldQuant, interday equity forecasting.</p>

<table width="100%">
    <tr>
        <th width="15%">Repo</th>
        <th width="auto">TLDR</th>
        <th width="auto">Tech</th>
    </tr>
    <!-- ADSInspector -->
    <tr>
        <td>
            ADSInspector <sub>(after notification)</sub>
        </td>
        <td>
            The abstraction, detectors and meta-evaluation datasets from the search-pathology paper as an ADS-agnostic Python package:
            translate any automated discovery system's native search trace into a provenance hypergraph, read off where and how often the search goes wrong, then intervene.
        </td>
        <td>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" height="30px" alt="python"/>
            <p> Provenance hypergraphs, pathology detectors, meta-evaluation datasets </p>
        </td>
    </tr>
    <!-- Calculemus -->
    <tr>
        <td>
            Calculemus <sub>(private for now)</sub>
        </td>
        <td>
            An epistemic runtime for research agents: persistent, revision-tracked research state that agents read, extend and revise under human-owned policies,
            built to run my own deep-learning research and prove itself by its outputs.
        </td>
        <td>
            <p> Knowledge graphs, agent harnesses, git-tracked state </p>
        </td>
    </tr>
</table>

<h3>My favorite projects</h3>

<table width="100%">
    <!-- Header -->
    <tr>
        <th width="15%">Repo</th>
        <th width="auto">TLDR</th>
        <th width="auto">Tech</th>
    </tr>
    <!-- nanodiscover -->
    <tr>
        <td>
            <a href="https://github.com/cheongalc/nanodiscover">nanodiscover</a>
        </td>
        <td>
            An open re-implementation of <a href="https://arxiv.org/abs/2601.16175">TTT-Discover</a>, a state-of-the-art test-time-learning discovery system
            (evolutionary search with an LLM proposer that the reference system trains online). Replaces the Tinker API dependency (~$500 per problem)
            with local vLLM/DeepSpeed/Ray inference and training, fixes upstream bugs, and reproduces the published results up to sampling stochasticity.
            Adopted as the test-time-RL scaffold in <a href="https://arxiv.org/abs/2606.29082">Evolution Fine-Tuning</a>
            (co-authored, Oral at AID-Wild @ ACM CAIS 2026) and the case-study system in our search-pathology paper.
        </td>
        <td>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" height="30px" alt="python"/>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-original.svg" height="30px" alt="shell"/>
            <p> Ray+vLLM, DeepSpeed, Slurm, AWS </p>
        </td>
    </tr>
    <!-- zlab -->
    <tr>
        <td>
            <a href="https://github.com/Zerui18/zlab">zlab</a>
        </td>
        <td>
            A <b>modular deep learning research platform</b> for rapid experimentation with transformer architectures, enabling systematic ablation studies across attention mechanisms, positional encodings, and training configurations via a registry-driven composition system. Designed for seq2seq tasks (machine translation, speech-to-text) with built-in experiment management for grid search and metric-tracked evaluation.
        </td>
        <td>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" height="30px" alt="python"/>
            <p> PyTorch+Lightning, Pandas </p>
        </td>
    </tr>
    <!-- Frame -->
    <tr>
        <td>
            <a href="https://github.com/Zerui18/Frame">Frame</a> &
            <a href="https://github.com/Zerui18/FrameApp">Frame App</a>
        </td>
        <td>
            An iOS jailbroken tweak, app, and cli to play videos as wallpaper on lock & home screens. Performance optimized & video catalogue built-in.
            Checkout the release posts on Reddit to see it in action:
            <a href="https://www.reddit.com/r/jailbreak/comments/fevsma/upcoming_frame_20_bring_your_idevice_to_life_with/">V2</a> ·
            <a href="https://www.reddit.com/r/jailbreak/comments/u4mszv/update_frame_30_modern_video_wallpaper_hub_for/">V3</a>
        </td>
        <td>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/swift/swift-original.svg" height="30px" alt="swift"/>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/cplusplus/cplusplus-original.svg" height="30px" alt="c"/>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/objectivec/objectivec-plain.svg" height="30px" alt="objective-c"/>
            <img src="https://avatars.githubusercontent.com/u/17097383?s=30" height="30px" alt="logos"/>
            <p> UIKit, SwiftUI, CoreData, Cydia Substrate </p>
        </td>
    </tr>
    <!-- MML-Book -->
    <tr>
        <td>
            <a href="https://github.com/Zerui18/MML-Book">MML Book</a>
        </td>
        <td>
            Typesetting the full solutions to <a href="https://mml-book.github.io">Mathematics for Machine Learning</a>, implementing with basic NumPy ops the core linear algebra, regression and bayesian inference algorithms.
        </td>
        <td>
            <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/python/python-original.svg" height="30px" alt="python"/>
            <p> NumPy, SymPy, Matplotlib, LaTeX </p>
        </td>
    </tr>
</table>
