---
title: 'cryptotrackr: An R Interface to Crypto Data Sources'
tags:
  - R
  - cryptocurrency
  - finance
  - blockchain
  - bitcoin
authors:
  - name: Trevor French
    orcid: 0000-0002-6246-2249
    affiliation: "1"
affiliations:
 - name: Independent Researcher, USA
   index: 1
date: 10 December 2023
bibliography: paper.bib
---

# Summary

Cryptocurrency represents an observable and potentially growing role in the global economy. This necessitates the development of tools to measure and analyze the economic activity that takes place in this domain. In response to this need, the `cryptotrackr` [@French2022] package offers a practical solution, addressing the demand for efficient and streamlined data retrieval and preparation in cryptocurrency analysis.

The R package `cryptotrackr` provides a comprehensive interface to various cryptocurrency APIs through both public and private methods to cater to diverse user needs. Public methods are accessible for tasks such as portfolio tracking and high-level analyses, while private methods, requiring authentication, provide extended functionality, including account specific insights and professional grade data sets.

# Statement of Need

The `cryptotrackr` package addresses the demand for efficient data retrieval and preparation in cryptocurrency analysis. `cryptotrackr` simplifies the process of making both public and private API calls, providing users with a user-friendly interface to delve into advanced analytics, even in cases where comprehensive documentation for R environments may be limited.

While existing packages such as `bittrex` [@Kane2017] focus on individual markets, there remains a notable absence of dedicated R interfaces for a diverse array of markets, hindering the ability to compare data across them. Unlike counterparts in other programming languages, such as `ccxt` [Kroitor2022] for JavaScript, TypeScript, Python, C#, and PHP, a widely available resource specifically built for the R programming language is still missing. `cryptotrackr` seeks to contribute to filling this void, providing R users with a tailored solution for navigating the complexities of cryptocurrency data and analysis.

# References